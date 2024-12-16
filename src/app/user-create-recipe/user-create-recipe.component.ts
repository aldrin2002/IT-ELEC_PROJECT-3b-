import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, FormArray, Validators, ValidatorFn, AbstractControl } from '@angular/forms';
import { Router } from '@angular/router';
import { DataService } from '../data.service';
import { AuthService } from '../auth.service';

interface Ingredient {
  id?: number;
  name: string;
}

interface Step {
  instruction: string;
  preparation: string;
}

function fractionValidator(): ValidatorFn {
  return (control: AbstractControl): {[key: string]: boolean} | null => {
    const value = control.value;
    if (!value) return null;
    
    if (!isNaN(value)) return null;
    
    const fractionRegex = /^(\d*\s)?(\d+\/\d+)$/;
    if (!fractionRegex.test(value)) {
      return { 'invalidFraction': true };
    }
    
    const parts = value.trim().split(' ');
    let fractionalPart = parts[parts.length - 1];
    const [numerator, denominator] = fractionalPart.split('/').map(Number);
    
    if (denominator === 0) {
      return { 'divisionByZero': true };
    }
    
    return null;
  };
}

@Component({
  selector: 'app-user-create-recipe',
  templateUrl: './user-create-recipe.component.html',
  styleUrls: ['./user-create-recipe.component.scss']
})
export class UserCreateRecipeComponent implements OnInit {
  recipeForm: FormGroup;
  availableIngredients: Ingredient[] = [];
  measurementUnits: string[] = [
    'cups', 'tablespoons', 'teaspoons', 'grams', 'ounces', 
    'pounds', 'pieces', 'milliliters', 'liters', 'custom'
  ];
  recipeCategories: string[] = [
    'Appetizer', 
    'Main Course', 
    'Dessert', 
    'Salad', 
    'Soup', 
    'Breakfast', 
    'Beverage', 
    'Snack', 
    'Vegetarian', 
    'Vegan', 
    'Gluten-Free'
  ];
  showCustomUnitInput: { [key: number]: boolean } = {};
  showConfirmationModal = false;
  preparedRecipeData: any = null;
  currentUserId: number | null = null;

  authError: string | null = null;
  submissionError: string | null = null;

  constructor(
    private fb: FormBuilder, 
    private dataService: DataService, 
    private router: Router,  
    private authService: AuthService
  ) {
    this.recipeForm = this.initForm();
  }

  ngOnInit(): void {
    this.checkAuthentication();
  }
  
  private async checkAuthentication(): Promise<void> {
    console.log('Checking authentication...');
    
    if (!this.authService.isLoggedIn()) {
      this.redirectToLogin('You must be logged in to access this page.');
      return;
    }

    this.currentUserId = this.authService.getCurrentUserId();
    console.log('Current user ID:', this.currentUserId);

    if (!this.currentUserId) {
      this.redirectToLogin('Unable to retrieve user information. Please log in again.');
      return;
    }

    await this.loadIngredients(); 
  }
  
  private redirectToLogin(errorMessage: string): void {
    this.authService.logout();
    this.router.navigate(['/login'], { 
      queryParams: { error: errorMessage } 
    });
  }  

  private initForm(): FormGroup {
    return this.fb.group({
      name: ['', Validators.required],
      category: ['', Validators.required],
      description: ['', Validators.required],
      ingredients: this.fb.array([]),
      steps: this.fb.array([]),
      recipeImage: [null],
    });
  }

  get ingredients(): FormArray {
    return this.recipeForm.get('ingredients') as FormArray;
  }

  get steps(): FormArray {
    return this.recipeForm.get('steps') as FormArray;
  }

  private createIngredientFormGroup(): FormGroup {
    return this.fb.group({
      ingredientName: ['', Validators.required],
      amount: ['', [Validators.required, fractionValidator()]],
      unit: ['', Validators.required],
      customUnit: [''], 
      isNewIngredient: [true]
    });
  }

  // Method to handle file selection
onImageSelected(event: any): void {
  const file = event.target.files[0];
  if (file) {
    // Validate file type and size
    const allowedTypes = ['image/jpeg', 'image/png', 'image/gif'];
    const maxSize = 5 * 1024 * 1024; // 5MB

    if (!allowedTypes.includes(file.type)) {
      alert('Only JPEG, PNG, and GIF images are allowed.');
      return;
    }

    if (file.size > maxSize) {
      alert('Image must be less than 5MB.');
      return;
    }

    this.recipeForm.patchValue({ recipeImage: file });
  }
}

  addIngredient(): void {
    this.ingredients.push(this.createIngredientFormGroup());
  }

  removeIngredient(index: number): void {
    this.ingredients.removeAt(index);
    delete this.showCustomUnitInput[index];
  }

  onUnitChange(index: number, event: any): void {
    const selectedValue = event.target.value;
    if (selectedValue === 'custom') {
      this.showCustomUnitInput[index] = true;
      const ingredientGroup = this.ingredients.at(index);
      ingredientGroup.patchValue({ 
        unit: '',
        customUnit: ''
      });
      ingredientGroup.get('unit')?.clearValidators();
      ingredientGroup.get('customUnit')?.setValidators(Validators.required);
    } else {
      this.showCustomUnitInput[index] = false;
    }
    
    const ingredientGroup = this.ingredients.at(index);
    ingredientGroup.get('unit')?.updateValueAndValidity();
    ingredientGroup.get('customUnit')?.updateValueAndValidity();
  }

