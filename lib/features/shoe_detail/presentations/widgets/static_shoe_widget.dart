import 'package:flutter/material.dart';

class StaticShoeWidget extends StatelessWidget {
  const StaticShoeWidget({super.key, this.width = 450.0});

  final double width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/pngs/ic_shoe.png',
      width: width,
    );
  }
}
