import 'package:kcal/core/helpers/utils.dart';
import 'package:kcal/models/categorey_dto.dart';

final List<String> nameFoods = [
  "Cookie",
  "Burger",
  "Cakes",
  "Pizza",
  "Donuts",
  "fries",
  "HoTDog",
  "Chicken",
  "Croissant",
  "Fish",
  "Pasta",
  "Rice",
  "Sandwich",
  "Sandwich",
  "Sausage",
  "Shrimp",
  "Fruits",
];
final List<String> imagesFood = [
  Utils.getAssetSVGPath("cookie"),
  Utils.getAssetSVGPath("burger"),
  Utils.getAssetSVGPath("cakes"),
  Utils.getAssetSVGPath("pizza"),
  Utils.getAssetSVGPath("donuts"),
  Utils.getAssetSVGPath("fries"),
  Utils.getAssetSVGPath("hotdog"),
  Utils.getAssetPNGPath("chicken_hip"),
  Utils.getAssetPNGPath("croissant"),
  Utils.getAssetPNGPath("fish"),
  Utils.getAssetPNGPath("pasta"),
  Utils.getAssetPNGPath("rice"),
  Utils.getAssetPNGPath("sandwich_chi"),
  Utils.getAssetPNGPath("sandwich"),
  Utils.getAssetPNGPath("sausage"),
  Utils.getAssetPNGPath("shrimp"),
  Utils.getAssetPNGPath("vegetable"),
];

final List<CategoryDTO> categoryFoods = [
  ...List.generate(nameFoods.length, (index) {
    return CategoryDTO(content: nameFoods[index], imageUrl: imagesFood[index]);
  })
];
