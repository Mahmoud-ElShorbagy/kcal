//this file contains all the functions that are used to navigate between screens
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kcal/core/helpers/app_colors.dart';
import 'package:kcal/core/route_utils/route_names.dart';
import 'package:kcal/models/categorey_dto.dart';
import 'package:kcal/models/foods_variables.dart';
import 'package:kcal/models/recipe_variables.dart';
import 'package:kcal/widgets/app/app_snack_bar.dart';

class RouteUtils {
  static void navigateToCategoryRecipe(
      final CategoryRecipeDTO favoriteRecipes, final BuildContext context) {
    if (favoriteRecipes.image == categoryRecipe[0].image) {
      Navigator.pushNamed(context, RouteNames.recipesBurger);
    } else if (favoriteRecipes.image == categoryRecipe[1].image) {
      Navigator.pushNamed(context, RouteNames.recipesCrispy);
    } else if (favoriteRecipes.image == categoryRecipe[2].image) {
      Navigator.pushNamed(context, RouteNames.recipesSpicyVeg);
    } else if (favoriteRecipes.image == categoryRecipe[3].image) {
      Navigator.pushNamed(context, RouteNames.recipesFruityNuggets);
    } else if (favoriteRecipes.image == categoryRecipe[4].image) {
      Navigator.pushNamed(context, RouteNames.recipesEggOmelet);
    } else if (favoriteRecipes.image == categoryRecipe[5].image) {
      Navigator.pushNamed(context, RouteNames.recipesMuttonKebab);
    } else if (favoriteRecipes.image == categoryRecipe[6].image) {
      Navigator.pushNamed(context, RouteNames.recipesFishSteaks);
    } else if (favoriteRecipes.image == categoryRecipe[7].image) {
      Navigator.pushNamed(context, RouteNames.recipesChocoLamb);
    } else if (favoriteRecipes.image == categoryRecipe[8].image) {
      Navigator.pushNamed(context, RouteNames.recipesChickenLeg);
    } else if (favoriteRecipes.image == categoryRecipe[9].image) {
      Navigator.pushNamed(context, RouteNames.recipesFruitVeggie);
    }
  }

  static void navigateToCategoryFoods(
      final CategoryDTO fvoriteFoods, final BuildContext context) {
    if (fvoriteFoods.imageUrl == categoryFoods[0].imageUrl) {
      Navigator.pushNamed(context, RouteNames.detailsCookie);
    } else if (fvoriteFoods.imageUrl == categoryFoods[1].imageUrl) {
      Navigator.pushNamed(context, RouteNames.detailsBurger);
    } else if (fvoriteFoods.imageUrl == categoryFoods[2].imageUrl) {
      Navigator.pushNamed(context, RouteNames.detailsCake);
    } else if (fvoriteFoods.imageUrl == categoryFoods[3].imageUrl) {
      Navigator.pushNamed(context, RouteNames.detailsPizza);
    } else if (fvoriteFoods.imageUrl == categoryFoods[4].imageUrl) {
      Navigator.pushNamed(context, RouteNames.detailsDonuts);
    } else if (fvoriteFoods.imageUrl == categoryFoods[5].imageUrl) {
      Navigator.pushNamed(context, RouteNames.detailsFries);
    } else if (fvoriteFoods.imageUrl == categoryFoods[6].imageUrl) {
      Navigator.pushNamed(context, RouteNames.detailsHotdog);
    } else if (fvoriteFoods.imageUrl == categoryFoods[7].imageUrl) {
      Navigator.pushNamed(context, RouteNames.detailsChicken);
    } else if (fvoriteFoods.imageUrl == categoryFoods[8].imageUrl) {
      Navigator.pushNamed(context, RouteNames.detailsCroissant);
    } else if (fvoriteFoods.imageUrl == categoryFoods[9].imageUrl) {
      Navigator.pushNamed(context, RouteNames.detailsFish);
    } else if (fvoriteFoods.imageUrl == categoryFoods[10].imageUrl) {
      Navigator.pushNamed(context, RouteNames.detailsPasta);
    } else if (fvoriteFoods.imageUrl == categoryFoods[11].imageUrl) {
      Navigator.pushNamed(context, RouteNames.detailsRice);
    } else if (fvoriteFoods.imageUrl == categoryFoods[12].imageUrl) {
      Navigator.pushNamed(context, RouteNames.detailsSandwicho);
    } else if (fvoriteFoods.imageUrl == categoryFoods[13].imageUrl) {
      Navigator.pushNamed(context, RouteNames.detailsSandwichtw);
    } else if (fvoriteFoods.imageUrl == categoryFoods[14].imageUrl) {
      Navigator.pushNamed(context, RouteNames.detailsSausage);
    } else if (fvoriteFoods.imageUrl == categoryFoods[15].imageUrl) {
      Navigator.pushNamed(context, RouteNames.detailsShrimp);
    } else if (fvoriteFoods.imageUrl == categoryFoods[16].imageUrl) {
      Navigator.pushNamed(context, RouteNames.detailsFruits);
    }
  }

  static String getIntialRoute() {
    return (FirebaseAuth.instance.currentUser != null &&
            FirebaseAuth.instance.currentUser!.emailVerified)
        ? RouteNames.appBottomNavigationBar
        : RouteNames.walkthrough;
  }

  static Future<void> signOut(BuildContext context) async {
    GoogleSignIn().disconnect();
    await FirebaseAuth.instance.signOut();
    Navigator.pushNamedAndRemoveUntil(
        // ignore: use_build_context_synchronously
        context,
        RouteNames.login,
        (route) => false);
    appSnackBar(context, "Signed Out", AppColors.red);
  }
}
