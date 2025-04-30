import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:equatable/equatable.dart';

part 'image_picker_event.dart';
part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  ImagePickerBloc() : super(ImagePickerInitial()) {
    on<PickImagesEvent>(_onPickImages);
  }

  Future<void> _onPickImages(
    PickImagesEvent event,
    Emitter<ImagePickerState> emit,
  ) async {
    emit(ImagePickerLoading());
    try {
      final List<XFile> images = await _pickImages();
      emit(ImagePickerLoaded(images: images));
    } catch (e) {
      emit(ImagePickerError(error: e.toString()));
    }
  }

  Future<List<XFile>> _pickImages() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> images = await picker.pickMultiImage();
    return images;
  }
}
