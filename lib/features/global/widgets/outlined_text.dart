import 'package:flutter/material.dart';
import 'package:sneakerhub/core/themes/app_colors.dart';
import 'package:sneakerhub/core/themes/app_fonts.dart';
import 'package:sneakerhub/core/themes/app_values.dart';

class OutlinedText extends StatelessWidget {
  const OutlinedText({super.key, required this.isActive, required this.text});
  final bool isActive;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppValues.p_54,
      height: AppValues.p_36,
      decoration: BoxDecoration(
          border: Border.all(
            color: isActive ? AppColors.black : AppColors.grey,
          ),
          borderRadius: BorderRadius.circular(AppValues.p_8)),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontFamily: AppFonts.workSans,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
