import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraService {
  final ImagePicker _picker = ImagePicker();

  Future<bool> requestCameraPermission(BuildContext context) async {
    PermissionStatus status = await Permission.camera.request();

    if (status.isGranted) {
      return true; 
    } else if (status.isDenied) {
      _showPermissionDialog(context);
      return false;
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
      return false;
    }
    return false;
  }

  Future<XFile?> openCamera(BuildContext context) async {
    bool hasPermission = await requestCameraPermission(context);
    if (!hasPermission) return null;

    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    return image;
  }

 
  void _showPermissionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Camera Permission"),
        content: Text("This app needs camera access to take pictures."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Deny"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              requestCameraPermission(context);
            },
            child: Text("Allow"),
          ),
        ],
      ),
    );
  }
}
