import 'dart:io';

import 'package:flutter/material.dart';

class DisplayImage extends StatelessWidget {
  final File file;
  const DisplayImage(this.file, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Image.file(
        file,
        width: 400,
        height: 380,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
