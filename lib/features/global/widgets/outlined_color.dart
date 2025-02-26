import 'package:flutter/material.dart';
import 'package:sneakerhub/core/themes/app_colors.dart';
import 'package:sneakerhub/core/themes/app_values.dart';

class OutlinedColor extends StatelessWidget {
  const OutlinedColor({
    super.key,
    this.color = AppColors.black,
    this.isAcive = false,
  });

  final Color color;
  final bool isAcive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppValues.p_36,
      height: AppValues.p_34,
      decoration: BoxDecoration(
          border: Border.all(
            color: isAcive ? AppColors.black : AppColors.grey,
          ),
          borderRadius: BorderRadius.circular(AppValues.p_8)),
      child: Center(
        child: SizedBox(
          width: AppValues.p_18,
          height: AppValues.p_18,
          child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(AppValues.p_2),
            ),
          ),
        ),
      ),
    );
  }
}
