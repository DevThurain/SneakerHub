import 'package:flutter/material.dart';

class StaticBoxWidget extends StatelessWidget {
  const StaticBoxWidget({super.key, this.width = 100.00});
  final double width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/pngs/ic_box.png',
      width: width,
    );
  }
}
