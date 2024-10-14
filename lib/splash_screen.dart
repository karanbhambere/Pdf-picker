import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  File? myFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.file_open),
          onPressed: () async {
            FilePickerResult? result =
                await FilePicker.platform.pickFiles(allowMultiple: false);
            if (result != null) {
              List<File> files =
                  result.paths.map((path) => File(path!)).toList();
              setState(() {
                myFile = files.first;
              });
            }
          }),
      backgroundColor: const Color.fromARGB(255, 235, 227, 227),
      body: Column(
        children: [
          if (myFile != null) ...[
            Expanded(
              child: SfPdfViewer.file(File(
                myFile!.path,
              )),
            ),
          ],
        ],
      ),
    );
  }
}
