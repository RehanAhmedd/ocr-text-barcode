import 'dart:io';

import 'package:imagetobarcode/model/data_layer.dart';
import 'package:imagetobarcode/providers/base_model.dart';
import 'package:imagetobarcode/repositories/exceptions.dart';
import 'package:imagetobarcode/repositories/media_service.dart';

class ImageViewModel extends BaseModel {
  ImageModel? _image;
  File? file;
  get image => _image;

  void getImage() async {
    //Clears previous picture from memory
    if (_image != null) {
      _image = null;
    }
    setState(CurrentState.loading);
    try {
      final _mediaService = MediaService();
      _image = await _mediaService.clickImageFromCamera();
      file = _image?.imagePath;
      // notifyListeners();
      setState(CurrentState.loaded);
    } on ImageNotSelectedException {
      setState(CurrentState.error);
    } catch (e) {
      setState(CurrentState.error);
    }
  }
}
