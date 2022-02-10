// ignore_for_file: public_member_api_docs

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import 'package:imagetobarcode/providers/text_provider.dart';
import 'package:barcode_widget/barcode_widget.dart';

class BarcodeView extends StatelessWidget {
  final TextViewModel? textProvider;
  const BarcodeView(this.textProvider, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: PdfPreview(
          build: (format) => _generatePdf(format),
        ),
      ),
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);

    String text = '';
    for (var item in textProvider!.processedTexts!) {
      text = text + '\n' + item.text.toString();
    }

    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.Padding(
              padding: const pw.EdgeInsets.all(15.0),
              child: pw.Column(
                children: [
                  pw.SizedBox(height: 20),
                  pw.BarcodeWidget(
                      data: text,
                      barcode: Barcode.code128(),
                      width: 350,
                      height: 210,
                      drawText: false
                      // backgroundColor: Colors.white,
                      ),
                ],
              ));
        },
      ),
    );

    return pdf.save();
  }
}
