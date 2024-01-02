import 'package:flutter/material.dart';
import 'imgHeight.dart';

class ScreenShotCard extends StatelessWidget {
  ScreenShotCard(this.buildContext, this.screenshot, {this.height = 400});
  final BuildContext buildContext;
  final String screenshot;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 12, bottom: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageHeightItem(context, screenshot, height - 32),
        ],
      ),
    );
  }
}
