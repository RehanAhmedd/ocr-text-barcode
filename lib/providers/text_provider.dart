// ignore_for_file: unnecessary_getters_setters

import 'package:imagetobarcode/model/data_layer.dart';
import 'package:imagetobarcode/providers/base_model.dart';
import 'package:imagetobarcode/providers/image_provider.dart';
import 'package:imagetobarcode/repositories/text_recongnize.dart';

class TextViewModel extends BaseModel {
  late ImageViewModel _imageProvider;

  List<RecognizedText>? _processedTexts;

  List<RecognizedText>? get processedTexts => _processedTexts;
  ImageViewModel get imageProvider => _imageProvider;

  set imageProvider(ImageViewModel imageProvider) {
    _imageProvider = imageProvider;
    // emptyList();
  }

  void getText() async {
    setState(CurrentState.loading);
    try {
      final _mlSerive = MlService();
      final ImageModel _image = _imageProvider.image;
      // final String _imagePath = _image.imagePath!;
      _processedTexts = await _mlSerive.getText(_image.imagePath);
      setState(CurrentState.loaded);
    } catch (e) {
      setState(CurrentState.error);
    }
  }

  void emptyList() {
    _processedTexts = [];
  }
}
