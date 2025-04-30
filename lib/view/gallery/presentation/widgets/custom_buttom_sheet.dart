import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery/view/gallery/presentation/controller/bottom_sheet_controller.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  final BottomSheetController _controller = BottomSheetController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 333,
      width: 428,
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Opacity(
            opacity: 0.3,
            child: Container(
              width: 68,
              height: 4,
              decoration: BoxDecoration(
                color: Color(0xff505050),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          SizedBox(height: 60),

          Text(
            "Upload Photo",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Color(0xff1D1D1D),
            ),
          ),

          SizedBox(height: 20),

          Container(
            height: 100,
            width: 224,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => _controller.handleCameraTap(context),
                  child: Container(
                    height: 84,
                    width: 84,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Color(0xff0A2B41), width: 1.5),
                    ),
                    child: Center(child: SvgPicture.asset("assets/icons/camera.svg")),
                  ),
                ),

                GestureDetector(
                  onTap: () => _controller.handleGalleryTap(context),
                  child: Container(
                    height: 84,
                    width: 84,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Color(0xff0A2B41), width: 1.5),
                    ),
                    child: Center(
                      child: SvgPicture.asset("assets/icons/gallery.svg"),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(
            height: 30,
            width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Camera",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff505050),
                  ),
                ),

                Text(
                  "Gallery",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff505050),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
