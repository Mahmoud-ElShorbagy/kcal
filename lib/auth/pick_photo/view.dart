import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kcal/auth/pick_photo/cubit.dart';
import 'package:kcal/core/helpers/app_colors.dart';
import 'package:kcal/core/route_utils/route_names.dart';
import 'package:kcal/view/navigate_to_page/view.dart';
import 'package:kcal/widgets/app/app_snack_bar.dart';
import 'package:kcal/widgets/change_upload_image.dart';
import 'package:kcal/widgets/custom_auth_header.dart';
import 'package:kcal/widgets/custom_button.dart';
import 'package:kcal/widgets/custom_image.dart';

import '../../core/helpers/utils.dart';

class PickPhotoView extends StatelessWidget {
  const PickPhotoView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImagePickerCubit(),
      child: BlocConsumer<ImagePickerCubit, ImagePickerState>(
        listener: (context, state) {
          if (state is ImagePickerSuccess) {
            Navigator.pushNamed(context, RouteNames.getStarted);
          } else if (state is ImagePickerError) {
            appSnackBar(context, state.errorMessage, AppColors.red);
          }
        },
        builder: (context, state) {
          final cubit = context.read<ImagePickerCubit>();
          return Scaffold(
            body: ListView(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              children: [
                const CustomAuthHeader(
                    text: "Upload Photo",
                    title: "Add a profile photo so that your",
                    subTitle: "friends would know its you.             ",
                    pageNumber: "2/4"),
                SizedBox(height: 50.h),
                CustomImageWidget(
                    image: Utils.getAssetSVGPath("Illustrations"),
                    width: 260.w,
                    height: 220.h),
                SizedBox(height: 8.h),
                NavigateToPage.navigate(context, () {
                  Navigator.pushNamed(context, RouteNames.getStarted);
                }, const EdgeInsets.only(), "Skip", Alignment.topCenter),
                SizedBox(height: 22.h),
                Center(
                  child: CustomButton(
                    text: "Upload Photo",
                    onTap: () async {
                      changeUplaodImage(context, () async {
                        await cubit.pickImage(ImageSource.camera);
                      }, () async {
                        await cubit.pickImage(ImageSource.gallery);
                      });
                    },
                  ),
                ),
                NavigateToPage.navigateToPage(context, () {
                  Navigator.pushNamed(context, RouteNames.login);
                }, "Already Have An Acount? ", "Log In"),
              ],
            ),
          );
        },
      ),
    );
  }
}
