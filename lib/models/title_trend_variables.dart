import 'package:kcal/models/categorey_dto.dart';

import '../core/helpers/utils.dart';

final List<String> titleTrend = [
  "best vegetable recipes",
  "cold season vegetables",
  "chicken recipes with eggs",
  "maggie soups"
];
final List<String> imageTrend = [
  for (int i = 0; i < titleTrend.length; i++) Utils.getAssetPNGPath("trend"),
];
final List<CategoryDTO> categoreyTrend = [
  ...List.generate(titleTrend.length, (index) {
    return CategoryDTO(content: titleTrend[index], imageUrl: imageTrend[index]);
  })
];
