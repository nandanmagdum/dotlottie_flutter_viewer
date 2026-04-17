import 'package:dotlottie_flutter_viewer/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DotlottieFlutterViewer());
}

class DotlottieFlutterViewer extends StatelessWidget {
  const DotlottieFlutterViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}
