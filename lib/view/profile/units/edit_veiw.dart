import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kcal/auth/pick_photo/cubit.dart';
import 'package:kcal/auth/register/cubit.dart';
import 'package:kcal/core/helpers/app_colors.dart';
import 'package:kcal/core/helpers/utils.dart';
import 'package:kcal/core/helpers/validators.dart';
import 'package:kcal/core/route_utils/route_names.dart';
import 'package:kcal/view/image_user/view.dart';
import 'package:kcal/view/navigate_to_page/view.dart';
import 'package:kcal/widgets/alerting_loading.dart';
import 'package:kcal/widgets/app/app_snack_bar.dart';
import 'package:kcal/widgets/change_upload_image.dart';
import 'package:kcal/widgets/custom_app_bar.dart';
import 'package:kcal/widgets/custom_button.dart';
import 'package:kcal/widgets/custom_text_form.dart';
import 'package:kcal/widgets/title_text_field.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  Future<bool> _checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      return false;
    } on SocketException catch (_) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    bool absorbing = false;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (context) => ImagePickerCubit(),
        ),
      ],
      child: BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) {
          final registerCubit = RegisterCubit.get(context);
          return BlocBuilder<ImagePickerCubit, ImagePickerState>(
            builder: (context, state) {
              final imagePickerCubit = context.read<ImagePickerCubit>();
              return Scaffold(
                body: AbsorbPointer(
                  absorbing: absorbing,
                  child: SafeArea(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 16.h,
                        ),
                        CustomAppBar(
                          title: "Edit Profile",
                          tapBack: () => Navigator.pop(context),
                        ),
                        Expanded(
                            child: ListView(
                          padding: EdgeInsets.symmetric(horizontal: 25.w),
                          children: [
                            SizedBox(
                              height: 48.h,
                            ),
                            ImageUserView(
                              imagePath: Utils.imagePath,
                            ),
                            NavigateToPage.navigate(context, () {
                              changeUplaodImage(context, () async {
                                imagePickerCubit.pickImage(ImageSource.camera);
                              }, () async {
                                imagePickerCubit.pickImage(ImageSource.gallery);
                              });
                            }, EdgeInsets.only(top: 16.h), "Edit Photo",
                                Alignment.center),
                            SizedBox(height: 24.h),
                            const TitleTextField(
                              text: "Edit Name",
                            ),
                            Container(
                                margin: EdgeInsets.only(
                                  top: 8.h,
                                ),
                                child: Form(
                                  autovalidateMode: AutovalidateMode.always,
                                  key: registerCubit.formKey,
                                  child: CustomTextForm(
                                    onChanged: (v) {
                                      registerCubit.updateValidateName(v);
                                    },
                                    validator: (v) =>
                                        Validators.validateName(v!),
                                    fontWeight: FontWeight.w400,
                                    hintText: "User Name",
                                    image: Utils.getAssetPNGPath("user"),
                                  ),
                                )),
                            SizedBox(
                              height: 145.h,
                            ),
                            CustomButton(
                              color:
                                  registerCubit.nameController.text.length >= 2
                                      ? AppColors.primary
                                      : AppColors.subTitle100,
                              text: "Save",
                              onTap: () async {
                                if (registerCubit.formKey.currentState!
                                    .validate()) {
                                  absorbing = true;
                                  bool hasConnection =
                                      await _checkInternetConnection();
                                  if (!hasConnection) {
                                    appSnackBar(
                                      context,
                                      "No internet connection",
                                      AppColors.red,
                                    );
                                    absorbing = false;
                                    return;
                                  }
                                  try {
                                    registerCubit.auth.currentUser!
                                        .updateDisplayName(
                                            registerCubit.nameController.text);

                                    AlertingLoading.showLoading(context);
                                    await Future.delayed(
                                        const Duration(seconds: 3));
                                    appSnackBar(context, "Edit successfully",
                                        AppColors.primaryBaseGreen);
                                    Navigator.pushNamed(context,
                                        RouteNames.appBottomNavigationBar);
                                  } catch (e) {
                                    absorbing = false;

                                    appSnackBar(
                                        context,
                                        "Error occurred: ${e.toString()}",
                                        AppColors.red);
                                  }
                                }
                              },
                            ),
                          ],
                        )),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
