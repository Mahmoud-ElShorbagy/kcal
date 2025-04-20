part of 'cubit.dart';

sealed class ImagePickerState {
  const ImagePickerState();
}

final class ImagePickerInitial extends ImagePickerState {}

class ImagePickerLoading extends ImagePickerState {}

final class ImagePickerSuccess extends ImagePickerState {
  final File imageFile;
  const ImagePickerSuccess({required this.imageFile});
}

final class ImagePickerSave extends ImagePickerState {
  const ImagePickerSave();
}

final class ImagePickerError extends ImagePickerState {
  final String errorMessage;
  const ImagePickerError({required this.errorMessage});
}
