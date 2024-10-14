import 'package:flutter/material.dart';
import 'package:picker_file/splash_screen.dart';

void main() {
  runApp(const PickerFile());
}

class PickerFile extends StatelessWidget {
  const PickerFile({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}
