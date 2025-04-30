import 'package:flutter/material.dart';
import 'package:food_delivery/view/gallery/presentation/widgets/custom_floating_button.dart';
import 'package:food_delivery/view/gallery/presentation/widgets/custom_grid_view.dart';
import 'package:food_delivery/view/gallery/presentation/widgets/custom_toptext.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
          left: 20,
          right: 20,
          bottom: 20,
        ),
        child: Column(
          children: [
            SizedBox(height: 20),

            // Top text
            Align(
              alignment: Alignment.topLeft,
              child: CustomToptext(
                icon: Icon(Icons.arrow_back),
                text: "My Portfolio",
              ),
            ),

            SizedBox(height: 20),

            // GridView
            Expanded(child: ImageGridView()),
          ],
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(
        path: "assets/icons/Frame.svg",
      ),
    );
  }
}
