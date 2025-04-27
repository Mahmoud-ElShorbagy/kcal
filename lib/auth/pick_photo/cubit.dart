import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kcal/core/helpers/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'state.dart';

class ImagePickerCubit extends Cubit<ImagePickerState> {
  ImagePickerCubit() : super(ImagePickerInitial()) {
    loadImage();
  }
  Future<String?> getUserEmail() async {
    final user = FirebaseAuth.instance.currentUser;
    return user?.email;
  }

  Future<void> loadImage() async {
    try {
      final email = await getUserEmail();
      if (email == null) {
        emit(const ImagePickerError(errorMessage: 'User not logged in'));
        return;
      }
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? imagePath = prefs.getString("image_path$email");
      if (imagePath != null && File(imagePath).existsSync()) {
        Utils.imagePath = File(imagePath);
        emit(const ImagePickerSave());
      }
    } catch (e) {
      emit(ImagePickerError(errorMessage: e.toString()));
    }
  }

  Future<void> saveImage() async {
    final email = await getUserEmail();
    if (email == null) {
      emit(const ImagePickerError(errorMessage: 'User not logged in'));
      return;
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("image_path$email", Utils.imagePath!.path);
  }

  Future<void> pickImage(ImageSource source) async {
    try {
      final email = await getUserEmail();
      if (email == null) {
        emit(const ImagePickerError(errorMessage: 'User not logged in'));
        return;
      }
      final picker = ImagePicker();
      final XFile? pickedImage =
          await picker.pickImage(imageQuality: 85, source: source);
      if (pickedImage != null) {
        Utils.imagePath = File(pickedImage.path);
        await saveImage();
        emit(ImagePickerSuccess(imageFile: Utils.imagePath!));
      }
    } catch (e) {
      emit(ImagePickerError(errorMessage: e.toString()));
    }
  }
}
