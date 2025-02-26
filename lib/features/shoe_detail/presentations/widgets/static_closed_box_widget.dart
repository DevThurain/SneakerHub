import 'package:flutter/material.dart';

class StaticClosedBoxWidget extends StatelessWidget {
  const StaticClosedBoxWidget({super.key, this.width = 100.00});
  final double width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/pngs/ic_box_close.png',
      width: width,
    );
  }
}
