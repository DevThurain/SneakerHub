import 'package:flutter/material.dart';
import 'package:sneakerhub/core/themes/app_fonts.dart';
import 'package:sneakerhub/core/themes/app_values.dart';
import 'package:sneakerhub/features/global/widgets/outlined_text.dart';

class SelectShoeSizeWidget extends StatelessWidget {
  const SelectShoeSizeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Size',
          style: TextStyle(
            fontFamily: AppFonts.workSans,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        SizedBox(height: AppValues.p_16),
        OutlinedText(isActive: false, text: 'UK 6'),
        SizedBox(height: AppValues.p_16),
        OutlinedText(isActive: true, text: 'UK 7'),
        SizedBox(height: AppValues.p_16),
        OutlinedText(isActive: false, text: 'UK 8'),
        SizedBox(height: AppValues.p_16),
        OutlinedText(isActive: false, text: 'UK 9'),
      ],
    );
  }
}
