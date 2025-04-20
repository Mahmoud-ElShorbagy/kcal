import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kcal/core/helpers/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'state.dart';

class ImagePickerCubit extends Cubit<ImagePickerState> {
  ImagePickerCubit() : super(ImagePickerInitial()) {
    loadImage();
  }
  Future<void> loadImage() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? imagePath = prefs.getString("image_path");
      if (imagePath != null && File(imagePath).existsSync()) {
        Utils.imagePath = File(imagePath);
        emit(const ImagePickerSave());
      }
    } catch (e) {
      emit(ImagePickerError(errorMessage: e.toString()));
    }
  }

  Future<void> saveImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("image_path", Utils.imagePath!.path);
  }

  Future<void> pickImage(ImageSource source) async {
    try {
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
