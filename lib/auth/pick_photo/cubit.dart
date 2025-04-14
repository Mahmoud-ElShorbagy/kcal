import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kcal/core/helpers/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'state.dart';

class ImagePickerCubit extends Cubit<ImagePickerState> {
  final ImagePicker imagePicker = ImagePicker();
  ImagePickerCubit() : super(ImagePickerInitial()) {
    loadImage();
  }
  static ImagePickerCubit get(context) => BlocProvider.of(context);
  Future<void> loadImage() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? imagePath = prefs.getString("image_path");
      if (imagePath != null) {
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
        saveImage();
        emit(const ImagePickerSuccess());
      }
    } catch (e) {
      emit(ImagePickerError(errorMessage: e.toString()));
    }
  }
}
