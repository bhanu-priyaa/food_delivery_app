import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery/view/gallery/presentation/widgets/custom_buttom_sheet.dart';


class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key, required this.path});

  final String path;

  @override
  Widget build(BuildContext context) {
    void showBottomSheet(context) {
      showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        builder: (context) {
          return CustomBottomSheet();
        },
      );
    }

    return Container(
      height: 74,
      width: 74,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [Color(0xff072438), Color(0xff17486B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: RawMaterialButton(
        onPressed: () {
          showBottomSheet(context);
        },
        shape: CircleBorder(),
        elevation: 0,
        child: ClipOval(
          child: SvgPicture.asset(
            path,
            fit: BoxFit.cover,
            //   width: 36,
            //  height: 36,
          ),
        ),
      ),
    );
  }
}
