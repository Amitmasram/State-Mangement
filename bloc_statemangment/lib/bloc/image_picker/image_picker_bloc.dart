import 'package:bloc/bloc.dart';
import 'package:bloc_statemangment/utils/image_picker_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'image_picker_event.dart';
part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtils imagePickerUtils;

  ImagePickerBloc(this.imagePickerUtils) : super(const ImagePickerState()) {
    on<CameraCapture>(_cameraCapture);
    on<GalleryCapture>(_galleryCapture);
  }

  void _cameraCapture(
      CameraCapture event, Emitter<ImagePickerState> emit) async {
    final image = await imagePickerUtils.pickImage();
    emit(state.copyWith(file: image));
  }

  void _galleryCapture(
      GalleryCapture event, Emitter<ImagePickerState> emit) async {
    final image = await imagePickerUtils.pickGallery();
    emit(state.copyWith(file: image));
  }
}
