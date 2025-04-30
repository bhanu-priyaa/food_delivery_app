
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/services/camera_action_button.dart';
import 'package:food_delivery/utils/services/gallery_action_button.dart';
import 'package:food_delivery/view/gallery/data/models/image_list.dart';
import 'package:provider/provider.dart';



class BottomSheetController {
  final CameraService _cameraService = CameraService();
  final GalleryService _galleryService = GalleryService();

  Future<void> handleCameraTap(BuildContext context) async {
    final image = await _cameraService.openCamera(context);
    if (image != null) {
      print("Image captured: ${image.path}");
      Provider.of<ImageModel>(context, listen: false).addImage(File(image.path));
      Navigator.pop(context);
    }
  }

  Future<void> handleGalleryTap(BuildContext context) async {
    final image = await _galleryService.openGallery();
    if (image != null) {
      print("Image selected: ${image.path}");
      Provider.of<ImageModel>(context, listen: false).addImage(File(image.path));
      Navigator.pop(context);
    }
  }
}
