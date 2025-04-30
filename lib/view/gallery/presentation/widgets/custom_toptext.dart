

import 'package:flutter/material.dart';

class CustomToptext extends StatelessWidget {
  const CustomToptext({super.key, required this.icon, required this.text});

  final Icon icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 27,
      width: 158,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          icon,
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xff0A2B41),
            ),
          ),
        ],
      ),
    );
  }
}