import 'package:google_ml_kit/google_ml_kit.dart';

class RecognizedText {
  String? block;
  List<TextLine>? lines;
  String? text;

  RecognizedText({required this.lines, this.block, this.text});
}
