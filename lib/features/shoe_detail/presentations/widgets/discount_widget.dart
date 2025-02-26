import 'package:flutter/material.dart';
import 'package:sneakerhub/core/themes/app_colors.dart';
import 'package:sneakerhub/core/themes/app_fonts.dart';

class DiscountWidget extends StatelessWidget {
  const DiscountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: [
              TextSpan(
                text: '\$',
                style: TextStyle(
                  fontFamily: AppFonts.workSans,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  textBaseline: TextBaseline.alphabetic,
                ),
              ),
              TextSpan(
                text: '30.99',
                style: TextStyle(
                  fontFamily: AppFonts.workSans,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  textBaseline: TextBaseline.alphabetic, // Aligns baseline
                ),
              ),
            ],
          ),
        ),
        Text(
          '10% OFF',
          style: TextStyle(
            fontFamily: AppFonts.workSans,
            fontSize: 14,
            color: AppColors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
