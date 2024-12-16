import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from '../auth.service';
import { UserProfileService } from '../user-service.service';

export interface Ingredient {
  ingredient_name: string;
  quantity: number;
  unit: string;
}

export interface PreparationStep {
  step_number: number;
  instruction: string;
  preparation: string;
}

export interface Recipe {
  id: number;
  name: string;
  category: string;
  description: string;
  ingredients_list: {
    ingredient_name: string;
    amount: number;
    unit: string;
  }[];
  preparation_steps: PreparationStep[];
  created_at: string;
  updated_at: string;
  image: string; // Add this line for the image URL
}

export interface ApiResponse<T> {
  success?: boolean;
  error?: string;
  recipe?: T;
}

// Interface for /ingredients endpoint
interface IngredientsResponse {
  success: boolean;
  ingredients: {
    id: number;
    name: string;
  }[];
}

// Interface for /get-ingredients endpoint
interface DetailedIngredientsResponse {
  status: string;
  data: {
    id: number;
    name: string;
    created_at: string;
    updated_at: string;
  }[];
}

@Component({
  selector: 'app-user-profile',
  templateUrl: './user-profile.component.html',
  styleUrls: ['./user-profile.component.scss']
})
export class UserProfileComponent implements OnInit {
  userProfile: any = {};
  userRecipes: Recipe[] = []; // Typed as Recipe array
  
  // Form fields
  username: string = '';
  email: string = '';
  currentPassword: string = '';
  newPassword: string = '';
  confirmPassword: string = '';
  profileImage: File | null = null;

  // Message handling
  successMessage: string = '';
  errorMessage: string = '';
  isEditing: boolean = false;

  constructor(
    private userProfileService: UserProfileService,
    private authService: AuthService,
    private router: Router
  ) {}

  ngOnInit() {
    this.loadUserProfile();
    this.loadUserRecipes();
  }

  loadUserProfile() {
    this.userProfileService.getUserProfile().subscribe(
      (response) => {
        if (response.success) {
          this.userProfile = response.user;
          this.username = this.userProfile.username;
          this.email = this.userProfile.email;
        }
      },
      (error) => {
        this.errorMessage = 'Failed to load user profile';
        this.clearMessagesAfterDelay();
      }
    );
  }

  loadUserRecipes() {
    this.userProfileService.getUserRecipes().subscribe(
      (response: { success: boolean; recipes?: any[] }) => {
        if (response.success) {
          this.userRecipes = (response.recipes || []).map((recipe: any) => {
            // Parse ingredients_list if it's a string
            let ingredientsList = [];
            if (typeof recipe.ingredients_list === 'string') {
              try {
                ingredientsList = JSON.parse(recipe.ingredients_list).map((ingredient: any) => ({
                  ingredient_name: ingredient.ingredient_name || ingredient.name,
                  amount: ingredient.amount || ingredient.quantity,
                  unit: ingredient.unit
                }));
              } catch (error) {
                console.error('Error parsing ingredients list:', error);
                ingredientsList = [];
              }
            } else if (Array.isArray(recipe.ingredients_list)) {
              ingredientsList = recipe.ingredients_list.map((ingredient: any) => ({
                ingredient_name: ingredient.ingredient_name || ingredient.name,
                amount: ingredient.amount || ingredient.quantity,
                unit: ingredient.unit
              }));
            }
  
            // Parse preparation_steps if it's a string
            let preparationSteps = [];
            if (typeof recipe.preparation_steps === 'string') {
              try {
                preparationSteps = JSON.parse(recipe.preparation_steps).map((step: any, index: number) => ({
                  step_number: step.step_number || (index + 1),
                  instruction: step.instruction,
                  preparation: step.preparation || ''
                }));
              } catch (error) {
                console.error('Error parsing preparation steps:', error);
                preparationSteps = [];
              }
            } else if (Array.isArray(recipe.preparation_steps)) {
              preparationSteps = recipe.preparation_steps.map((step: any, index: number) => ({
                step_number: step.step_number || (index + 1),
                instruction: step.instruction,
                preparation: step.preparation || ''
              }));
            }
  
            return {
              ...recipe,
              ingredients_list: ingredientsList,
              preparation_steps: preparationSteps
            };
          });
        }
      },
      (error: any) => {
        this.errorMessage = 'Failed to load user recipes';
        this.clearMessagesAfterDelay();
      }
    );
  }

