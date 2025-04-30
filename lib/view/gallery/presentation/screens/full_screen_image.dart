
import 'dart:io';
import 'package:flutter/material.dart';


class FullScreenImage extends StatelessWidget {
  final File imageFile;

  const FullScreenImage({super.key, required this.imageFile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black),
      body: Center(
        child: Image.file(imageFile, fit: BoxFit.contain),
      ),
    );
  }
}