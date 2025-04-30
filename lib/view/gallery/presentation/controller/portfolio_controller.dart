// lib/features/portfolio/application/controllers/portfolio_controller.dart


import 'dart:io';
import 'package:flutter/material.dart';
import '../../presentation/screens/full_screen_image.dart';
import '../../presentation/screens/video_player_screen.dart';

class PortfolioController {
  void openFullScreenImage(BuildContext context, File imageFile) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullScreenImage(imageFile: imageFile),
      ),
    );
  }

  void openVideoPlayer(BuildContext context, File videoFile) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoPlayerScreen(videoFile: videoFile),
      ),
    );
  }
}
