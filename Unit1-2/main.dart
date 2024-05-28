import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_testing/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer([255, 26, 2, 80], [255, 45, 7, 99]), 
      ),
    ),
  );
}
