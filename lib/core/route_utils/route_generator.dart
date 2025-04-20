import 'package:flutter/material.dart';
import 'package:kcal/auth/pick_photo/view.dart';
import 'package:kcal/view/chat_with_us/view.dart';
import 'package:kcal/view/confirm_terms/view.dart';
import 'package:kcal/view/completion_page/view.dart';
import 'package:kcal/view/faqs/view.dart';
import 'package:kcal/view/foods_page/details/details_burger.dart';
import 'package:kcal/view/foods_page/details/details_cake.dart';
import 'package:kcal/view/foods_page/details/details_chicken.dart';
import 'package:kcal/view/foods_page/details/details_cookie.dart';
import 'package:kcal/view/foods_page/details/details_croissant.dart';
import 'package:kcal/view/foods_page/details/details_donuts.dart';
import 'package:kcal/view/foods_page/details/details_fish.dart';
import 'package:kcal/view/foods_page/details/details_fries.dart';
import 'package:kcal/view/foods_page/details/details_fruits.dart';
import 'package:kcal/view/foods_page/details/details_hotdog.dart';
import 'package:kcal/view/foods_page/details/details_pasta.dart';
import 'package:kcal/view/foods_page/details/details_pizza.dart';
import 'package:kcal/view/foods_page/details/details_rice.dart';
import 'package:kcal/view/foods_page/details/details_sandwacho.dart';
import 'package:kcal/view/foods_page/details/details_sandwichtw.dart';
import 'package:kcal/view/foods_page/details/details_sausage.dart';
import 'package:kcal/view/foods_page/details/details_shrimp.dart';
import 'package:kcal/view/foods_page/view.dart';
import 'package:kcal/view/help_center/view.dart';
import 'package:kcal/view/home/setting/view.dart';
import 'package:kcal/view/message/view.dart';
import 'package:kcal/view/premium/view.dart';
import 'package:kcal/view/product_recipes/recipes_chicken_leg.dart';
import 'package:kcal/view/product_recipes/recipes_choco_lamb.dart';
import 'package:kcal/view/product_recipes/recipes_egg_omelet.dart';
import 'package:kcal/view/product_recipes/recipes_fish_steaks.dart';
import 'package:kcal/view/product_recipes/recipes_fruit_veggie.dart';
import 'package:kcal/view/product_recipes/recipes_fruity_nuggets.dart';
import 'package:kcal/view/product_recipes/recipes_mutton_kebab.dart';
import 'package:kcal/view/product_recipes/recipes_spicy_veg.dart';
import 'package:kcal/view/profile/units/edit_veiw.dart';
import 'package:kcal/view/service_terms/view.dart';
import 'package:kcal/view/subscriptions/view.dart';

