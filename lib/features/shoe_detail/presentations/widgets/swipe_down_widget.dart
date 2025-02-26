import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sneakerhub/core/themes/app_colors.dart';
import 'package:sneakerhub/core/themes/app_fonts.dart';
import 'package:sneakerhub/core/themes/app_values.dart';

class SwipeDownWidget extends StatelessWidget {
  const SwipeDownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Swipe down to add',
          style: TextStyle(
            fontFamily: AppFonts.workSans,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        SizedBox(height: AppValues.p_8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: AppValues.p_12, vertical: AppValues.p_16),
          decoration: BoxDecoration(
            color: AppColors.black,
            borderRadius: BorderRadius.circular(AppValues.p_22),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                'assets/svgs/ic_cart.svg',
                fit: BoxFit.none,
                colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                width: AppValues.p_20,
              ),
              SizedBox(height: AppValues.p_8),
              Shimmer.fromColors(
                baseColor: Colors.black,
                highlightColor: Colors.white,
                direction: ShimmerDirection.ttb,
                period: Duration(milliseconds: 1800),
                child: SvgPicture.asset(
                  'assets/svgs/ic_swipe_arrow.svg',
                  fit: BoxFit.none,
                  colorFilter: ColorFilter.mode(AppColors.grey, BlendMode.srcIn),
                  width: AppValues.p_20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
