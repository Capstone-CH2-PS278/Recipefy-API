-- phpMyAdmin SQL Dump
-- version 4.7.1
-- https://www.phpmyadmin.net/
--
-- Host: 35.237.5.10
-- Generation Time: Dec 27, 2023 at 03:25 AM
-- Server version: 8.0.31-google
-- PHP Version: 7.0.33-0ubuntu0.16.04.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `recipefy`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_ingredients`
--

CREATE TABLE `data_ingredients` (
  `id` int NOT NULL,
  `name_ingredient` varchar(255) NOT NULL,
  `image_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `data_ingredients`
--

INSERT INTO `data_ingredients` (`id`, `name_ingredient`, `image_url`) VALUES
(6, 'Chicken', 'https://storage.googleapis.com/recipefy-407103.appspot.com/images/ingredient/1703592649807_dagingayam.jpeg'),
(7, 'Garlic', 'https://storage.googleapis.com/recipefy-407103.appspot.com/images/ingredient/1703592693770_bawangputih.jpeg'),
(8, 'Egg', 'https://storage.googleapis.com/recipefy-407103.appspot.com/images/ingredient/1703593454910_telur.jpeg'),
(9, 'Shallot', 'https://storage.googleapis.com/recipefy-407103.appspot.com/images/ingredient/1703593709489_bawangmerah.jpeg'),
(10, 'Salt', 'https://storage.googleapis.com/recipefy-407103.appspot.com/images/ingredient/1703593852784_garam.jpeg'),
(11, 'Potato', 'https://storage.googleapis.com/recipefy-407103.appspot.com/images/ingredient/1703593957426_potato.jpeg'),
(12, 'Tomato', 'https://storage.googleapis.com/recipefy-407103.appspot.com/images/ingredient/1703598750219_tomat.jpeg'),
(13, 'Ginger', 'https://storage.googleapis.com/recipefy-407103.appspot.com/images/ingredient/1703599416972_jahe.jpeg'),
(14, 'Beef', 'https://storage.googleapis.com/recipefy-407103.appspot.com/images/ingredient/1703599934286_dagingsapi.jpeg'),
(15, 'Carrot', 'https://storage.googleapis.com/recipefy-407103.appspot.com/images/ingredient/1703600694459_wortel.jpeg'),
(16, 'Eggplant', 'https://storage.googleapis.com/recipefy-407103.appspot.com/images/ingredient/1703600764494_terong.jpeg'),
(17, 'Cabbage', 'https://storage.googleapis.com/recipefy-407103.appspot.com/images/ingredient/1703600792143_kubis.jpeg'),
(18, 'Spinach', 'https://storage.googleapis.com/recipefy-407103.appspot.com/images/ingredient/1703600813293_bayam.jpeg'),
(19, 'Lettuce', 'https://storage.googleapis.com/recipefy-407103.appspot.com/images/ingredient/1703600878531_kangkung.jpeg'),
(20, 'Bean sprouts', 'https://storage.googleapis.com/recipefy-407103.appspot.com/images/ingredient/1703600985013_kacangPanjang.jpeg'),
(21, 'Pumpkin', 'https://storage.googleapis.com/recipefy-407103.appspot.com/images/ingredient/1703601026301_labu.jpeg'),
(22, 'Oyster Mushroom', 'https://storage.googleapis.com/recipefy-407103.appspot.com/images/ingredient/1703601188837_jamurTiram.jpeg'),
(23, 'Milk', 'https://storage.googleapis.com/recipefy-407103.appspot.com/images/ingredient/1703601679650_susu.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `data_recipe`
--

CREATE TABLE `data_recipe` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `note` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `ingredients` json NOT NULL,
  `tools` json NOT NULL,
  `instructions` json NOT NULL,
  `updateTime` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `data_recipe`
--

INSERT INTO `data_recipe` (`id`, `name`, `image_url`, `note`, `ingredients`, `tools`, `instructions`, `updateTime`) VALUES
('2EA9ntyZsrK2mbUp', 'Chilled Asparagus Soup', 'https://storage.googleapis.com/recipefy-407103.appspot.com/images/food/1703624245630_Chilled-asparagus-soup-2.jpg', 'This Chilled Asparagus Soup is a perfect spring or summer dish with a velvety texture and a fresh, green flavor enhanced by spinach and a touch of olive oil.', '[\"6 tablespoons olive oil, divided, plus more for drizzling\", \"2 medium onions, thinly sliced\", \"3 pounds asparagus cut into 1/2\\\" pieces\", \"Kosher salt and freshly ground black pepper\", \"4 cups low-salt chicken broth\", \"8 ounces fresh spinach\", \"6 thin asparagus spears, tips removed, stalks halved crosswise, thinly sliced lengthwise\"]', '[\"Large Pot\", \"Blender\", \"Fine-Mesh Sieve\", \"Large Bowl\"]', '[\"Heat 4 tablespoons oil in a large pot over medium-low heat. Add onions and cook, stirring occasionally, until translucent, 8-10 minutes. Add 1/2\\\" asparagus pieces and season with salt and pepper. Cook until asparagus is bright green and tender, 4-5 minutes. Add broth, increase heat to high, and bring to a boil. Reduce heat to medium and simmer until asparagus is tender, 8-10 minutes. Add spinach and cook, stirring occasionally, until wilted, about 2 minutes. Let mixture cool slightly.\", \"Set a fine-mesh sieve over a large bowl; set aside. Working in batches, puree soup in a blender until very smooth. Strain through prepared sieve. Stir remaining 2 tablespoons oil into soup; season to taste with salt and pepper. Cover and chill until cold, at least 3 hours. Can be made 1 day ahead. Keep chilled.\", \"Divide asparagus tips and thinly sliced stalks among bowls; pour chilled soup over. Drizzle each with a few drops of oil.\"]', 1703624245),
('3MhURnIKypHraZ7B', 'Chicken Pelau', 'https://storage.googleapis.com/recipefy-407103.appspot.com/images/food/1703622388267_chickenpelau.jpg', 'Chicken Pelau is a flavorful Caribbean dish that combines chicken, rice, and peas with a blend of savory spices, coconut milk, and vegetables, all caramelized to perfection.', '[\"1 cup dry or 1 (12-ounce) can pigeon peas, pinto beans, or black-eyed peas\", \"2 cups long-grain rice\", \"3 tablespoons canola oil\", \"3/4 cup sugar (white or brown)\", \"1 (3-pound) chicken, cut into 8 pieces, skin removed\", \"1 small onion, chopped\", \"1 clove garlic, finely chopped\", \"1 cup coconut milk\", \"1 bay leaf\", \"2 teaspoons Green Seasoning\", \"1/2 cup chopped parsley\", \"1 sprig thyme\", \"2 carrots, peeled and chopped\", \"5 scallions, chopped (white and green parts)\", \"Kosher salt\", \"2 cups cubed fresh calabaza or butternut squash\", \"1 small whole Scotch bonnet pepper\", \"1/2 cup ketchup\", \"1 tablespoon butter\"]', '[\"Colander\", \"Saucepan\", \"Dutch Oven or Heavy Deep Pot\", \"Stirring Spoon\"]', '[\"If using dried peas, soak them overnight in 3 cups of water. Drain. Bring 3 fresh cups of water to a boil in a saucepan and add the peas. Simmer for 15 minutes, or until cooked almost completely through. Drain and set aside. If using canned beans, drain, rinse with cold water, drain again, and set aside.\", \"Wash the rice by placing it in a colander or fine-mesh sieve and running cold water over it until the water runs clear, about 1 minute. Drain well and set aside.\", \"Heat the oil over medium heat in a Dutch oven or other heavy, deep pot. Add the sugar and swirl in the pot, stirring constantly; allow it to caramelize to a dark brown color. Add the chicken and stir well to coat. Add the onion and garlic and cook for 1 to 2 minutes, stirring constantly.\", \"Stir in 2 cups of water, the coconut milk, bay leaf, Green Seasoning, parsley, thyme, carrots, and scallions. Season with salt. Reduce the heat to medium-low, cover, and simmer for 10 minutes.\", \"Stir the rice, squash, peas, hot pepper, ketchup, and butter into the chicken. Cover and cook for 20 minutes, or until the peas and vegetables are tender. Remove lid and fluff the rice. The rice should be moist but not sticky. Remove bay leaf, thyme sprig, and hot pepper.\"]', 1703622388),
('6HBIKdhKuAh3IZU_', 'Grilled Whole Eggplant with Harissa Vinaigrette', 'https://storage.googleapis.com/recipefy-407103.appspot.com/images/food/1703623673150_HarissaTahiniEggplant_Step3.jpg', 'A smoky and spicy dish, this Grilled Whole Eggplant with Harissa Vinaigrette blends the creaminess of eggplant with the tangy kick of harissa, all balanced with a touch of honey and fresh parsley.', '[\"1 large eggplant (about 1 1/2 lb.)\", \"1 tsp. kosher salt, divided\", \"1/4 cup extra-virgin olive oil\", \"1 Tbsp. fresh lemon juice\", \"1 Tbsp. harissa paste\", \"1 Tbsp. honey\", \"1/4 cup chopped parsley\", \"4–6 (1\\\"-thick) slices crusty bread, toasted on grill if desired\"]', '[\"Charcoal Grill or Gas Grill\", \"Wire Rack\", \"Rimmed Baking Sheet\", \"Small Bowl\", \"Paring Knife\", \"Plate\"]', '[\"Prepare a charcoal fire in a grill. Let coals cool to medium heat (coals should be covered with ash and glowing red with no black remaining).\", \"Grill eggplant directly on coals, turning occasionally, until skin is blackened and flesh has collapsed, 15–20 minutes. (Alternatively, grill on the grate of a gas or charcoal grill over medium-high heat, turning occasionally, 20–25 minutes.) Transfer to a wire rack set inside a rimmed baking sheet and let cool slightly.\", \"Carefully remove skin from eggplant, leaving stem intact. Season on all sides with 1/2 tsp. salt. Let sit on rack until excess water is drained, 20–30 minutes.\", \"Whisk oil, lemon juice, harissa, honey, and remaining 1/2 tsp. salt in a small bowl to combine.\", \"Using a paring knife, make several slits down the length of eggplant on each side. Transfer to a plate and pour dressing over. Top with parsley and serve with bread alongside.\"]', 1703623673),
('gyo_MCTEfSdUCrRf', 'Thanksgiving Mac and Cheese', 'https://storage.googleapis.com/recipefy-407103.appspot.com/images/food/1703621873697_macncheese.jpg', 'This Thanksgiving Mac and Cheese is a creamy, decadent side dish that combines rich cheeses and classic spices with elbow macaroni for a comfort food favorite.', '[\"1 cup evaporated milk\", \"1 cup whole milk\", \"1 tsp. garlic powder\", \"1 tsp. onion powder\", \"1 tsp. smoked paprika\", \"½ tsp. freshly ground black pepper\", \"1 tsp. kosher salt, plus more\", \"2 lb. extra-sharp cheddar, coarsely grated\", \"4 oz. full-fat cream cheese\", \"1 lb. elbow macaroni\"]', '[\"Oven\", \"Saucepan\", \"Whisk\", \"Colander\", \"Baking Dish\"]', '[\"Place a rack in middle of oven and preheat to 400°. Bring evaporated milk and whole milk to a bare simmer in a large saucepan over medium heat. Whisk in garlic powder, onion powder, paprika, pepper, and 1 tsp. salt. Working in batches, whisk in three fourths of the cheddar, then all of the cream cheese.\", \"Meanwhile, bring a large pot of generously salted water to a boil (it should have a little less salt than seawater). Cook macaroni, stirring occasionally, until very al dente, about 4 minutes. Drain in a colander.\", \"Add macaroni to cheese sauce in pan and mix until well coated. Evenly spread out half of macaroni mixture in a 13x9\\\" baking dish. Sprinkle half of remaining cheddar evenly over. Layer remaining macaroni mixture on top and sprinkle with remaining cheddar.\", \"Bake until all of the cheese is melted, about 10 minutes. Let cool slightly before serving.\"]', 1703621873),
('iE6bRlm1gUQRLyaD', 'Sweet Preserved Pumpkin', 'https://storage.googleapis.com/recipefy-407103.appspot.com/images/food/1703624032521_pumpkin-preserves-8.jpg', 'This traditional Sweet Preserved Pumpkin recipe is a slow-cooked delight, using simple ingredients to transform the humble pumpkin into a tender, candied dessert, spiced with allspice and canela.', '[\"One 7- to 8-pound pumpkin\", \"1/2 to 3/4 cup cal (slaked lime)\", \"4 or 5 short chunks (3 to 4 inches) fresh sugarcane, optional\", \"3 1/2 pounds Mexican brown loaf sugar (panela or piloncillo) or 3 1/2 pounds (about 8 cups) dark brown sugar\", \"2 teaspoons allspice berries, bruised\", \"1 6-inch piece canela\"]', '[\"Stainless-Steel or Heavy-Duty Plastic Bucket\", \"Wooden Spoon\", \"Large Heatproof Earthenware Vessel or Non-Reactive Stockpot\", \"Hammer\"]', '[\"Cut the pumpkin into 6 equal wedges. Remove and discard the seeds and stringy pulp, then cut each wedge in half crosswise. Prick the rind all over with the tines of a fork.\", \"Pour 5 quarts cold water into a bucket. Add 1/2 cup of the slaked lime and stir to dissolve thoroughly. Taste the solution; it should have an astringent \'bite.\' If not, stir in more lime a tablespoon at a time. Add the pumpkin wedges and loosely cover the bucket. Let stand overnight in a cool dark place.\", \"The next day, remove the pumpkin and rinse well under cold running water. The texture should now be firm.\", \"Prepare a large earthenware vessel or stockpot with a prop in the center. Use chunks of sugarcane for flavor and support, or simply place one of the curved pieces of pumpkin in the center. Rest the wedges of pumpkin against the support.\", \"Break up the loaf sugar into small pieces and scatter over the pumpkin. Add the allspice and canela. Add enough water to cover the pumpkin by 2 inches. Bring to a boil; cover the pot loosely and simmer for 5 hours. Remove from the heat and let stand overnight, uncovered or loosely covered.\", \"The next day, return the pumpkin to a simmer and cook for 5 hours. Let stand again overnight. On the third day, return to a simmer; the remaining syrup should be absorbed after 2 to 3 hours. Watch closely as the syrup disappears to prevent scorching. Let cool completely before serving.\"]', 1703624032),
('IYcTyo_JcZ-w7hOO', 'Caramelized Onion and Shallot Dip', 'https://storage.googleapis.com/recipefy-407103.appspot.com/images/food/1703623900132_shallot_dip.jpg', 'This rich and savory dip features a base of caramelized onions and shallots, accented with fresh thyme, tangy Sherry vinegar, and creamy sour cream, perfect for a sophisticated appetizer.', '[\"2 pounds large yellow or white onions, thinly sliced\", \"2 large shallots, thinly sliced (about 6 ounces total)\", \"4 sprigs thyme\", \"1/4 cup olive oil\", \"Kosher salt and freshly ground black pepper\", \"1 cup dry white wine\", \"2 tablespoons Sherry vinegar\", \"2 cups sour cream\", \"1/4 cup minced fresh chives\", \"1/4 cup plain whole-milk Greek yogurt\", \"2 teaspoons onion powder\"]', '[\"Large Roasting Pan\", \"Rimmed Baking Sheet\", \"Medium Bowl\"]', '[\"Preheat oven to 425°F. Mix onions, shallots, thyme sprigs, and oil in a large roasting pan. Season with salt and pepper.\", \"Roast onion mixture, stirring and scraping down sides of pan every 10 minutes, until mixture starts to break down and turn golden brown, 45-55 minutes.\", \"Discard thyme sprigs. Add wine and vinegar; stir to scrape up any browned bits from bottom of pan. Return onion mixture to oven. Continue roasting, stirring occasionally, until deep golden brown and completely caramelized, about 15 minutes longer. Spread onion mixture out on a rimmed baking sheet to cool.\", \"Transfer onion mixture to a work surface and mince. Transfer to a medium bowl. Stir in sour cream, chives, yogurt, and onion powder. Season with salt and pepper. Dip can be made 3 days ahead. Cover, chill.\"]', 1703623900),
('O4tUCnw_u-Y3bvzv', 'Okonomiyaki (\'As You Like It\') Pancakes With Bonito Flakes', 'https://storage.googleapis.com/recipefy-407103.appspot.com/images/food/1703622826271_okono.jpg', 'Okonomiyaki is a Japanese savory pancake that means \'grilled as you like it.\' It combines a variety of ingredients such as cabbage, meat, and seafood topped with mayonnaise, tonkatsu sauce, bonito flakes, and crumbled nori.', '[\"1 ½ cups (180 g) all-purpose flour\", \"1 teaspoon baking powder\", \"¼ teaspoon sea salt\", \"1 large egg, beaten\", \"1¼ cups (296 ml) whole milk or milk of your choice\", \"8 ounces (230 g) cabbage, thinly sliced\", \"2 scallions, white and light green parts chopped\", \"½ yellow, green, or red bell pepper, thinly sliced\", \"4 tablespoons vegetable oil\", \"8 ounces (230 g) boneless chicken, shrimp, crab, or sukiyaki-style beef or pork, cut into ½-inch (12 mm) pieces\", \"2 tablespoons mayonnaise\", \"2 tablespoon or more homemade or store-bought Tonkatsu Sauce\", \"½ cup (4 g) bonito flakes\", \"½ cup (4 g) crumbled nori\"]', '[\"Whisk\", \"Small Bowl\", \"Medium Bowl\", \"Medium Non-stick Skillet\", \"Spatula\"]', '[\"Whisk together the flour, baking powder, and salt in a small bowl.\", \"In a medium bowl, whisk the egg and milk. Add the flour mixture and mix until just blended. The batter should be quite thin. Add the chopped vegetables to the batter and mix well.\", \"Heat 1 tablespoon of the oil in a medium non-stick skillet over medium-high heat. Pour ¼ cup (60 ml) of the batter to make a 6-inch (15 cm) pancake. Cook until medium brown, about 1 minute. Place ¼ of the meat on top of the pancake and then flip the meat side down. Turn heat to low and cook until the bottom of the pancake is browned, the meat is thoroughly cooked, and the vegetables are tender—about 10 minutes. Repeat until the batter is used up.\", \"To serve, brush the pancake with mayonnaise and tonkatsu sauce, or soy sauce. Sprinkle with the bonito flakes and crumbled nori. Eat while piping hot.\"]', 1703622826),
('RVxTJvfNe-yZSoS_', 'Tofu and Summer Vegetable Curry', 'https://storage.googleapis.com/recipefy-407103.appspot.com/images/food/1703623285922_Summer-Tofu-Curry-Featured-Image.jpg', 'A light and aromatic summer vegetable curry that pairs the soft texture of tofu with the freshness of zucchini, eggplant, and green beans, all simmered in a rich coconut curry sauce.', '[\"4 Tbsp. virgin coconut oil or extra-virgin olive oil, divided\", \"1 (14-oz.) package firm or extra-firm tofu, patted dry, cut into 1/2\\\" cubes\", \"Kosher salt\", \"2 medium onions, coarsely chopped\", \"1/3 cup red curry paste\", \"2 large zucchini, cut into 1/2\\\" pieces\", \"1 large or 2 small Japanese eggplant, cut into 1/2\\\" pieces\", \"8 oz. green beans, trimmed, cut into 1\\\" pieces\", \"1 (13.5-oz.) can unsweetened coconut milk\", \"Lime wedges, cilantro leaves with tender stems, and coarsely chopped salted, roasted peanuts (for serving)\"]', '[\"Large Skillet\", \"Paper Towels\", \"Large Pot or High-sided Skillet\", \"Stirring Spoon\"]', '[\"Heat 2 Tbsp. oil in a large skillet, preferably nonstick, over medium-high. Add tofu in a single layer and cook, turning over once, until cooked sides are golden brown, about 4 minutes. Transfer to paper towels to drain. Season with kosher salt.\", \"Heat remaining 2 Tbsp. oil in a large pot or high-sided skillet over medium-high. Add onions and a generous pinch of salt and stir to coat. Cook, stirring often, until softened, about 4 minutes. Stir in curry paste and cook, stirring often, until darkened in color, about 2 minutes. Add zucchini, eggplant, and green beans and cook, tossing to coat, until vegetables are softened and starting to brown in spots, 5–7 minutes. Pour in coconut milk and 1/2 cup water and bring to a simmer.\", \"Add tofu to pot and stir gently to combine. Cook until warmed through, about 3 minutes. Season with more salt if needed.\", \"Divide curry among bowls and add a generous squeeze of lime juice to each. Top with cilantro and peanuts.\"]', 1703623286),
('ShuLiMBweGHvBXbR', 'Crispy Salt and Pepper Potatoes', 'https://storage.googleapis.com/recipefy-407103.appspot.com/images/food/1703621361692_crispysalt.jpg', 'Crispy salt and pepper smashed potatoes is the perfect mix of creamy mashed potatoes and crisp roast potatoes and makes an easy, delicious side dish.', '[\"2 large egg whites\", \"1 pound new potatoes\", \"2 teaspoons kosher salt\", \"¾ teaspoon finely ground black pepper\", \"1 teaspoon finely chopped rosemary\", \"1 teaspoon finely chopped thyme\", \"1 teaspoon finely chopped parsley\"]', '[\"Oven\", \"Bowl\", \"Baking Sheet\", \"Knife\"]', '[\"Preheat oven to 400°F and line a rimmed baking sheet with parchment. In a large bowl, whisk the egg whites until foamy (there shouldn\'t be any liquid whites in the bowl).\", \"Add the potatoes and toss until they\'re well coated with the egg whites, then transfer to a strainer or colander and let the excess whites drain.\", \"Season the potatoes with the salt, pepper, and herbs.\", \"Scatter the potatoes on the baking sheet (make sure they\'re not touching) and roast until the potatoes are very crispy and tender when poked with a knife, 15 to 20 minutes (depending on the size of the potatoes). \", \"Transfer to a bowl and serve.\"]', 1703621361),
('Sj5Q7HOLqWJ7kswv', 'Italian Sausage and Bread Stuffing', 'https://storage.googleapis.com/recipefy-407103.appspot.com/images/food/1703622125421_italiansausage.jpg', 'This Italian Sausage and Bread Stuffing recipe creates a rich and flavorful accompaniment to any holiday meal, featuring sweet Italian sausage and a blend of aromatic vegetables and herbs.', '[\"1 (¾- to 1-pound) round Italian loaf, cut into 1-inch cubes (8 cups)\", \"2 tablespoons olive oil, divided\", \"2 pounds sweet Italian sausage, casings removed, divided\", \"1 stick unsalted butter, cut into pieces\", \"3 medium onions, chopped\", \"4 large celery ribs, chopped\", \"5 garlic cloves, minced\", \"4 large eggs, lightly beaten\", \"¾ cup heavy cream, divided\", \"½ cup turkey giblet stock or reduced-sodium chicken broth\", \"1 cup grated Parmigiano-Reggiano (2 ounces)\", \"½ cup coarsely chopped flat-leaf parsley\", \"4-qt shallow ceramic or glass baking dish\"]', '[\"Oven\", \"Baking Pans\", \"Heavy Skillet\", \"Slotted Spoon\", \"Large Bowl\", \"Whisk\"]', '[\"Preheat oven to 350°F with rack in middle. Generously butter baking dish.\", \"Put bread in 2 shallow baking pans and bake, switching position of pans halfway through baking, until just dried out, about 10 minutes.\", \"Heat 1 tablespoon oil in a 12-inch heavy skillet over medium-high heat until it shimmers, then cook half of sausage, stirring and breaking it into small pieces, until golden brown, about 6 minutes. Transfer with a slotted spoon to a large bowl. Brown remaining sausage in remaining tablespoon oil, transferring to bowl.\", \"Pour off fat from skillet and wipe clean. Heat butter over medium heat until foam subsides, then cook onions, celery, garlic, and ½ teaspoon each of salt and pepper, stirring occasionally, until golden, 12 to 15 minutes. Add vegetables and bread to sausage.\", \"Whisk together eggs, ½ cup cream, turkey stock, cheese, and parsley, then stir into stuffing and cool completely, about 30 minutes. Reserve 5 cups stuffing to stuff turkey and spoon remainder into baking dish, then drizzle with remaining ¼ cup cream. Cover stuffing and chill.\", \"About 1 hour before stuffed turkey is finished roasting, bring dish of stuffing to room temperature. When turkey is done, increase oven temperature to 425°F and bake stuffing, covered tightly with foil, until hot throughout, about 20 minutes. Remove foil and bake until top is golden and crisp, about 15 minutes more.\"]', 1703622125),
('x2ZQLCOwnlAoargu', 'Best Deviled Eggs', 'https://storage.googleapis.com/recipefy-407103.appspot.com/images/food/1703622616048_deviledeggs.jpg', 'Classic deviled eggs are a simple and elegant appetizer, perfect for any gathering. They are made with creamy mayonnaise, a hint of Dijon mustard, and a touch of cayenne for a slight kick.', '[\"6 large eggs\", \"1/4 cup mayonnaise\", \"1 teaspoon Dijon mustard\", \"1/8 teaspoon cayenne\", \"Garnishes: paprika and chopped fresh chives\", \"Pastry bag fitted with 1/2-inch star tip (optional)\"]', '[\"3-quart Heavy Saucepan\", \"Bowl of Ice and Cold Water\", \"Slotted Spoon\", \"Fork\", \"Pastry Bag with 1/2-inch Star Tip (optional)\"]', '[\"Cover eggs with cold water by 1 1/2 inches in a 3-quart heavy saucepan and bring to a rolling boil, partially covered. Reduce heat to low and cook eggs, covered completely, 30 seconds. Remove from heat and let stand, covered, 15 minutes. Transfer eggs with a slotted spoon to a bowl of ice and cold water to stop cooking and let stand 5 minutes.\", \"Peel eggs and halve lengthwise. Carefully remove yolks and mash in a bowl with a fork. Add mayonnaise, mustard, and cayenne and stir with fork until smooth, then season with salt and pepper. Fill pastry bag with yolk mixture and pipe into egg whites.\"]', 1703622616),
('XR5ap5iYgNHzBLbu', 'Tomato Fried Rice', 'https://storage.googleapis.com/recipefy-407103.appspot.com/images/food/1703623421199_Tomato-Egg-Fried-Rice.jpg', 'This vibrant Tomato Fried Rice recipe features a mix of colorful cherry tomatoes and fragrant scallions, ginger, and garlic, with a hint of toasted sesame and a kick of red pepper flakes.', '[\"4 scallions\", \"1 lb. cherry and/or grape tomatoes of any and all colors\", \"Kosher salt\", \"2 Tbsp. toasted sesame oil, divided\", \"3 garlic cloves, finely grated\", \"1 1/2 tsp. finely grated peeled ginger\", \"2 1/2 cups chilled cooked long-grain white or brown rice\", \"3 large eggs, beaten to blend\", \"1 Tbsp. soy sauce\", \"Extra-virgin olive oil (for drizzling)\", \"Crushed red pepper flakes (for serving, optional)\", \"1/2 lemon\"]', '[\"Large Skillet\", \"Bowl or Platter\", \"Grater\"]', '[\"Trim dark green tops from scallions and thinly slice; set aside. Thinly slice white and pale green parts.\", \"Heat 1 Tbsp. sesame oil in a large skillet over medium-high. Add reserved white and pale green parts of scallions and remaining 3/4 of tomatoes and cook, stirring occasionally, until softened and any liquid from tomatoes has evaporated, about 4 minutes. Mix in garlic and ginger; cook, stirring constantly, until fragrant, about 30 seconds. Add rice and stir to separate grains. Cook just to heat rice through, about 3 minutes.\", \"Scoot vegetables and rice to 1 side of skillet, then pour half of remaining sesame oil into pan. Add eggs and cook, stirring often, until just set, about 1 minute. Mix into vegetables and rice, then drizzle in soy sauce and cook, stirring, just until well combined.\", \"Transfer fried rice to a large bowl or platter. Drain salted tomatoes, drizzle with olive oil, and spoon over rice. Sprinkle with reserved scallion tops and red pepper flakes (if using) and drizzle with remaining sesame oil. Finely grate zest from lemon over.\"]', 1703623421),
('Y3Cvsn-AoQl1VSFt', 'Tomato Eggs', 'https://storage.googleapis.com/recipefy-407103.appspot.com/images/food/1703623006902_tomatoeggs.jpg', 'Tomato Eggs is a delightful dish combining the richness of eggs with the acidity of tomatoes, enhanced with the umami from tuna and anchovies, and garnished with crispy capers and optional salmon roe.', '[\"12 large eggs\", \"1 (6-oz.) can oil-packed tuna\", \"2 oil-packed anchovy fillets\", \"1/2 cup mayonnaise\", \"2 Tbsp. fresh lemon juice\", \"2 Tbsp. capers, drained, divided\", \"1/2 tsp. kosher salt\", \"4 Tbsp. extra-virgin olive oil, divided\", \"2 Tbsp. salmon roe (optional)\"]', '[\"Large Pot\", \"Food Processor\", \"Platter\", \"Pastry Bag or Resealable Plastic Bag\", \"Small Skillet\", \"Paper-Towel-Lined Plate\"]', '[\"Bring a large pot of water to a boil over medium-high heat. Gently lower cold eggs into water. Cook 10 minutes, then drain and transfer to a large bowl of ice water.\", \"Carefully peel eggs and cut in half lengthwise. (To get clean cuts, use a very sharp knife and wipe the blade between each cut.) Pop out yolks and transfer to a food processor. Arrange whites on a platter.\", \"Add tuna, anchovies, mayonnaise, lemon juice, and 2 tsp. capers to food processor and purée until smooth. Add salt and 2 Tbsp. oil and pulse just until combined. Transfer to a pastry bag or resealable plastic bag and snip the corner. Pipe into egg whites.\", \"Cook remaining 4 tsp. capers and 2 Tbsp. oil in a small skillet over medium heat, stirring occasionally, until capers are crispy, 3–4 minutes. Transfer to a paper-towel-lined plate and let cool.\", \"Top eggs with crispy capers and salmon roe (if using).\"]', 1703623007);

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int NOT NULL,
  `userId` varchar(255) NOT NULL,
  `recipeId` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userId` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userId`, `email`, `username`, `password`) VALUES
