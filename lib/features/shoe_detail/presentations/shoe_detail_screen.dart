import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sneakerhub/core/themes/app_values.dart';
import 'package:sneakerhub/features/global/widgets/auto_annotated_region_widget.dart';
import 'package:sneakerhub/features/shoe_detail/presentations/widgets/app_bar_with_cart_widget.dart';
import 'package:sneakerhub/features/shoe_detail/presentations/widgets/put_shoe_to_box_widget.dart';

class ShoeDetailScreen extends HookConsumerWidget {
  const ShoeDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AutoAnnotatedRegionWidget(
        child: Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarWithCartWidget(
              shoeName: 'Air Max 200 SE',
              cartCount: '2',
            ),
            SizedBox(height: AppValues.p_16),
            PutShoeToBoxWidget(),
          ],
        ),
      ),
    ));
  }
}
