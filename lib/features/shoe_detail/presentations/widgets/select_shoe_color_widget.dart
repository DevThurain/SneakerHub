import 'package:flutter/material.dart';
import 'package:sneakerhub/core/themes/app_colors.dart';
import 'package:sneakerhub/core/themes/app_fonts.dart';
import 'package:sneakerhub/core/themes/app_values.dart';
import 'package:sneakerhub/features/global/widgets/outlined_color.dart';
import 'package:sneakerhub/features/global/widgets/outlined_icon.dart';

class SelectShoeColorWidget extends StatelessWidget {
  const SelectShoeColorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: AppValues.p_16),
        OutlinedIcon(
          svgPath: 'assets/svgs/ic_bookmark.svg',
          onTap: () {},
        ),
        SizedBox(height: 200),
        Text(
          'Colour',
          style: TextStyle(
            fontFamily: AppFonts.workSans,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        SizedBox(height: AppValues.p_16),
        OutlinedColor(color: AppColors.red, isAcive: true),
        SizedBox(height: AppValues.p_16),
        OutlinedColor(color: AppColors.black, isAcive: false),
      ],
    );
  }
}