('aA8mAMYiChgp8cru3aCzRvxZQoC2', 'testimoni@gmail.com', '123r', '$2a$10$M4oge92BRFcnw6Dwydcx/u/EDvvNmtotfUrK7c8QJVaHcpaTIMrUS'),
('bBFAxIIPCdPjwqFzgdE2prTA4jI3', 'cxa@email.com', 'sdf', '$2a$10$sgHb5nK5DHfSOismPVhTmu.HHwr.kp0HJAj4olptMaXlwIWdyhtSG'),
('bmtYjbIUW1f0Ylg8UKCcv3z70AF3', 'vioart6@gmail.com', 'asdsa', '$2a$10$eb1Yd7CJi4JyOMI4ZlgsC.whKHMbckdyt5HgUSGjIU3YS2nTJ3TMy'),
('CCXlFxmoZCdAMLD9alic2V8cLmw1', 'bagus@gmail.com', 'bagus', '$2a$10$Ey1/r1z1tlKEZlwRVhpvsu.af.SUTnQuOwokkAN93c1/MZtmZJc6.'),
('d6QmEJhFXIc4471Ch2VAoY6aueI2', 'shssh@gmail.com', 'usjssj', '$2a$10$9uJS7Uzot6e86KEszuv6peBAPhl7HyF4yq9O9GqT9k7R1xiKCqGGq'),
('eouogbSqfzU4m9NrmrRAv2U2Fjn1', 'vio@email.com', 'vio', '$2a$10$ymNIS8GXVu.n/sVXLHpiJeOQwq70HO65TAPI6mQtw6uPJgO6Q7Usy'),
('F2a5LaWEV1OOFr1jc4ccQDcFkO52', 'user@gmail.com', 'user1', '$2a$10$52Duw7o2wCdbkEJ9hSRmZ.8g4KWbc8F.L0ZwNS/xK5dq1ldqe4PFe'),
('gToHU3jYMxPtdoJ3tEeS42stMpa2', 'joko@gmail.com', 'hahahaha', '$2a$10$MFqkmq65DU/Va3z/5l80/eHB2Nw7n4BO/ZPLty8i56c0zIeJk5oc.'),
('KHbYMYBH8tStWtFSZDqtyeFGS413', 'dayat@gmail.com', 'dayatimut', '$2a$10$WhYmNB3p.FI22syV8aYXTuXhgzQramuhz6l39B4fAlYZdK.hFjAze'),
('LAdrKQzPnVSEoi7pxAWEnpBspS53', 'tes12345@email.com', 'tes12345', '$2a$10$AlpmQcKAD5duGA7Q6nqFk.DZUjsHCk5xA8OYHUMCX4lnFbzYvGvGm'),
('LVWUbNjiBvf6Da6csu2cm3L1r8r1', 'vioart0@gmail.com', 'vio', '$2a$10$6mBmfPcnPl3mUcQ2YadF8euLhR4u/XqJ.xsvTr94WlUlMfp04Y8xS'),
('LZLzib0AOOcGXSJAckJOYV6fEaH2', 'bangkit@gmail.com', 'Bangkit', '$2a$10$3YAdAEMLv82.mzTYdaSl0.0dKB6YI.y2ujLLoTefRf7U8SP0Eb8rG'),
('mxUf5kNk7qd95HI2q0xsvJSXlHK2', 'asdd@gmail.com', 'asdas', '$2a$10$YSrdX1pJrCQuU6aBd1swdeca/aavEtfyOJMTMg7xqdIgcIlv5Gkcu'),
('sWV3I7RDEaVGs422J2tGkNdZ4xI2', 'vioart@gmail.com', 'vio12345', '$2a$10$UmQtUSXRRMxHE5Dc/2/gNuh.lEWyMCmqk09n7kcyaBCJRuLPI3oPG'),
('tc3VYjxaEdS2RXYsE918dCpTXyV2', 'sjsj@gmail.com', 'shsh', '$2a$10$QUQSktTKNCVPXisQBmXLhOv1dEqkRrdZGYISpBUOVYfu8fotWpqJK'),
('WUEQhyRPNocKVio9ie99iBzFZLR2', 'asd@gmail.com', 'asdas', '$2a$10$pSCL0C0k04ZzSBdLAjC9FujpyITotKsIAd14C.WCk.dQ5hOQeubam'),
('xeJX7sW5FvZx0aOT3KAPH01pNRm1', 'bagus@gmail.com', 'bagus', '$2a$10$SXi9C8Jbsj6vY4ciB1it/ekCzVPU/Pswte/gfseHhGp9hZ./Hk4T.'),
('XGQsLAgIYHdAMcWSU1c09KaC5I93', 'cxa@email.com', 'sdf', '$2a$10$9uLH49SKN2t2xfa9nAx65.osEIrxV4Sk6GMtKUQ3zo9RzBfFbegZq');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_ingredients`
--
ALTER TABLE `data_ingredients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_recipe`
--
ALTER TABLE `data_recipe`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `recipeId` (`recipeId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data_ingredients`
--
ALTER TABLE `data_ingredients`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`),
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`recipeId`) REFERENCES `data_recipe` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
