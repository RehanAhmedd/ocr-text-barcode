import 'package:flutter/material.dart';
import 'package:imagetobarcode/providers/provider_setup.dart';
import 'package:imagetobarcode/view/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Image to barcode',
          theme: ThemeData(
            primarySwatch: Colors.blueGrey,
          ),
          // theme: ThemeData.dark(),
          darkTheme: ThemeData(
            primarySwatch: Colors.blueGrey,
          ),
          home: const HomePage()),
    );
  }
}
