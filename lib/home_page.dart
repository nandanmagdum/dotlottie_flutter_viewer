import 'dart:convert';
import 'package:dotlottie_flutter/dotlottie_flutter.dart';
import 'package:dotlottie_flutter_viewer/local_sample_page.dart';
import 'package:dotlottie_flutter_viewer/network_sample_page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _animationSource;
  String? _sourceType;
  String? _errorMessage;

  Future<void> _handleFilePicking() async {
    try {
      FilePickerResult? result = await FilePicker.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['json', 'lottie'],
        withData: true,
      );

      if (result != null) {
        final file = result.files.first;

        setState(() {
          if (file.extension == 'json') {
            _animationSource = utf8.decode(file.bytes!);
            _sourceType = 'json';
          } else {
            _animationSource = file.path;
            _sourceType = 'asset';
          }
          _errorMessage = null;
        });
      }
    } catch (e) {
      setState(() => _errorMessage = "Error picking file: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("dotlottie_flutter tester"),
          centerTitle: true,
        ),
        drawer: _buildDrawer(context),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: _buildAnimationPlayer(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _handleFilePicking,
                icon: const Icon(Icons.upload_file),
                label: const Text("Select JSON or .lottie"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimationPlayer() {
    if (_errorMessage != null) {
      return Center(
        child: Text(_errorMessage!, style: const TextStyle(color: Colors.red)),
      );
    }

    if (_animationSource == null) {
      return const Center(child: Text("Select a file to preview"));
    }

    return DotLottieView(
      key: ValueKey(_animationSource),
      source: _animationSource!,
      sourceType: _sourceType == 'json' ? 'json' : 'asset',
      autoplay: true,
      loop: true,
      onViewCreated: (controller) {
        debugPrint("Animation loaded successfully!");
      },
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(child: Text("dotlottie_flutter")),
          ListTile(
            title: const Text("URL Samples"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const NetworkSamplePage()),
            ),
          ),
          ListTile(
            title: const Text("Local Samples"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const LocalSamplePage()),
            ),
          ),
        ],
      ),
    );
  }
}
