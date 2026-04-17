import 'package:dotlottie_flutter/dotlottie_flutter.dart';
import 'package:dotlottie_flutter_viewer/network_samples.dart';
import 'package:flutter/material.dart';

class NetworkSamplePage extends StatefulWidget {
  const NetworkSamplePage({super.key});

  @override
  State<NetworkSamplePage> createState() => _NetworkSamplePageState();
}

class _NetworkSamplePageState extends State<NetworkSamplePage> {
  final List<String> netWorkUrls = [
    SampleUrls.netWorkSampleLottieOne,
    SampleUrls.networkSampleJsonOne,
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Network Url Samples")),
        body: ListView.builder(
          itemCount: netWorkUrls.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 2.5, horizontal: 8),
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: BoxBorder.all(width: 2),
              ),
              height: MediaQuery.of(context).size.width * 0.8,
              width: MediaQuery.of(context).size.width * 0.8,
              child: DotLottieView(
                autoplay: true,
                loop: true,
                sourceType: 'url',
                source: netWorkUrls[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
