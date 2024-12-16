-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 16, 2024 at 07:27 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `recipe_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`id`, `name`, `created_at`, `updated_at`) VALUES
(4, 'Chicken ', '2024-11-20 12:32:38', '2024-11-20 12:32:38'),
(5, 'Soy Sauce', '2024-11-20 12:32:38', '2024-11-20 12:32:38'),
(6, 'Vinegar', '2024-11-20 12:32:38', '2024-11-20 12:32:38'),
(8, 'Bay Leaves', '2024-11-20 12:32:38', '2024-11-20 12:32:38'),
(9, 'Peppercorns', '2024-11-20 12:32:38', '2024-11-20 12:32:38'),
(10, 'Water', '2024-11-20 12:32:38', '2024-11-20 12:32:38'),
(11, 'Cooking Oil', '2024-11-20 12:32:38', '2024-11-20 12:32:38'),
(12, 'Onion', '2024-11-20 12:32:38', '2024-11-20 12:32:38'),
(13, 'Brown Sugar', '2024-11-20 12:32:38', '2024-11-20 12:32:38'),
(14, 'Salt', '2024-11-20 12:32:38', '2024-11-20 12:32:38'),
(17, 'Leftover White Rice ', '2024-11-22 17:49:48', '2024-11-22 17:49:48'),
(18, 'Black Pepper', '2024-11-22 17:49:48', '2024-11-22 17:49:48'),
(20, 'Ground Black Pepper ', '2024-11-22 17:57:12', '2024-11-22 17:57:12'),
(21, 'Toast', '2024-12-05 13:16:54', '2024-12-05 13:16:54'),
(22, 'Olive Oil', '2024-12-09 02:48:50', '2024-12-09 02:48:50'),
(24, 'Eggs ', '2024-12-09 03:18:06', '2024-12-09 03:18:06'),
(25, 'Milk', '2024-12-09 03:18:06', '2024-12-09 03:18:06'),
(26, 'Salt(to taste)', '2024-12-09 03:18:06', '2024-12-09 03:18:06'),
(27, 'Pepper(to taste)', '2024-12-09 03:18:06', '2024-12-09 03:18:06'),
(28, 'Butter', '2024-12-09 03:18:06', '2024-12-09 03:18:06'),
(29, 'Ginger', '2024-12-11 04:32:38', '2024-12-11 04:32:38'),
(30, 'Tomato', '2024-12-11 04:32:38', '2024-12-11 04:32:38'),
(31, 'Chili', '2024-12-11 04:32:38', '2024-12-11 04:32:38'),
(32, 'Coriander', '2024-12-11 04:32:38', '2024-12-11 04:32:38'),
(33, 'Coconut Milk', '2024-12-11 04:32:38', '2024-12-11 04:32:38'),
(34, 'Fish Sauce', '2024-12-11 04:32:38', '2024-12-11 04:32:38'),
(35, 'Lemon', '2024-12-11 04:32:38', '2024-12-11 04:32:38'),
(36, 'Rice Vinegar', '2024-12-11 04:32:38', '2024-12-11 04:32:38'),
(37, 'Sesame Oil', '2024-12-11 04:32:38', '2024-12-11 04:32:38'),
(38, 'Peas', '2024-12-11 04:32:38', '2024-12-11 04:32:38'),
(39, 'Mushrooms', '2024-12-11 04:32:38', '2024-12-11 04:32:38'),
(40, 'Lettuce', '2024-12-11 04:32:38', '2024-12-11 04:32:38'),
(41, 'agagagagaddg', '2024-12-13 13:58:31', '2024-12-13 13:58:31'),
(42, 'afafasfa', '2024-12-13 13:58:31', '2024-12-13 13:58:31'),
(43, 'agaga', '2024-12-13 14:25:08', '2024-12-13 14:25:08'),
(44, 'afa', '2024-12-13 14:27:43', '2024-12-13 14:27:43'),
(45, 'afasfa', '2024-12-13 15:33:29', '2024-12-13 15:33:29');

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

CREATE TABLE `recipes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `category` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `ingredients_list` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`ingredients_list`)),
  `preparation_steps` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`preparation_steps`)),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`id`, `user_id`, `name`, `category`, `description`, `ingredients_list`, `preparation_steps`, `created_at`, `updated_at`, `image`) VALUES