import '../../auth/email_sent/view.dart';
import '../../auth/forget_password/view.dart';
import '../../auth/get_started/view.dart';
import '../../auth/login/view.dart';
import '../../auth/register/view.dart';
import '../../view/app_bottom_nav_bar/view.dart';
import '../../view/product_recipes/recipes_burger.dart';
import '../../view/product_recipes/recipes_crispy.dart';
import '../../view/recipes_page/view.dart';
import '../../view/walkthrough/view.dart';
import 'route_names.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> appRoutes = {
    RouteNames.walkthrough: (context) => const WalkthroughView(),
    RouteNames.register: (context) => const RegisterView(),
    RouteNames.login: (context) => const LoginView(),
    RouteNames.forgetPassword: (context) => const ForgetPasswordView(),
    RouteNames.emailSent: (context) => const EmailSentView(),
    RouteNames.pickPhoto: (context) => const PickPhotoView(),
    RouteNames.getStarted: (context) => const GetStartedView(),
    RouteNames.confirmTerms: (context) => const ConfirmTermsPageView(),
    RouteNames.serviceTerms: (context) => const ServiceTermsPage(),
    RouteNames.completion: (context) => const CompletionPageView(),
    RouteNames.appBottomNavigationBar: (context) =>
        const AppBottomNavigationBar(),
    RouteNames.recipesPage: (context) => const RecipesPageView(),
    RouteNames.foodsPage: (context) => const FoodsPageView(),
    RouteNames.recipesBurger: (context) => const RecipesBurgerView(),
    RouteNames.recipesCrispy: (context) => const RecipesCrispyView(),
    RouteNames.recipesSpicyVeg: (context) => const RecipesSpicyVegView(),
    RouteNames.recipesFruityNuggets: (context) =>
        const RecipesFruityNuggetsView(),
    RouteNames.recipesEggOmelet: (context) => const RecipesEggOmeletView(),
    RouteNames.recipesMuttonKebab: (context) => const RecipesMuttonKebabView(),
    RouteNames.recipesChocoLamb: (context) => const RecipesChocoLambView(),
    RouteNames.recipesChickenLeg: (context) => const RecipesChickenLegView(),
    RouteNames.recipesFruitVeggie: (context) => const RecipesFruitVeggieView(),
    RouteNames.detailsBurger: (context) => const DetailsBurgerView(),
    RouteNames.detailsCake: (context) => const DetailsCakeView(),
    RouteNames.detailsChicken: (context) => const DetailschickenView(),
    RouteNames.detailsCookie: (context) => const DetailsCookieView(),
    RouteNames.detailsCroissant: (context) => const DetailsCroissantView(),
    RouteNames.detailsDonuts: (context) => const DetailsDonutsView(),
    RouteNames.detailsFish: (context) => const DetailsFishView(),
    RouteNames.detailsFries: (context) => const DetailsFriesView(),
    RouteNames.detailsFruits: (context) => const DetailsFruitsView(),
    RouteNames.detailsHotdog: (context) => const DetailsHotDogsView(),
    RouteNames.detailsPasta: (context) => const DetailsPastaView(),
    RouteNames.detailsPizza: (context) => const DetailsPizzaView(),
    RouteNames.detailsRice: (context) => const DetailsRiceView(),
    RouteNames.detailsSandwicho: (context) => const DetailsSandwichOView(),
    RouteNames.detailsSandwichtw: (context) => const DetailsSandwichTwView(),
    RouteNames.detailsSausage: (context) => const DetailsSausageView(),
    RouteNames.detailsShrimp: (context) => const DetailsShrimpView(),
    RouteNames.settings: (context) => const SettingView(),
    RouteNames.editProfile: (content) => const EditProfileView(),
    RouteNames.subscriptions: (context) => const SubscriptionsView(),
    RouteNames.helpCenter: (context) => const HelpCenterView(),
    RouteNames.faqs: (context) => const FAQSView(),
    RouteNames.chatWithUs: (context) => const ChatWithUsView(),
    RouteNames.message: (context) => const MessageView(),
    RouteNames.premium: (context) => const PremiumView(),
  };
  static Route<dynamic> generateRoute(RouteSettings settings) {
    return RouteGenerator.generateRoute(settings);
  }
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.walkthrough:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const WalkthroughView());
      case RouteNames.register:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const RegisterView());
      case RouteNames.login:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const LoginView());
      case RouteNames.forgetPassword:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const ForgetPasswordView());
      case RouteNames.emailSent:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const EmailSentView());
      case RouteNames.pickPhoto:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const PickPhotoView());
      case RouteNames.getStarted:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const GetStartedView());
      case RouteNames.confirmTerms:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const ConfirmTermsPageView());
      case RouteNames.serviceTerms:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const ConfirmTermsPageView());
      case RouteNames.completion:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const CompletionPageView());
      case RouteNames.appBottomNavigationBar:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const AppBottomNavigationBar(),
        );
      case RouteNames.recipesPage:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const RecipesPageView(),
        );
      case RouteNames.foodsPage:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const FoodsPageView(),
        );
      case RouteNames.recipesBurger:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const RecipesBurgerView(),
        );
      case RouteNames.recipesCrispy:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const RecipesCrispyView(),
        );
      case RouteNames.recipesSpicyVeg:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const RecipesSpicyVegView(),
        );
      case RouteNames.recipesFruityNuggets:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const RecipesFruityNuggetsView(),
        );
      case RouteNames.recipesEggOmelet:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const RecipesEggOmeletView(),
        );
      case RouteNames.recipesMuttonKebab:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const RecipesMuttonKebabView(),
        );
      case RouteNames.recipesFishSteaks:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const RecipesFishSteaksView(),
        );
      case RouteNames.recipesChocoLamb:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const RecipesChocoLambView(),
        );
      case RouteNames.recipesChickenLeg:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const RecipesChickenLegView(),
        );
      case RouteNames.recipesFruitVeggie:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const RecipesFruitVeggieView(),
        );
      case RouteNames.detailsBurger:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const DetailsBurgerView());
      case RouteNames.detailsCake:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const DetailsCakeView());
      case RouteNames.detailsChicken:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const DetailschickenView());
      case RouteNames.detailsCookie:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const DetailsCookieView());
      case RouteNames.detailsCroissant:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const DetailsCroissantView());
      case RouteNames.detailsPizza:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const DetailsPizzaView());
      case RouteNames.detailsDonuts:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const DetailsDonutsView());
      case RouteNames.detailsFish:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const DetailsFishView());
      case RouteNames.detailsFries:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const DetailsFriesView());
      case RouteNames.detailsFruits:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const DetailsFruitsView());
      case RouteNames.detailsHotdog:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const DetailsHotDogsView());
      case RouteNames.detailsPasta:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const DetailsPastaView());
      case RouteNames.detailsRice:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const DetailsRiceView());
      case RouteNames.detailsSandwicho:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const DetailsSandwichOView());
      case RouteNames.detailsSandwichtw:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const DetailsSandwichTwView());
      case RouteNames.detailsSausage:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const DetailsSausageView());
      case RouteNames.detailsShrimp:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const DetailsShrimpView());
      case RouteNames.settings:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const SettingView());
      case RouteNames.editProfile:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const EditProfileView());
      case RouteNames.subscriptions:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const SubscriptionsView());
      case RouteNames.helpCenter:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const HelpCenterView(),
        );
      case RouteNames.faqs:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const FAQSView());
      case RouteNames.chatWithUs:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const ChatWithUsView());
      case RouteNames.message:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const MessageView());
      case RouteNames.premium:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const PremiumView());
      default:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const WalkthroughView());
    }
  }
}
