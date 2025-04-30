part of 'image_picker_bloc.dart';

abstract class ImagePickerState extends Equatable {
  const ImagePickerState();

  @override
  List<Object> get props => [];
}

class ImagePickerInitial extends ImagePickerState {}

class ImagePickerLoading extends ImagePickerState {}

class ImagePickerLoaded extends ImagePickerState {
  final List<XFile> images;

  const ImagePickerLoaded({required this.images});

  @override
  List<Object> get props => [images];
}

class ImagePickerError extends ImagePickerState {
  final String error;

  const ImagePickerError({required this.error});

  @override
  List<Object> get props => [error];
}
