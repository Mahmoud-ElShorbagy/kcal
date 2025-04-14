part of 'cubit.dart';

sealed class ImagePickerState extends Equatable {
  const ImagePickerState();

  @override
  List<Object> get props => [];
}

final class ImagePickerInitial extends ImagePickerState {}

class ImagePickerLoading extends ImagePickerState {}

final class ImagePickerSuccess extends ImagePickerState {
  const ImagePickerSuccess();
}

final class ImagePickerSave extends ImagePickerState {
  const ImagePickerSave();
}

final class ImagePickerError extends ImagePickerState {
  final String errorMessage;
  const ImagePickerError({required this.errorMessage});
}