(1, 0, 'Chicken Adobo ', 'lunch', 'Chicken Adobo is a classic Filipino dish known for its savory, slightly tangy, and mildly sweet flavors. This dish is easy to make and pairs wonderfully with steamed rice.\n\n', '[{\"ingredient_name\":\"Chicken \",\"amount\":1,\"unit\":\"kilogram\",\"is_new_ingredient\":true},{\"ingredient_name\":\"Soy Sauce\",\"amount\":0.5,\"unit\":\"cups\",\"is_new_ingredient\":true},{\"ingredient_name\":\"Vinegar\",\"amount\":0.3333333333333333,\"unit\":\"cups\",\"is_new_ingredient\":true},{\"ingredient_name\":\"Gralic\",\"amount\":5,\"unit\":\"cloves\",\"is_new_ingredient\":true},{\"ingredient_name\":\"Bay Leaves\",\"amount\":3,\"unit\":\"pieces\",\"is_new_ingredient\":true},{\"ingredient_name\":\"Peppercorns\",\"amount\":1,\"unit\":\"tablespoons\",\"is_new_ingredient\":true},{\"ingredient_name\":\"Water\",\"amount\":0.5,\"unit\":\"cups\",\"is_new_ingredient\":true},{\"ingredient_name\":\"Cooking Oil\",\"amount\":2,\"unit\":\"tablespoons\",\"is_new_ingredient\":true},{\"ingredient_name\":\"Onion\",\"amount\":1,\"unit\":\"medium sliced\",\"is_new_ingredient\":true},{\"ingredient_name\":\"Brown Sugar\",\"amount\":1,\"unit\":\"teaspoons\",\"is_new_ingredient\":true},{\"ingredient_name\":\"Salt\",\"amount\":2,\"unit\":\"tablespoons\",\"is_new_ingredient\":true}]', '[{\"step_number\":1,\"instruction\":\"Marinate the Chicken\",\"preparation\":\"In a large bowl, combine 1\\/2 cup soy sauce, half of the minced garlic, and the chicken. Mix well to coat the chicken evenly. Cover and marinate for 30 minutes to 1 hour in the refrigerator.\"},{\"step_number\":2,\"instruction\":\"Sear the Chicken\",\"preparation\":\"Heat 2 tablespoons of cooking oil in a large pan or pot over medium heat.\\nRemove the chicken from the marinade (reserve the marinade) and sear each piece for 2-3 minutes per side until golden brown. Set the chicken aside.\"},{\"step_number\":3,\"instruction\":\"Saut\\u00e9 Garlic and Onion\",\"preparation\":\"In the same pan, saut\\u00e9 the remaining minced garlic and the sliced onion (if using) until fragrant and lightly browned.\"},{\"step_number\":4,\"instruction\":\"Combine and Cook\",\"preparation\":\"Return the chicken to the pan.\\nAdd the reserved soy sauce marinade, 1\\/3 cup vinegar, and 1\\/2 cup water (if using).\\nAdd the bay leaves and peppercorns.\\nBring the mixture to a boil over medium heat without stirring to allow the vinegar to cook off its sharpness (about 3-5 minutes).\\n\"},{\"step_number\":5,\"instruction\":\"Simmer the Adobo\",\"preparation\":\"Reduce the heat to low, cover the pan, and let the adobo simmer for 25-30 minutes, or until the chicken is tender and cooked through. Stir occasionally to prevent sticking.\"},{\"step_number\":6,\"instruction\":\"Season and Adjust the Sauce\",\"preparation\":\"Taste the sauce and adjust the flavor with salt or 1 teaspoon of brown sugar (if using) for a slightly sweet balance.\\nIf the sauce is too thin, uncover the pan and simmer until it reduces to your desired consistency.\"},{\"step_number\":7,\"instruction\":\"Serve\",\"preparation\":\"Transfer the chicken and sauce to a serving platter.\\nServe hot with steamed rice.\\n\"}]', '2024-11-20 12:32:38', '2024-12-13 12:50:12', 'adobo.png'),
(2, 0, 'Classic Filipino Garlic Fried Rice (Sinangag)', 'breakfast', 'Garlic fried rice, or Sinangag, is a simple yet flavorful dish that\'s a staple in Filipino breakfasts. It is best made with day-old rice for a perfect, non-sticky texture. This savory and aromatic rice dish pairs well with eggs, fried fish, or cured meats like tapa, longganisa, or tocino.\n\n', '[{\"ingredient_name\":\"Leftover White Rice\",\"amount\":4,\"unit\":\"cups\",\"is_new_ingredient\":true},{\"ingredient_name\":\"Garlic(minced) \",\"amount\":6,\"unit\":\"cloves \",\"is_new_ingredient\":true},{\"ingredient_name\":\"Cooking Oil\",\"amount\":3,\"unit\":\"tablespoons\",\"is_new_ingredient\":true},{\"ingredient_name\":\"Salt \",\"amount\":0.5,\"unit\":\"teaspoons\",\"is_new_ingredient\":true},{\"ingredient_name\":\"Ground Black Pepper \",\"amount\":0.25,\"unit\":\"teaspoons\",\"is_new_ingredient\":true}]', '[{\"step_number\":1,\"instruction\":\"Prepare the Rice\",\"preparation\":\"Take 4 cups of cooked white rice and break apart any clumps using your hands or a fork. This ensures even frying.\"},{\"step_number\":2,\"instruction\":\"Cook the Garlic\",\"preparation\":\"Heat 3 tablespoons of cooking oil in a large frying pan or wok over medium heat.\\nAdd 6 cloves of minced garlic and saut\\u00e9 for 2\\u20133 minutes, stirring constantly, until the garlic turns golden brown and fragrant. Be careful not to overcook it to avoid bitterness.\"},{\"step_number\":3,\"instruction\":\"Add the Rice\",\"preparation\":\"Increase the heat to medium-high and add the 4 cups of prepared rice to the pan. Stir well to coat each grain with the garlic oil.\"},{\"step_number\":4,\"instruction\":\"Season the Rice\",\"preparation\":\"Sprinkle 1\\/2 teaspoon of salt and 1\\/4 teaspoon of ground black pepper evenly over the rice. Mix thoroughly to distribute the seasoning.\"},{\"step_number\":5,\"instruction\":\"Toast the Rice\",\"preparation\":\"Spread the rice evenly across the pan and let it sit undisturbed for 1\\u20132 minutes to lightly toast the bottom. Stir the rice and repeat this step 2\\u20133 times to achieve a slight crispiness for added texture.\\n\"},{\"step_number\":6,\"instruction\":\"Serve\",\"preparation\":\"Transfer the garlic fried rice to a serving dish. Garnish with chopped green onions or fried garlic bits if desired for an extra touch of flavor and presentation.\"}]', '2024-11-22 17:57:12', '2024-12-13 13:16:26', 'friedrice.png'),
(6, 0, 'Classic Caesar Salad', 'appetizer', 'A crisp romaine salad tossed with Caesar dressing, croutons, and Parmesan.', '[{\"ingredient_name\":\"Romaine Lettuce\",\"amount\":1,\"unit\":\"head\"},{\"ingredient_name\":\"Caesar Dressing\",\"amount\":0.5,\"unit\":\"cups\"},{\"ingredient_name\":\"Croutons\",\"amount\":1,\"unit\":\"cup\"},{\"ingredient_name\":\"Parmesan Cheese\",\"amount\":50,\"unit\":\"grams\"}]', '[{\"step_number\":1,\"instruction\":\"Prepare the lettuce.\",\"preparation\":\"Wash, dry, and chop the romaine lettuce.\"},{\"step_number\":2,\"instruction\":\"Assemble the salad.\",\"preparation\":\"In a large bowl, toss lettuce with Caesar dressing.\"},{\"step_number\":3,\"instruction\":\"Add toppings.\",\"preparation\":\"Sprinkle croutons and grated Parmesan on top.\"},{\"step_number\":4,\"instruction\":\"Serve.\",\"preparation\":\"Serve immediately as an appetizer or side dish.\"}]', '2024-12-09 02:15:00', '2024-12-13 13:16:26', 'caesarsalad.png'),
(7, 0, 'Chicken Tikka Masala', 'dinner', 'A flavorful Indian dish featuring marinated chicken cooked in a creamy tomato-based sauce.', '[{\"ingredient_name\":\"Chicken\",\"amount\":500,\"unit\":\"grams\"},{\"ingredient_name\":\"Yogurt\",\"amount\":1,\"unit\":\"cup\"},{\"ingredient_name\":\"Garam Masala\",\"amount\":1,\"unit\":\"tablespoon\"},{\"ingredient_name\":\"Tomato Sauce\",\"amount\":2,\"unit\":\"cups\"},{\"ingredient_name\":\"Heavy Cream\",\"amount\":1,\"unit\":\"cup\"},{\"ingredient_name\":\"Garlic (minced)\",\"amount\":4,\"unit\":\"cloves\"}]', '[{\"step_number\":1,\"instruction\":\"Marinate the chicken.\",\"preparation\":\"Mix chicken with yogurt and garam masala; marinate for at least 1 hour.\"},{\"step_number\":2,\"instruction\":\"Cook the chicken.\",\"preparation\":\"Grill or pan-fry chicken until cooked through.\"},{\"step_number\":3,\"instruction\":\"Prepare the sauce.\",\"preparation\":\"In a pan, cook garlic in butter, add tomato sauce and cream, then simmer.\"},{\"step_number\":4,\"instruction\":\"Combine chicken and sauce.\",\"preparation\":\"Add cooked chicken to the sauce and simmer for 10 minutes.\"},{\"step_number\":5,\"instruction\":\"Serve.\",\"preparation\":\"Serve hot with rice or naan.\"}]', '2024-12-09 02:30:00', '2024-12-13 13:49:25', 'tikkamasala.png'),
(8, 0, 'Vegetable Stir Fry', 'vegan', 'A colorful and healthy stir-fry with a mix of fresh vegetables and a savory sauce.', '[{\"ingredient_name\":\"Broccoli\",\"amount\":200,\"unit\":\"grams\"},{\"ingredient_name\":\"Carrots\",\"amount\":2,\"unit\":\"medium\"},{\"ingredient_name\":\"Bell Peppers\",\"amount\":2,\"unit\":\"medium\"},{\"ingredient_name\":\"Soy Sauce\",\"amount\":3,\"unit\":\"tablespoons\"},{\"ingredient_name\":\"Garlic (minced)\",\"amount\":2,\"unit\":\"cloves\"},{\"ingredient_name\":\"Cornstarch\",\"amount\":1,\"unit\":\"teaspoon\"}]', '[{\"step_number\":1,\"instruction\":\"Prepare the vegetables.\",\"preparation\":\"Chop broccoli, carrots, and bell peppers into bite-sized pieces.\"},{\"step_number\":2,\"instruction\":\"Cook the vegetables.\",\"preparation\":\"Heat oil in a wok and stir-fry garlic, then add vegetables and cook for 5-7 minutes.\"},{\"step_number\":3,\"instruction\":\"Make the sauce.\",\"preparation\":\"Mix soy sauce with cornstarch and water, then add to the vegetables.\"},{\"step_number\":4,\"instruction\":\"Cook until thickened.\",\"preparation\":\"Stir and cook for 2-3 more minutes until the sauce thickens.\"},{\"step_number\":5,\"instruction\":\"Serve.\",\"preparation\":\"Serve hot with rice or noodles.\"}]', '2024-12-09 02:45:00', '2024-12-13 13:16:26', 'vegetablestirfry.png'),
(9, 0, 'Beef Stroganoff', 'dinner', 'A rich and creamy dish with tender beef and mushrooms served over noodles.', '[{\"ingredient_name\":\"Beef Strips\",\"amount\":500,\"unit\":\"grams\"},{\"ingredient_name\":\"Mushrooms\",\"amount\":200,\"unit\":\"grams\"},{\"ingredient_name\":\"Onion (chopped)\",\"amount\":1,\"unit\":\"medium\"},{\"ingredient_name\":\"Sour Cream\",\"amount\":1,\"unit\":\"cup\"},{\"ingredient_name\":\"Beef Broth\",\"amount\":1,\"unit\":\"cup\"},{\"ingredient_name\":\"Flour\",\"amount\":2,\"unit\":\"tablespoons\"}]', '[{\"step_number\":1,\"instruction\":\"Cook the beef.\",\"preparation\":\"Brown beef strips in a hot pan, then set aside.\"},{\"step_number\":2,\"instruction\":\"Cook the vegetables.\",\"preparation\":\"In the same pan, sauté onions and mushrooms until softened.\"},{\"step_number\":3,\"instruction\":\"Make the sauce.\",\"preparation\":\"Sprinkle flour into the pan, cook briefly, then add beef broth and stir until thickened.\"},{\"step_number\":4,\"instruction\":\"Combine ingredients.\",\"preparation\":\"Return beef to the pan, stir in sour cream, and simmer for 10 minutes.\"},{\"step_number\":5,\"instruction\":\"Serve.\",\"preparation\":\"Serve hot over cooked noodles or rice.\"}]', '2024-12-09 03:00:00', '2024-12-13 13:16:26', 'beefstroganoff.png'),
(10, 0, 'Teriyaki Chicken', 'dinner', 'A popular Japanese dish made with tender chicken glazed in a sweet and savory teriyaki sauce.', '[{\"ingredient_name\":\"Chicken Thighs\",\"amount\":4,\"unit\":\"pieces\"},{\"ingredient_name\":\"Soy Sauce\",\"amount\":0.5,\"unit\":\"cups\"},{\"ingredient_name\":\"Mirin\",\"amount\":0.25,\"unit\":\"cups\"},{\"ingredient_name\":\"Sugar\",\"amount\":2,\"unit\":\"tablespoons\"},{\"ingredient_name\":\"Garlic (minced)\",\"amount\":2,\"unit\":\"cloves\"}]', '[{\"step_number\":1,\"instruction\":\"Prepare the sauce.\",\"preparation\":\"Mix soy sauce, mirin, sugar, and garlic in a bowl.\"},{\"step_number\":2,\"instruction\":\"Cook the chicken.\",\"preparation\":\"Heat oil in a pan, cook chicken thighs until golden and cooked through.\"},{\"step_number\":3,\"instruction\":\"Glaze the chicken.\",\"preparation\":\"Pour the teriyaki sauce into the pan, simmer until it thickens and coats the chicken.\"},{\"step_number\":4,\"instruction\":\"Serve.\",\"preparation\":\"Serve hot with rice and steamed vegetables.\"}]', '2024-12-09 03:15:00', '2024-12-13 13:16:26', 'teriyakichicken.png'),
(12, 0, 'Vegetable Curry', 'vegan', 'A hearty and spicy curry packed with assorted vegetables and creamy coconut milk.', '[{\"ingredient_name\":\"Potatoes\",\"amount\":200,\"unit\":\"grams\"},{\"ingredient_name\":\"Carrots\",\"amount\":2,\"unit\":\"medium\"},{\"ingredient_name\":\"Zucchini\",\"amount\":1,\"unit\":\"medium\"},{\"ingredient_name\":\"Coconut Milk\",\"amount\":1,\"unit\":\"can\"},{\"ingredient_name\":\"Curry Powder\",\"amount\":2,\"unit\":\"tablespoons\"}]', '[{\"step_number\":1,\"instruction\":\"Cook the vegetables.\",\"preparation\":\"Chop and boil potatoes, carrots, and zucchini until tender.\"},{\"step_number\":2,\"instruction\":\"Prepare the curry base.\",\"preparation\":\"In a pot, heat oil, sauté curry powder until fragrant.\"},{\"step_number\":3,\"instruction\":\"Combine ingredients.\",\"preparation\":\"Add vegetables and coconut milk, simmer for 10 minutes.\"},{\"step_number\":4,\"instruction\":\"Serve.\",\"preparation\":\"Serve hot with rice or flatbread.\"}]', '2024-12-09 03:45:00', '2024-12-13 13:16:26', 'vegetablecurry.png'),
(13, 0, 'Chicken Alfredo', 'dinner', 'A creamy pasta dish with grilled chicken and rich Alfredo sauce.', '[{\"ingredient_name\":\"Chicken Breast\",\"amount\":2,\"unit\":\"pieces\"},{\"ingredient_name\":\"Fettuccine\",\"amount\":400,\"unit\":\"grams\"},{\"ingredient_name\":\"Heavy Cream\",\"amount\":1,\"unit\":\"cup\"},{\"ingredient_name\":\"Parmesan Cheese\",\"amount\":100,\"unit\":\"grams\"},{\"ingredient_name\":\"Garlic (minced)\",\"amount\":2,\"unit\":\"cloves\"}]', '[{\"step_number\":1,\"instruction\":\"Cook the pasta.\",\"preparation\":\"Boil fettuccine until al dente.\"},{\"step_number\":2,\"instruction\":\"Cook the chicken.\",\"preparation\":\"Grill chicken breasts until cooked through, then slice.\"},{\"step_number\":3,\"instruction\":\"Prepare the sauce.\",\"preparation\":\"In a pan, sauté garlic in butter, add cream and Parmesan, then simmer.\"},{\"step_number\":4,\"instruction\":\"Combine ingredients.\",\"preparation\":\"Mix cooked pasta with sauce, top with sliced chicken.\"},{\"step_number\":5,\"instruction\":\"Serve.\",\"preparation\":\"Serve immediately with parsley garnish.\"}]', '2024-12-09 04:00:00', '2024-12-13 13:16:26', 'chickenalfredo.png'),
(14, 0, 'Beef Stroganoff', 'dinner', 'A creamy and savory beef dish served with pasta.', '[{\"ingredient_name\":\"Beef strips\",\"amount\":500,\"unit\":\"grams\"},{\"ingredient_name\":\"Mushrooms\",\"amount\":1,\"unit\":\"cup\"},{\"ingredient_name\":\"Onion\",\"amount\":1,\"unit\":\"medium\"},{\"ingredient_name\":\"Sour cream\",\"amount\":0.5,\"unit\":\"cup\"},{\"ingredient_name\":\"Butter\",\"amount\":2,\"unit\":\"tablespoons\"}]', '[{\"step_number\":1,\"instruction\":\"Sear beef\",\"preparation\":\"Heat butter in a pan and sear beef strips until browned.\"},{\"step_number\":2,\"instruction\":\"Cook vegetables\",\"preparation\":\"Add onions and mushrooms; cook until soft.\"},{\"step_number\":3,\"instruction\":\"Add sour cream\",\"preparation\":\"Stir in sour cream and simmer for 5 minutes.\"}]', '2024-12-11 00:00:00', '2024-12-13 13:16:26', 'beefstroganoff.png'),
(15, 0, 'Spaghetti Bolognese', 'dinner', 'A classic Italian pasta dish with a rich meat sauce.', '[{\"ingredient_name\":\"Ground beef\",\"amount\":500,\"unit\":\"grams\"},{\"ingredient_name\":\"Tomato sauce\",\"amount\":2,\"unit\":\"cups\"},{\"ingredient_name\":\"Garlic\",\"amount\":3,\"unit\":\"cloves\"},{\"ingredient_name\":\"Spaghetti\",\"amount\":400,\"unit\":\"grams\"},{\"ingredient_name\":\"Olive oil\",\"amount\":2,\"unit\":\"tablespoons\"}]', '[{\"step_number\":1,\"instruction\":\"Cook pasta\",\"preparation\":\"Boil spaghetti until al dente.\"},{\"step_number\":2,\"instruction\":\"Prepare sauce\",\"preparation\":\"Sauté garlic in olive oil, add ground beef, and cook until browned. Stir in tomato sauce and simmer.\"},{\"step_number\":3,\"instruction\":\"Combine and serve\",\"preparation\":\"Toss spaghetti with sauce and serve.\"}]', '2024-12-11 00:05:00', '2024-12-13 13:16:26', 'spaghettibolognese.png'),
(16, 0, 'Chicken Curry', 'dinner', 'A spicy and aromatic curry dish.', '[{\"ingredient_name\":\"Chicken\",\"amount\":1,\"unit\":\"kilogram\"},{\"ingredient_name\":\"Coconut milk\",\"amount\":1,\"unit\":\"cup\"},{\"ingredient_name\":\"Curry powder\",\"amount\":2,\"unit\":\"tablespoons\"},{\"ingredient_name\":\"Garlic\",\"amount\":3,\"unit\":\"cloves\"},{\"ingredient_name\":\"Onion\",\"amount\":1,\"unit\":\"medium\"}]', '[{\"step_number\":1,\"instruction\":\"Cook chicken\",\"preparation\":\"Sear chicken pieces in a large pot.\"},{\"step_number\":2,\"instruction\":\"Add spices\",\"preparation\":\"Add garlic, onion, and curry powder; cook until fragrant.\"},{\"step_number\":3,\"instruction\":\"Simmer\",\"preparation\":\"Pour in coconut milk and simmer until chicken is tender.\"}]', '2024-12-11 00:10:00', '2024-12-13 13:16:26', 'chickencurry.png'),
(17, 0, 'Vegetable Stir-fry', 'dinner', 'A healthy and quick vegetable stir-fry dish.', '[{\"ingredient_name\":\"Broccoli\",\"amount\":200,\"unit\":\"grams\"},{\"ingredient_name\":\"Carrots\",\"amount\":2,\"unit\":\"pieces\"},{\"ingredient_name\":\"Bell peppers\",\"amount\":2,\"unit\":\"pieces\"},{\"ingredient_name\":\"Soy sauce\",\"amount\":3,\"unit\":\"tablespoons\"},{\"ingredient_name\":\"Garlic\",\"amount\":2,\"unit\":\"cloves\"}]', '[{\"step_number\":1,\"instruction\":\"Prepare vegetables\",\"preparation\":\"Chop broccoli, carrots, and bell peppers into bite-sized pieces.\"},{\"step_number\":2,\"instruction\":\"Cook garlic\",\"preparation\":\"Sauté minced garlic in a wok with oil.\"},{\"step_number\":3,\"instruction\":\"Stir-fry vegetables\",\"preparation\":\"Add vegetables to the wok and stir-fry for 5-7 minutes. Add soy sauce and toss to combine.\"}]', '2024-12-11 00:00:00', '2024-12-13 13:16:26', 'vegetablestirfry.png'),
(18, 0, 'Chocolate Chip Cookies', 'dessert', 'Chewy and delicious chocolate chip cookies.', '[{\"ingredient_name\":\"Flour\",\"amount\":2,\"unit\":\"cups\"},{\"ingredient_name\":\"Sugar\",\"amount\":0.5,\"unit\":\"cup\"},{\"ingredient_name\":\"Butter\",\"amount\":0.5,\"unit\":\"cup\"},{\"ingredient_name\":\"Eggs\",\"amount\":2,\"unit\":\"pieces\"},{\"ingredient_name\":\"Chocolate chips\",\"amount\":1,\"unit\":\"cup\"}]', '[{\"step_number\":1,\"instruction\":\"Mix ingredients\",\"preparation\":\"Combine flour, sugar, butter, and eggs in a bowl.\"},{\"step_number\":2,\"instruction\":\"Add chocolate chips\",\"preparation\":\"Fold in the chocolate chips.\"},{\"step_number\":3,\"instruction\":\"Bake cookies\",\"preparation\":\"Scoop dough onto a baking tray and bake at 350°F for 10-12 minutes.\"}]', '2024-12-11 00:05:00', '2024-12-13 13:16:26', 'cookies.png'),
(19, 0, 'Caesar Salad', 'appetizer', 'A classic Caesar salad with homemade dressing.', '[{\"ingredient_name\":\"Romaine lettuce\",\"amount\":1,\"unit\":\"head\"},{\"ingredient_name\":\"Croutons\",\"amount\":1,\"unit\":\"cup\"},{\"ingredient_name\":\"Parmesan cheese\",\"amount\":0.5,\"unit\":\"cup\"},{\"ingredient_name\":\"Caesar dressing\",\"amount\":0.5,\"unit\":\"cup\"}]', '[{\"step_number\":1,\"instruction\":\"Prepare lettuce\",\"preparation\":\"Wash and chop romaine lettuce.\"},{\"step_number\":2,\"instruction\":\"Assemble salad\",\"preparation\":\"Combine lettuce, croutons, and Parmesan in a bowl.\"},{\"step_number\":3,\"instruction\":\"Add dressing\",\"preparation\":\"Drizzle Caesar dressing over the salad and toss well.\"}]', '2024-12-11 00:10:00', '2024-12-13 13:16:26', 'caesarsalad.png'),
(22, 0, 'Caprese Salad', '', 'A classic Italian salad with fresh mozzarella, tomatoes, and basil.', '[{\"ingredient_name\":\"Tomatoes\",\"amount\":3,\"unit\":\"pieces\"},{\"ingredient_name\":\"Mozzarella\",\"amount\":200,\"unit\":\"grams\"},{\"ingredient_name\":\"Basil leaves\",\"amount\":10,\"unit\":\"pieces\"},{\"ingredient_name\":\"Olive oil\",\"amount\":2,\"unit\":\"tablespoons\"},{\"ingredient_name\":\"Balsamic glaze\",\"amount\":1,\"unit\":\"tablespoon\"}]', '[{\"step_number\":1,\"instruction\":\"Prepare ingredients\",\"preparation\":\"Slice tomatoes and mozzarella.\"},{\"step_number\":2,\"instruction\":\"Assemble salad\",\"preparation\":\"Layer tomatoes, mozzarella, and basil on a plate.\"},{\"step_number\":3,\"instruction\":\"Dress salad\",\"preparation\":\"Drizzle with olive oil and balsamic glaze.\"}]', '2024-12-11 00:40:00', '2024-12-13 13:18:01', 'capresesalad.png'),
(23, 0, 'Banana Bread', 'dessert', 'Moist and delicious banana bread made with ripe bananas.', '[{\"ingredient_name\":\"Bananas\",\"amount\":3,\"unit\":\"pieces\"},{\"ingredient_name\":\"Flour\",\"amount\":2,\"unit\":\"cups\"},{\"ingredient_name\":\"Sugar\",\"amount\":1,\"unit\":\"cup\"},{\"ingredient_name\":\"Eggs\",\"amount\":2,\"unit\":\"pieces\"},{\"ingredient_name\":\"Butter\",\"amount\":0.5,\"unit\":\"cup\"}]', '[{\"step_number\":1,\"instruction\":\"Mash bananas\",\"preparation\":\"In a bowl, mash ripe bananas.\"},{\"step_number\":2,\"instruction\":\"Mix ingredients\",\"preparation\":\"Combine bananas with flour, sugar, eggs, and melted butter.\"},{\"step_number\":3,\"instruction\":\"Bake\",\"preparation\":\"Pour batter into a greased pan and bake at 350°F for 60 minutes.\"}]', '2024-12-11 00:45:00', '2024-12-13 13:18:01', 'bananabread.png'),
(24, 0, 'Eggplant Parmesan', 'dinner', 'A baked dish with breaded eggplant, marinara, and cheese.', '[{\"ingredient_name\":\"Eggplant\",\"amount\":2,\"unit\":\"pieces\"},{\"ingredient_name\":\"Marinara sauce\",\"amount\":2,\"unit\":\"cups\"},{\"ingredient_name\":\"Mozzarella\",\"amount\":200,\"unit\":\"grams\"},{\"ingredient_name\":\"Breadcrumbs\",\"amount\":1,\"unit\":\"cup\"},{\"ingredient_name\":\"Parmesan\",\"amount\":0.5,\"unit\":\"cup\"}]', '[{\"step_number\":1,\"instruction\":\"Prepare eggplant\",\"preparation\":\"Slice and bread eggplant with breadcrumbs.\"},{\"step_number\":2,\"instruction\":\"Layer dish\",\"preparation\":\"Layer eggplant, marinara, and mozzarella in a baking dish.\"},{\"step_number\":3,\"instruction\":\"Bake\",\"preparation\":\"Bake at 375°F for 30 minutes until golden and bubbly.\"}]', '2024-12-11 00:50:00', '2024-12-13 13:18:01', 'eggplantparmesan.png'),
(25, 0, 'French Onion Soup', 'lunch', 'A hearty soup with caramelized onions and melted cheese.', '[{\"ingredient_name\":\"Onions\",\"amount\":5,\"unit\":\"large\"},{\"ingredient_name\":\"Beef broth\",\"amount\":4,\"unit\":\"cups\"},{\"ingredient_name\":\"Butter\",\"amount\":2,\"unit\":\"tablespoons\"},{\"ingredient_name\":\"Baguette\",\"amount\":1,\"unit\":\"loaf\"},{\"ingredient_name\":\"Gruyere cheese\",\"amount\":200,\"unit\":\"grams\"}]', '[{\"step_number\":1,\"instruction\":\"Caramelize onions\",\"preparation\":\"Cook onions in butter over low heat until golden brown.\"},{\"step_number\":2,\"instruction\":\"Add broth\",\"preparation\":\"Pour in beef broth and simmer for 20 minutes.\"},{\"step_number\":3,\"instruction\":\"Serve\",\"preparation\":\"Top with toasted baguette slices and melted Gruyere cheese.\"}]', '2024-12-11 00:55:00', '2024-12-13 13:37:37', 'onionsoup.png'),
(26, 0, 'Pumpkin Soup', 'lunch', 'A creamy and comforting pumpkin soup.', '[{\"ingredient_name\":\"Pumpkin\",\"amount\":1,\"unit\":\"kilogram\"},{\"ingredient_name\":\"Onion\",\"amount\":1,\"unit\":\"medium\"},{\"ingredient_name\":\"Garlic\",\"amount\":2,\"unit\":\"cloves\"},{\"ingredient_name\":\"Vegetable broth\",\"amount\":4,\"unit\":\"cups\"},{\"ingredient_name\":\"Cream\",\"amount\":0.5,\"unit\":\"cup\"}]', '[{\"step_number\":1,\"instruction\":\"Cook ingredients\",\"preparation\":\"Sauté onions, garlic, and pumpkin in a pot.\"},{\"step_number\":2,\"instruction\":\"Simmer\",\"preparation\":\"Add vegetable broth and simmer until pumpkin is soft.\"},{\"step_number\":3,\"instruction\":\"Blend and serve\",\"preparation\":\"Blend soup until smooth and stir in cream.\"}]', '2024-12-11 01:00:00', '2024-12-13 13:18:01', 'pumpkinsoup.png'),
(27, 0, 'Mango Smoothie', 'breakfast', 'A refreshing and tropical mango smoothie.', '[{\"ingredient_name\":\"Mango\",\"amount\":2,\"unit\":\"pieces\"},{\"ingredient_name\":\"Milk\",\"amount\":1,\"unit\":\"cup\"},{\"ingredient_name\":\"Yogurt\",\"amount\":0.5,\"unit\":\"cup\"},{\"ingredient_name\":\"Honey\",\"amount\":1,\"unit\":\"tablespoon\"},{\"ingredient_name\":\"Ice\",\"amount\":1,\"unit\":\"cup\"}]', '[{\"step_number\":1,\"instruction\":\"Blend ingredients\",\"preparation\":\"Combine mango, milk, yogurt, honey, and ice in a blender.\"},{\"step_number\":2,\"instruction\":\"Serve\",\"preparation\":\"Pour into a glass and serve chilled.\"}]', '2024-12-11 01:05:00', '2024-12-13 13:18:01', 'mangosmoothie.png'),
(28, 0, 'Avocado Toast', 'breakfast', 'A quick and healthy avocado toast recipe.', '[{\"ingredient_name\":\"Avocado\",\"amount\":1,\"unit\":\"piece\"},{\"ingredient_name\":\"Bread\",\"amount\":2,\"unit\":\"slices\"},{\"ingredient_name\":\"Lemon juice\",\"amount\":1,\"unit\":\"teaspoon\"},{\"ingredient_name\":\"Salt\",\"amount\":1,\"unit\":\"pinch\"},{\"ingredient_name\":\"Pepper\",\"amount\":1,\"unit\":\"pinch\"}]', '[{\"step_number\":1,\"instruction\":\"Prepare avocado\",\"preparation\":\"Mash avocado with lemon juice, salt, and pepper.\"},{\"step_number\":2,\"instruction\":\"Toast bread\",\"preparation\":\"Toast bread slices until golden.\"},{\"step_number\":3,\"instruction\":\"Assemble toast\",\"preparation\":\"Spread avocado mixture on toast and serve.\"}]', '2024-12-11 01:10:00', '2024-12-13 12:13:40', 'avocado.png'),
(29, 0, 'Chicken Tacos', 'dinner', 'Easy and flavorful chicken tacos.', '[{\"ingredient_name\":\"Chicken breast\",\"amount\":2,\"unit\":\"pieces\"},{\"ingredient_name\":\"Taco seasoning\",\"amount\":2,\"unit\":\"tablespoons\"},{\"ingredient_name\":\"Tortillas\",\"amount\":4,\"unit\":\"pieces\"},{\"ingredient_name\":\"Lettuce\",\"amount\":1,\"unit\":\"cup\"},{\"ingredient_name\":\"Salsa\",\"amount\":0.5,\"unit\":\"cup\"}]', '[{\"step_number\":1,\"instruction\":\"Cook chicken\",\"preparation\":\"Season chicken with taco seasoning and cook until done.\"},{\"step_number\":2,\"instruction\":\"Assemble tacos\",\"preparation\":\"Fill tortillas with chicken, lettuce, and salsa.\"}]', '2024-12-11 01:15:00', '2024-12-13 12:07:34', 'tacos.png'),
(30, 0, 'Berry Parfait', 'dessert', 'A simple and delicious berry parfait.', '[{\"ingredient_name\":\"Berries\",\"amount\":1,\"unit\":\"cup\"},{\"ingredient_name\":\"Greek yogurt\",\"amount\":0.5,\"unit\":\"cup\"},{\"ingredient_name\":\"Granola\",\"amount\":0.25,\"unit\":\"cup\"},{\"ingredient_name\":\"Honey\",\"amount\":1,\"unit\":\"teaspoon\"}]', '[{\"step_number\":1,\"instruction\":\"Layer ingredients\",\"preparation\":\"In a glass, layer berries, yogurt, granola, and honey.\"},{\"step_number\":2,\"instruction\":\"Serve\",\"preparation\":\"Serve chilled as a healthy dessert.\"}]', '2024-12-11 01:20:00', '2024-12-13 12:16:24', 'berryparfait.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `auth_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `password`, `profile_image`, `auth_token`, `created_at`, `updated_at`) VALUES
(1, 'testuser@example.com', 'testuser', '$2y$10$yrFENS6nDBkZ88ui0vDd.u/kr859cjfs843aWYwCOZz3wIS6PAn5i', NULL, NULL, '2024-11-13 00:29:37', '2024-11-13 00:29:37'),
(2, 'godricramelo@gmail.com', 'GhoulPH1', '$2y$10$S2UgQG4PJcOFn2p7LKQF.Og.tSYOXyjMnTI/.BoUm.ZQ8YPo8fRs.', NULL, 'c8443554fb5f4c45e10c14a90f3b959b', '2024-11-13 00:34:25', '2024-12-16 00:53:39'),
(12, 'adminmoderator@gmail.com', 'Admin', '$2y$10$SAg5NkYlxG.9/zfiPkBT8uBS7qq7nCNcSFwbEVyBoYFOJXPyD2a9q', NULL, 'b82817c6e49af1b09523d3522b2c4518', '2024-11-13 06:06:44', '2024-12-06 03:40:21'),
(13, 'jameslebron@gmail.com', 'Lebleb Macalintal ', '$2y$10$ZVsBb0YMiXocHVq25ovD9OPLeJUAPKrV9GT4ARgkauJ1F7zGVdLBm', NULL, 'c3ddc2b053994ed93efbd6cd730f017b', '2024-11-13 11:50:52', '2024-11-13 11:54:05'),
(14, 'reignnathalie@gmail.com', 'Reign Nathalie', '$2y$10$4YD1ydpQzg9NTROW9G2PV.PiuO6jR4GqPzWbD6gY0.dRSnI2vOO8y', 'uploads/profile_images/67554ccd5d121_download (2).jpg', 'f16c880adeec08f451c451a3a8a631c9', '2024-11-20 01:19:29', '2024-12-16 03:58:52'),
(15, 'panzerabwher@gmail.com', 'Gunther', '$2y$10$8mZGIaOPtDM8nr8h2nUeCuT5cppWaP77OeRVcvy2YQ4nugCwr1muO', NULL, 'dcd04b08a0d7dad1a83c111936683c6a', '2024-12-09 07:22:42', '2024-12-09 08:08:24'),
(16, 'karlhienzgarcia@gmail.com', 'KarlHienz', '$2y$10$BBCVs9SF8uTpywAY.Wpocu9URRQem/P.AmMPBH/BpHCEQUYOpiAG2', NULL, 'f9621afbc27b027704bc9b84e79c09f2', '2024-12-11 03:07:07', '2024-12-13 15:32:48'),
(17, 'fechalin@gmail.com', 'AldrinFechalin', '$2y$10$xIWlpFcpS3ZwLJnaAsfspOJRUy6mOrYPNjeImIdUdoOXwWgMewN/C', NULL, '925fcceb368614d07475226470ec49d9', '2024-12-11 03:20:54', '2024-12-11 03:21:03'),
(18, 'hiwa@gmail.com', 'Hiwa', '$2y$10$UnLAhuTYIhIWy4h.TbAfbulcOGslj4xrpA2D6VVYf0cXTVYr1TySy', NULL, '4811f3e2e648bcd5394cdba750ee8858', '2024-12-11 05:13:03', '2024-12-11 05:15:45'),
(19, 'asmo12@gmail.com', 'asmo', '$2y$10$G4aHgKbaK4IlRd8SNBQll.Ej23XqdL6pgkFH4GQJSB7eWaTd.AVYu', NULL, 'ca109f3d20556145dbd1c0970e980534', '2024-12-13 10:38:18', '2024-12-13 11:20:03');

-- --------------------------------------------------------

--
-- Table structure for table `user_recipes`
--

CREATE TABLE `user_recipes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `category` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `ingredients_list` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`ingredients_list`)),
  `preparation_steps` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`preparation_steps`)),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_recipes`
--

INSERT INTO `user_recipes` (`id`, `user_id`, `name`, `category`, `description`, `ingredients_list`, `preparation_steps`, `created_at`, `updated_at`, `image`) VALUES
(1, 14, 'New Recipe ', 'Salad', 'Updated Description', '\"[{\\\"ingredient_name\\\":\\\"Flour\\\",\\\"amount\\\":2,\\\"unit\\\":\\\"cups\\\",\\\"is_new_ingredient\\\":true},{\\\"ingredient_name\\\":\\\"Sugar\\\",\\\"amount\\\":2,\\\"unit\\\":\\\"tbsp\\\",\\\"is_new_ingredient\\\":true}]\"', '\"[{\\\"step_number\\\":1,\\\"instruction\\\":\\\"Mix all ingredients.\\\",\\\"preparation\\\":\\\"Thoroughly mix.\\\"},{\\\"step_number\\\":2,\\\"instruction\\\":\\\"Bake at 350\\u00b0F for 30 minutes.\\\",\\\"preparation\\\":\\\"Preheat the oven.\\\"}]\"', '2024-12-05 13:16:54', '2024-12-09 05:00:05', NULL),
(2, 14, ' Vegan Chickpea Curry', 'vegan', 'This Vegan Chickpea Curry is a hearty, flavorful, and nutritious dish made with chickpeas, coconut milk, and aromatic spices. It\'s quick and easy to make, perfect for a comforting weeknight dinner. Served with rice or naan, it makes for a complete meal!', '\"[{\\\"ingredient_name\\\":\\\"Olive Oil\\\",\\\"amount\\\":2,\\\"unit\\\":\\\"tablespoons\\\",\\\"is_new_ingredient\\\":true},{\\\"ingredient_name\\\":\\\"Onion(finely chopped)\\\",\\\"amount\\\":1,\\\"unit\\\":\\\"pieces\\\",\\\"is_new_ingredient\\\":true},{\\\"ingredient_name\\\":\\\"Garlic(minced)\\\",\\\"amount\\\":2,\\\"unit\\\":\\\"cloves\\\",\\\"is_new_ingredient\\\":true},{\\\"ingredient_name\\\":\\\"Ginger(grated)\\\",\\\"amount\\\":1,\\\"unit\\\":\\\"inch piece\\\",\\\"is_new_ingredient\\\":true}]\"', '\"[{\\\"step_number\\\":1,\\\"instruction\\\":\\\"Heat oil\\\",\\\"preparation\\\":\\\"In a large pot or deep pan, heat the olive oil over medium heat.\\\"},{\\\"step_number\\\":2,\\\"instruction\\\":\\\"Saut\\u00e9 aromatics\\\",\\\"preparation\\\":\\\" Add the chopped onion and saut\\u00e9 for 4-5 minutes until softened. Add the garlic, grated ginger, and bell pepper. Cook for another 2 minutes until fragrant.\\\"},{\\\"step_number\\\":3,\\\"instruction\\\":\\\"Spices\\\",\\\"preparation\\\":\\\"Add the curry powder, turmeric, cumin, paprika, and cayenne pepper. Stir well to coat the vegetables and cook for 1 minute to bring out the flavors of the spices.\\\"},{\\\"step_number\\\":4,\\\"instruction\\\":\\\"Add liquids\\\",\\\"preparation\\\":\\\"Pour in the coconut milk, diced tomatoes, and vegetable broth. Stir to combine, making sure all the ingredients are well-mixed.\\\"},{\\\"step_number\\\":5,\\\"instruction\\\":\\\"Chickpeas\\\",\\\"preparation\\\":\\\"Add the chickpeas to the pot. Season with salt and pepper, then bring the mixture to a simmer.\\\"},{\\\"step_number\\\":6,\\\"instruction\\\":\\\"Simmer\\\",\\\"preparation\\\":\\\" Let the curry simmer on low heat for 20-25 minutes, allowing the flavors to meld together and the sauce to thicken slightly.\\\"},{\\\"step_number\\\":7,\\\"instruction\\\":\\\"Sweeten\\\",\\\"preparation\\\":\\\"If desired, stir in maple syrup for a touch of sweetness to balance the spices.\\\"},{\\\"step_number\\\":8,\\\"instruction\\\":\\\"Serve\\\",\\\"preparation\\\":\\\"Serve the curry over cooked rice or with naan. Garnish with fresh cilantro.\\\"}]\"', '2024-12-09 02:48:50', '2024-12-09 03:08:13', NULL),
(3, 14, 'Scrambled Eggs', 'breakfast', 'Scrambled eggs are a quick and easy breakfast dish that’s rich in protein. This recipe is perfect for a busy morning or a quick snack. You only need a few ingredients, and it’s ready in under 10 minutes.', '\"[{\\\"ingredient_name\\\":\\\"Eggs\\\",\\\"amount\\\":2,\\\"unit\\\":\\\"large\\\",\\\"is_new_ingredient\\\":true}]\"', '\"[{\\\"step_number\\\":1,\\\"instruction\\\":\\\"Beat the eggs \\\",\\\"preparation\\\":\\\"Crack 2 large eggs into the bowl \\\"}]\"', '2024-12-09 03:18:06', '2024-12-09 16:35:49', NULL),
(4, 16, 'Spaghetti Carbonaraa', 'appetizer', 'A traditional Italian pasta dish made with eggs, cheese, pancetta, and pepper.asasa\n', '\"[]\"', '\"[]\"', '2024-12-11 03:20:07', '2024-12-13 14:36:20', NULL),
(5, 18, 'itlog bilog', 'appetizer', 'trip ko lang', '[{\"ingredient_name\":\"Olive Oil\",\"amount\":2,\"unit\":\"grams\",\"is_new_ingredient\":false}]', '[{\"step_number\":1,\"instruction\":\"Step\",\"preparation\":\"basta lutuin\"}]', '2024-12-11 05:14:15', '2024-12-11 05:14:15', NULL),
(6, 19, 'Binangkal', 'dessert', 'BASTA MASARAP', '\"[]\"', '\"[]\"', '2024-12-13 10:39:40', '2024-12-13 10:39:52', NULL),
(9, 14, 'Scrambled Eggs', 'breakfast', 'Description', '[{\"ingredient_name\":\"Eggs\",\"amount\":1,\"unit\":\"pieces\",\"is_new_ingredient\":true}]', '[{\"step_number\":1,\"instruction\":\"Beat the eggs \",\"preparation\":\"Details\"}]', '2024-12-16 06:21:23', '2024-12-16 06:21:23', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`category`),
  ADD KEY `idx_user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `user_recipes`
--
ALTER TABLE `user_recipes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_category` (`category`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `user_recipes`
--
ALTER TABLE `user_recipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_recipes`
--
ALTER TABLE `user_recipes`
  ADD CONSTRAINT `user_recipes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
