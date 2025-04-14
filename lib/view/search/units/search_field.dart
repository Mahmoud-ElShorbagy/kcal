import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kcal/core/helpers/app_colors.dart';
import 'package:kcal/core/helpers/utils.dart';
import 'package:kcal/view/search/cubit.dart';
import 'package:kcal/widgets/custom_text_form.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.cubit,
  });

  final SearchCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomTextForm(
          fontWeight: FontWeight.w600,
          suffix: cubit.myController.text.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    cubit.myController.clear();
                  },
                  icon: Icon(size: 20.sp, Icons.clear))
              : null,
          controller: cubit.myController,
          onChanged: (v) {
            cubit.filterSearch(v);
          },
          fillColor: AppColors.accentGrayLight50,
          image: Utils.getAssetPNGPath("search"),
          hintText: "Search food and recipes"),
    );
  }
}
