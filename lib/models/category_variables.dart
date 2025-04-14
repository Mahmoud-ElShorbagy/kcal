import 'package:kcal/core/helpers/utils.dart';
import 'package:kcal/models/categorey_dto.dart';

final List<String> content = [
  """ Chicken Burger 
 With Nuggets""",
  """ Pasta With
  Red Sauce""",
  """ Fruits With 
  Coco Nuts""",
];
final List<String> titleButton = [
  for (int i = 0; i < content.length; i++) "View Recipe"
];
final List<String> image = [
  Utils.getAssetSVGPath("burger_nagets"),
  Utils.getAssetSVGPath("pasta"),
  Utils.getAssetSVGPath("fruits"),
];
final List<CategoryDTO> category = [
  ...List.generate(content.length, (index) {
    return CategoryDTO(
        content: content[index],
        imageUrl: image[index],
        titleButton: titleButton[index]);
  })
];
