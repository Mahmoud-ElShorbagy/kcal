import 'package:kcal/models/categorey_dto.dart';

final List<String> imageRecipe = [
  "chicken_burger",
  "crispy_indian",
  "spicy_veg",
  "fruity_nuggets",
  "egg",
  "mutton_kebab",
  "fish_steaks",
  "choco_lamb",
  "chicken_leg",
  "fruit_veggie"
];

final List<String> textTime = [
  " 15 min",
  " 15 min",
  " 20 min",
  " 45 min",
  " 35 min",
  " 45 min",
  " 30 min",
  " 15 min",
  " 20 min",
  " 30 min",
];
final List<String> serve = [
  " 6 serve",
  " 4 serve",
  " 8 serve",
  " 10 serve",
  " 12 serve",
  " 14 serve",
  " 6 serve",
  " 3 serve",
  " 2 serve",
  " 1 serve",
];
final List<String> titleRecipe = [
  "Chicken Burger",
  "Crispy Indian Breads",
  "Spicy Veg Salad",
  "Fruity Nuggets",
  "Egg Omelet Curry",
  "Mutton Kebab Nuggets",
  "Fish Steaks Veggie Sauce",
  "Choco Lamb Veggies",
  "Chicken Leg Piece",
  "Fruit Veggie Mix With Meat"
];
final List<String> contentRecipe = [
  "Mouth watering burger with french side toppings.",
  "Crispy breads and your favorite sauce to eat with veg toppings.",
  "Healthy bowl of veg salad mixed with Indian spices and chillies.",
  "Healthy and fruity nuggets with lemon and berry toppings.",
  "Egg omelet curry mixed with Indian vegetables and spices.",
  "Crunchy mutton kebabs with chilli toppings and sauce.",
  "Boneless with stakes with crispy fried sauce and toppings.",
  "Deeply fried lamb meat with choco dips and fresh vegetables.",
  "Crispy chicken lep pieces with side veggies and sauce.",
  "Crunchy deep fried meat mixed with fruits and vegetables."
];
final List<CategoryRecipeDTO> categoryRecipe = [
  ...List.generate(titleRecipe.length, (index) {
    return CategoryRecipeDTO(
        image: imageRecipe[index],
        textTime: textTime[index],
        serve: serve[index],
        title: titleRecipe[index],
        content: contentRecipe[index]);
  })
];
