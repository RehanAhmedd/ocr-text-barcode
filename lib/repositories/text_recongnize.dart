import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:google_ml_vision/google_ml_vision.dart';
import 'package:imagetobarcode/model/data_layer.dart';

class MlService {
  Future<List<RecognizedText>> getText(File file) async {
    final TextRecognizer textRecognizer =
        GoogleVision.instance.textRecognizer();
    final GoogleVisionImage visionImage = GoogleVisionImage.fromFile(file);
    final VisionText visionText =
        await textRecognizer.processImage(visionImage);
    // final inputImage = InputImage.fromFilePath(path);
    // final textDetector = GoogleMlKit.vision.textDetector();
    // final RecognisedText recognisedText =
    //     await textDetector.processImage(inputImage);

    List<RecognizedText> recognizedList = [];

    // for (TextBlock block in recognisedText.blocks) {
    //   recognizedList.add(RecognizedText(
    //       lines: block.lines,
    //       block: block.text.toLowerCase(),
    //       text: block.text));
    // }

    for (TextBlock block in visionText.blocks) {
      for (TextLine line in block.lines) {
        // Same getters as TextBlock
        recognizedList.add(RecognizedText(text: line.text));
        // for (TextElement element in line.elements) {
        //   // Same getters as TextBlock
        // }
      }
    }
    return recognizedList;
  }
}
