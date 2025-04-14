import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kcal/auth/pick_photo/cubit.dart';
import 'package:kcal/core/route_utils/route_names.dart';
import 'package:kcal/widgets/change_upload_image.dart';
import 'package:kcal/widgets/custom_auth_header.dart';
import 'package:kcal/widgets/custom_button.dart';
import 'package:kcal/widgets/custom_image.dart';
import 'package:kcal/widgets/custom_text.dart';

import '../../core/helpers/app_colors.dart';
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
          }
        },
        builder: (context, state) {
          final cubit = ImagePickerCubit.get(context);
          return Scaffold(
            body: ListView(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              children: [
                const CustomAuthHeader(
                    text: "Upload Photo",
                    title: "Add a profile photo so that your",
                    subTitle: "friends would know its you.             ",
                    pageNumber: "2/4"),
                SizedBox(
                  height: 50.h,
                ),
                CustomImageWidget(
                    image: Utils.getAssetSVGPath("Illustrations"),
                    width: 260.w,
                    height: 220.h),
                SizedBox(height: 8.h),
                Container(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RouteNames.getStarted);
                    },
                    child: CustomText(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: "WorkSans",
                      textSpan: "Skip",
                    ),
                  ),
                ),
                SizedBox(height: 22.h),
                Center(
                    child: CustomButton(
                        text: "Upload Photo",
                        onTap: () async {
                          changeUplaodImage(context, () async {
                            cubit.pickImage(ImageSource.camera);
                          }, () async {
                            cubit.pickImage(ImageSource.gallery);
                          });
                        })),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 16.h),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RouteNames.login);
                    },
                    child: CustomText(
                      text: "Already Have An Acount? ",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: "WorkSans",
                      color: AppColors.secondary,
                      textSpan: "Log In",
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
