import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:imagetobarcode/providers/base_model.dart';
import 'package:imagetobarcode/providers/image_provider.dart';
import 'package:imagetobarcode/providers/text_provider.dart';
import 'package:imagetobarcode/view/custom_widgets.dart/display_image.dart';
import 'package:imagetobarcode/view/custom_widgets.dart/upload_image_button.dart';
import 'package:imagetobarcode/view/result_page_for_barcode.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('resources/customBackground.png'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('OCR Text barcode'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 25.0,
            ),
            Consumer<ImageViewModel?>(
              builder: (_, imageProvider, __) => (imageProvider?.state ==
                      CurrentState.loading)
                  ? const Center(child: CircularProgressIndicator())
                  : (imageProvider?.state == CurrentState.loaded)
                      ? Column(
                          children: [
                            imageProvider?.image?.imagePath != null
                                ? DisplayImage(imageProvider?.image?.imagePath)
                                : const Text(" "),
                            const SizedBox(
                              height: 15.0,
                            ),
                            CustomButton(
                                text: 'Get another image',
                                onTap: imageProvider?.getImage)
                          ],
                        )
                      : CustomButton(
                          text: 'Upload image', onTap: imageProvider?.getImage),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Consumer2<TextViewModel, ImageViewModel>(
              builder: (_, textProvider, imageProvider, __) => ElevatedButton(
                onPressed: (imageProvider.image == null)
                    ? null
                    : () {
                        textProvider.getText();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const ResultPageForBarcode()));
                      },
                child: const Text('Generate Barcode'),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
