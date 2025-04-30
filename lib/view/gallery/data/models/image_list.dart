import 'dart:io';
import 'package:flutter/material.dart';

class ImageModel extends ChangeNotifier {
  final List<File> _imageList = [];

  List<File> get imageList => _imageList;

  void addImage(File image) {
    _imageList.add(image);
    notifyListeners();
  }
}
