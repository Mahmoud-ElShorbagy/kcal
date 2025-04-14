import 'package:kcal/core/helpers/utils.dart';
import 'package:kcal/models/categorey_dto.dart';

final List<String> contentProduct = [
  "Food Spinners",
  "Orange orangers",
  "Food Spinners",
  "Orange orangers"
];
final List<String> textProduct = [
  "Best spinner recipe.",
  "Do you like orange?",
  "Best spinner recipe.",
  "Do you like orange?"
];
final List<String> imageProduct = [
  for (int i = 0; i < contentProduct.length; i++)
    Utils.getAssetPNGPath("spinners"),
];
final List<CategoryDTO> categoryProduct = [
  ...List.generate(contentProduct.length, (index) {
    return CategoryDTO(
        content: contentProduct[index],
        imageUrl: imageProduct[index],
        titleButton: textProduct[index]);
  })
];
