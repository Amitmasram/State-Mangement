import 'package:image_picker/image_picker.dart';

class ImagePickerUtils {
  final ImagePicker _imagePicker = ImagePicker();

  Future<XFile?> pickImage() async {
    XFile? image = await _imagePicker.pickImage(source: ImageSource.camera);
    return image;
  }

  Future<XFile?> pickGallery() async {
    XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);
    return image;
  }
}
