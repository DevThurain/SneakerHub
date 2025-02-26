import 'package:flutter/material.dart';
import 'package:sneakerhub/core/themes/app_fonts.dart';
import 'package:sneakerhub/core/themes/app_values.dart';
import 'package:sneakerhub/features/global/widgets/outlined_icon.dart';

class AppBarWithCartWidget extends StatelessWidget {
  const AppBarWithCartWidget({
    super.key,
    required this.shoeName,
    required this.cartCount,
  });

  final String shoeName;
  final String cartCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppValues.p_16, vertical: AppValues.p_16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OutlinedIcon(
            svgPath: 'assets/svgs/ic_back.svg',
            onTap: () {},
          ),
          Text(
            shoeName,
            style: TextStyle(
              fontFamily: AppFonts.workSans,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          OutlinedIcon(
            svgPath: 'assets/svgs/ic_cart.svg',
            badge: cartCount,
            // customSize: AppValues.p_8,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
