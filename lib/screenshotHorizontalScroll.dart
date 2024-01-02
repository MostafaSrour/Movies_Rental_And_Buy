import 'package:flutter/material.dart';
import 'screenshotCard.dart';

class ScreenShotHorizontalScroll extends StatelessWidget {
  ScreenShotHorizontalScroll(this.screenshots);
  final List<String> screenshots;

  @override
  Widget build(BuildContext context) {
    const double height = 272;

    return SizedBox.fromSize(
      size: const Size.fromHeight(height),
      child: ListView.builder(
          itemCount: screenshots.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: 12),
          itemBuilder: (BuildContext context, int position) {
            return ScreenShotCard(context, screenshots[position],
                height: height - 16);
          }),
    );
  }
}
