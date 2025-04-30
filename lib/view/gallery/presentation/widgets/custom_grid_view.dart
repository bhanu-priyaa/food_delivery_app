import 'dart:io';
import 'package:flutter/material.dart';
import 'package:food_delivery/view/gallery/data/models/image_list.dart';
import 'package:food_delivery/view/gallery/presentation/controller/portfolio_controller.dart';
import 'package:food_delivery/view/gallery/presentation/screens/video_thumbnail.dart';
import 'package:provider/provider.dart';



class ImageGridView extends StatelessWidget {
  ImageGridView({super.key});
  final PortfolioController controller = PortfolioController();

  @override
  Widget build(BuildContext context) {
    return Consumer<ImageModel>(
      builder: (context, imageModel, child) {
        return GridView.builder(
          padding: EdgeInsets.all(8),
          itemCount: imageModel.imageList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            File file = imageModel.imageList[index];
            String filePath = file.path;
            bool isVideo =
                filePath.endsWith(".mp4") ||
                filePath.endsWith(".mov") ||
                filePath.endsWith(".avi");

            return GestureDetector(
              onTap: () {
                if (isVideo) {
                  controller.openVideoPlayer(context, file);
                } else {
                  controller.openFullScreenImage(context, file);
                }
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child:
                    isVideo
                        ? VideoThumbnail(file: file)
                        : Image.file(
                          file,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
              ),
            );
          },
        );
      },
    );
  }
}
