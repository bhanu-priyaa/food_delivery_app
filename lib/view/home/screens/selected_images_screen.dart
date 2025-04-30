import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class SelectedImagesScreen extends StatelessWidget {
  final List<XFile> images;

  const SelectedImagesScreen({Key? key, required this.images})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Selected Images')),
      body: ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.file(File(images[index].path)),
            title: Text(images[index].name),
          );
        },
      ),
    );
  }
}
