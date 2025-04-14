import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kcal/auth/pick_photo/cubit.dart';
import 'package:kcal/core/helpers/utils.dart';
import 'package:kcal/view/image_user/view.dart';
import 'package:kcal/widgets/change_upload_image.dart';

import '../../core/helpers/app_colors.dart';
import '../../core/route_utils/route_names.dart';
import '../../widgets/custom_auth_header.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImagePickerCubit(),
      child: BlocBuilder<ImagePickerCubit, ImagePickerState>(
        builder: (context, state) {
          if (state is ImagePickerSuccess) {
            Navigator.pop(context);
          }
          final cubit = ImagePickerCubit.get(context);
          return Scaffold(
            body: ListView(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              children: [
                const CustomAuthHeader(
                    text: "Photo Addedd Photo",
                    title: "Now you friends will definitely add",
                    subTitle: "you if they found you.          ",
                    pageNumber: "3/4"),
                SizedBox(
                  height: 50.h,
                ),
                ImageUserView(
                  imagePath: Utils.imagePath,
                ),
                SizedBox(height: 16.h),
                Container(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () async {
                      changeUplaodImage(context, () async {
                        cubit.pickImage(ImageSource.camera);
                      }, () async {
                        cubit.pickImage(ImageSource.gallery);
                      });
                    },
                    child: CustomText(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: "WorkSans",
                      textSpan: "Upload Again",
                    ),
                  ),
                ),
                SizedBox(height: 70.h),
                Center(
                    child: CustomButton(
                        text: "Get Started",
                        onTap: () {
                          Navigator.pushNamed(context, RouteNames.confirmTerms);
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
