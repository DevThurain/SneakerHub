import 'package:flutter/material.dart';

class StaticShoeWidget extends StatelessWidget {
  const StaticShoeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/pngs/ic_shoe.png',
      width: 450,
    );
  }
}