  // Utility method to format ingredient amount
  formatAmount(amount: number): string {
    // Convert to number
    const numAmount = Number(amount);

    if (isNaN(numAmount)) return amount.toString();

    const commonFractions: { [key: string]: string } = {
      0.25: '¼',
      0.5: '½',
      0.75: '¾',
      0.33: '⅓',
      0.67: '⅔',
      0.125: '⅛',
      0.375: '⅜',
      0.625: '⅝',
      0.875: '⅞'
    };

    if (Number.isInteger(numAmount)) {
      return numAmount.toString();
    }

    const decimal = numAmount % 1;
    const whole = Math.floor(numAmount);
    const roundedDecimal = Math.round(decimal * 100) / 100;

    if (commonFractions[roundedDecimal]) {
      return whole ? `${whole} ${commonFractions[roundedDecimal]}` : commonFractions[roundedDecimal];
    }

    return numAmount.toFixed(2);
  }

  onProfileImageSelected(event: any) {
    const file = event.target.files[0];
    if (file) {
      this.profileImage = file;
    }
  }

  updateProfile() {
    // Validate input
    if (this.newPassword && this.newPassword !== this.confirmPassword) {
      this.errorMessage = 'New passwords do not match';
      this.clearMessagesAfterDelay();
      return;
    }

    // Prepare update data
    const updateData = {
      username: this.username !== this.userProfile.username ? this.username : undefined,
      email: this.email !== this.userProfile.email ? this.email : undefined,
      current_password: this.currentPassword || undefined,
      new_password: this.newPassword || undefined,
      profile_image: this.profileImage || undefined
    };

    this.userProfileService.updateProfile(updateData).subscribe(
      (response) => {
        if (response.success) {
          this.successMessage = 'Profile updated successfully';
          this.isEditing = false;
          this.loadUserProfile(); // Reload profile to get updated data
          this.clearPasswords();
        } else {
          this.errorMessage = response.error || 'Failed to update profile';
        }
        this.clearMessagesAfterDelay();
      },
      (error) => {
        this.errorMessage = 'An error occurred while updating profile';
        this.clearMessagesAfterDelay();
      }
    );
  }

  deleteRecipe(recipeId: number) {
    if (confirm('Are you sure you want to delete this recipe?')) {
      this.userProfileService.deleteUserRecipe(recipeId).subscribe(
        (response) => {
          if (response.success) {
            this.successMessage = 'Recipe deleted successfully';
            this.loadUserRecipes(); // Reload recipes
          } else {
            this.errorMessage = response.error || 'Failed to delete recipe';
          }
          this.clearMessagesAfterDelay();
        },
        (error) => {
          this.errorMessage = 'An error occurred while deleting the recipe';
          this.clearMessagesAfterDelay();
        }
      );
    }
  }

  viewFullRecipe(recipeId: number) {
    // Navigate to recipe view with isUserRecipe parameter set to true
    this.router.navigate(['/view-user-recipe', recipeId], {
        state: { isUserRecipe: true }
    });
}

  editRecipe(recipeId: number) {
    // Navigate to recipe edit page
    this.router.navigate(['/edit-recipe', recipeId]);
  }

  logout() {
    this.authService.logout();
    this.router.navigate(['/login']);
  }

  private clearPasswords() {
    this.currentPassword = '';
    this.newPassword = '';
    this.confirmPassword = '';
  }

  private clearMessagesAfterDelay() {
    setTimeout(() => {
      this.successMessage = '';
      this.errorMessage = '';
    }, 3000);
  }
}