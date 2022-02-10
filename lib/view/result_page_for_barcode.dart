import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:imagetobarcode/providers/base_model.dart';
import 'package:imagetobarcode/providers/text_provider.dart';

import 'custom_widgets.dart/barcode_view.dart';

class ResultPageForBarcode extends StatelessWidget {
  const ResultPageForBarcode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barcode'),
        centerTitle: true,
      ),
      body: Consumer<TextViewModel>(
        builder: (_, textProvider, __) =>
            (textProvider.state == CurrentState.idle)
                ? const Center(
                    child: Text('Nothing here 😴'),
                  )
                : (textProvider.state == CurrentState.error)
                    ? const Center(
                        child: Text('NO IMAGE TO ANALYZE'),
                      )
                    : (textProvider.state == CurrentState.loading)
                        ? const Center(child: CircularProgressIndicator())
                        : Center(child: BarcodeView(textProvider)),
      ),
    );
  }
}
