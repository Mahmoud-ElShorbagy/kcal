import 'package:kcal/core/helpers/utils.dart';
import 'package:kcal/models/categorey_dto.dart';

final List<String> titleDetails = [
  "Red Chili",
  "Cheese",
  "Meat",
  "Red Onion",
  "Lettuce",
  "Tomatoes"
];
final List<String> contentDetails = [
  "3 pieces",
  "250gm",
  "200gm",
  "2 pieces",
  "2 pieces",
  "2 pieces"
];
final List<String> image = [
  Utils.getAssetPNGPath("red_chili"),
  Utils.getAssetPNGPath("cheese"),
  Utils.getAssetPNGPath("meet"),
  Utils.getAssetjpgPath("onion"),
  Utils.getAssetjpgPath("lettuce"),
  Utils.getAssetjpgPath("tomato"),
];
final List<CategoryDTO> categoreyDetails = [
  ...List.generate(titleDetails.length, (index) {
    return CategoryDTO(
        titleButton: titleDetails[index],
        content: contentDetails[index],
        imageUrl: image[index]);
  })
];
