import 'package:image_picker/image_picker.dart';
import 'package:imagetobarcode/model/data_layer.dart';
import 'package:imagetobarcode/repositories/exceptions.dart';

class MediaService {
  final ImagePicker _imagePicker = ImagePicker();
  ImageModel? image;

  Future<ImageModel?> clickImageFromCamera() async {
    try {
      final _image = await _imagePicker.pickImage(source: ImageSource.camera);
      final image = ImageModel(imagePath: _image!.path);
      return image;
    } catch (e) {
      ImageNotSelectedException('Image not found');
    }
  }
}