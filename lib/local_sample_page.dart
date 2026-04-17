import 'package:dotlottie_flutter/dotlottie_flutter.dart';
import 'package:flutter/material.dart';

class LocalSamplePage extends StatefulWidget {
  const LocalSamplePage({super.key});

  @override
  State<LocalSamplePage> createState() => _LocalSamplePageState();
}

class _LocalSamplePageState extends State<LocalSamplePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("json and lottie samples")),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: MediaQuery.of(context).size.width),
            Text("Json file"),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(width: 2),
              ),
              height: MediaQuery.of(context).size.width * 0.8,
              width: MediaQuery.of(context).size.width * 0.8,
              child: DotLottieView(
                sourceType: 'asset',
                source: 'apple_tv.json',
                autoplay: true,
                loop: true,
                onLoadError: () {},
              ),
            ),
            SizedBox(height: 24),
            Text(".lottie file"),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(width: 2),
              ),
              height: MediaQuery.of(context).size.width * 0.8,
              width: MediaQuery.of(context).size.width * 0.8,
              child: DotLottieView(
                sourceType: 'asset',
                source: 'apple_tv.lottie',
                autoplay: true,
                loop: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
