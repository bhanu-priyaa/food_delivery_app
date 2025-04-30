import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class GalleryService {
  final ImagePicker _picker = ImagePicker();

  Future<File?> openGallery() async {
    final XFile? pickedFile = await _picker.pickMedia(); 
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }
}

Future<bool> requestGalleryPermission(BuildContext context) async {
  PermissionStatus? status;

  if (Platform.isAndroid) {
    int androidVersion = int.tryParse(Platform.version.split('.')[0]) ?? 0;

    if (androidVersion >= 33) {
      PermissionStatus imageStatus = await Permission.photos.request();
      PermissionStatus videoStatus = await Permission.videos.request();

      if (imageStatus.isGranted && videoStatus.isGranted) {
        return true;
      }
    } else {
      status = await Permission.storage.request();
      if (status.isGranted) return true;
    }
  } else {
    status = await Permission.photos.request();
    if (status.isGranted) return true;
  }

  if (status?.isDenied == true) {
    _showPermissionDialog(context);
  } else if (status?.isPermanentlyDenied == true) {
    openAppSettings();
  }

  return false;
}

  void _showPermissionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text("Gallery Permission"),
            content: Text("This app needs gallery access to pick images."),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Deny"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  requestGalleryPermission(context);
                },
                child: Text("Allow"),
              ),
            ],
          ),
    );
  }