  toggleCustomUnit(index: number): void {
    this.showCustomUnitInput[index] = false;
    const ingredientGroup = this.ingredients.at(index);
    
    ingredientGroup.patchValue({
      unit: '',
      customUnit: ''
    });
    
    ingredientGroup.get('unit')?.setValidators(Validators.required);
    ingredientGroup.get('customUnit')?.clearValidators();
    
    ingredientGroup.get('unit')?.updateValueAndValidity();
    ingredientGroup.get('customUnit')?.updateValueAndValidity();
  }

  getEffectiveUnit(index: number): string {
    const ingredientGroup = this.ingredients.at(index);
    return this.showCustomUnitInput[index] ? 
          ingredientGroup.get('customUnit')?.value : 
          ingredientGroup.get('unit')?.value;
  }

  addStep(): void {
    const stepForm = this.fb.group({
      instruction: ['', Validators.required],
      preparation: ['', Validators.required]
    });
    this.steps.push(stepForm);
  }

  removeStep(index: number): void {
    this.steps.removeAt(index);
  }

  private findExistingIngredient(name: string): Ingredient | undefined {
    return this.availableIngredients.find(
      ing => ing.name.toLowerCase() === name.toLowerCase()
    );
  }

  async loadIngredients(): Promise<void> {
    try {
      const response = await this.dataService.getAvailableIngredients().toPromise();
      console.log('Ingredients Response:', response);

      if (response && response.ingredients && Array.isArray(response.ingredients)) {
        this.availableIngredients = response.ingredients;
      } else {
        console.error('Unexpected response format:', response);
      }
    } catch (error) {
      console.error('Error loading ingredients:', error);
    }
  }
  
  async onSubmit(): Promise<void> {
    this.markFormGroupTouched(this.recipeForm);
    this.submissionError = null;
  
    if (!this.authService.isLoggedIn() || !this.currentUserId) {
      this.checkAuthentication();
      return;
    }
  
    if (!this.recipeForm.valid) {
      this.submissionError = 'Please fill out all required fields correctly.';
      return;
    }
  
    const ingredientErrors = this.validateIngredients();
    if (ingredientErrors.length > 0) {
      console.error('Ingredient Validation Errors:', ingredientErrors);
      return;
    }
  
    const formValue = this.recipeForm.value;
    
    const processedIngredients = formValue.ingredients.map((ing: any, index: number) => {
      const existingIngredient = this.findExistingIngredient(ing.ingredientName);
      
      return {
        ingredient_name: ing.ingredientName,
        amount: this.fractionToDecimal(ing.amount),
        unit: this.getEffectiveUnit(index),
        is_new_ingredient: !existingIngredient
      };
    });
  
    const recipeData = {
      user_id: this.currentUserId,
      name: formValue.name,
      category: formValue.category,
      description: formValue.description,
      preparation_steps: formValue.steps.map((step: any, index: number) => ({
        step_number: index + 1,
        instruction: step.instruction,
        preparation: step.preparation
      })),
      recipe_ingredients: processedIngredients
    };
  
    this.preparedRecipeData = recipeData;
    this.showConfirmationModal = true;
  }

  private markFormGroupTouched(formGroup: FormGroup): void {
    Object.values(formGroup.controls).forEach(control => {
      control.markAsTouched();

      if (control instanceof FormGroup) {
        this.markFormGroupTouched(control);
      } else if (control instanceof FormArray) {
        (control as FormArray).controls.forEach(ctrl => {
          if (ctrl instanceof FormGroup) {
            this.markFormGroupTouched(ctrl);
          } else {
            ctrl.markAsTouched();
          }
        });
      }
    });
  }
  
  private validateIngredients(): string[] {
    const errors: string[] = [];
    const ingredients = this.recipeForm.value.ingredients;
  
    const ingredientNames = ingredients.map((ing: any) => ing.ingredientName.toLowerCase().trim());
    const uniqueIngredients = new Set(ingredientNames);
  
    if (uniqueIngredients.size !== ingredientNames.length) {
      errors.push('Duplicate ingredients are not allowed');
    }
  
    ingredients.forEach((ing: any, index: number) => {
      const amount = this.fractionToDecimal(ing.amount);
      if (amount <= 0) {
        errors.push(`Ingredient ${index + 1}: Amount must be positive`);
      }
    });
  
    return errors;
  }

  fractionToDecimal(fraction: string): number {
    if (!fraction || !isNaN(Number(fraction))) {
      return Number(fraction);
    }
    
    const parts = fraction.trim().split(' ');
    let wholeNumber = 0;
    let fractionalPart = parts[parts.length - 1];
    
    if (parts.length > 1) {
      wholeNumber = parseInt(parts[0]);
    }
    
    const [numerator, denominator] = fractionalPart.split('/').map(Number);
    return wholeNumber + (numerator / denominator);
  }
  
  async handleModalConfirmation(confirmed: boolean): Promise<void> {
    this.showConfirmationModal = false;
    
    if (confirmed) {
      try {
        const savedRecipe = await this.dataService.createUserRecipe(this.preparedRecipeData).toPromise();
        console.log('Full saved recipe response:', savedRecipe);
        
        const recipeResponse = typeof savedRecipe === 'string' ? JSON.parse(savedRecipe) : savedRecipe;
        
        const recipeId = recipeResponse.recipe_id || recipeResponse.id;
        
        if (recipeId) {
          this.router.navigate(['/home']);
        } else {
          console.error('No recipe ID found in response:', recipeResponse);
        }
      } catch (error) {
        console.error('Error saving recipe:', error);
      }
    }
  }
}