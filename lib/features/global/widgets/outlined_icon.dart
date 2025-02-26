import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sneakerhub/core/themes/app_colors.dart';
import 'package:sneakerhub/core/themes/app_fonts.dart';
import 'package:sneakerhub/core/themes/app_values.dart';

class OutlinedIcon extends StatelessWidget {
  const OutlinedIcon({
    super.key,
    required this.svgPath,
    this.badge = '',
    required this.onTap,
    this.customSize = AppValues.p_24,
  });

  final String svgPath;
  final String badge;
  final VoidCallback onTap;
  final double customSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: AppValues.p_36,
            height: AppValues.p_34,
            decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.grey,
                ),
                borderRadius: BorderRadius.circular(AppValues.p_8)),
            child: SizedBox(
              width: customSize,
              height: customSize,
              child: SvgPicture.asset(
                svgPath,
                fit: BoxFit.none,
              ),
            ),
          ),
          badge != ''
              ? Positioned(
                  top: -(AppValues.badge_size / 3.5),
                  left: -(AppValues.badge_size / 3.5),
                  child: Container(
                    width: AppValues.badge_size,
                    height: AppValues.badge_size,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.black,
                    ),
                    child: Center(
                      child: Text(
                        '2',
                        style: TextStyle(
                          fontFamily: AppFonts.workSans,
                          fontSize: 8.0,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
