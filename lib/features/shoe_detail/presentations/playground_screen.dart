import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sneakerhub/core/themes/app_fonts.dart';
import 'package:sneakerhub/core/themes/app_values.dart';
import 'package:sneakerhub/features/global/widgets/auto_annotated_region_widget.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sneakerhub/features/shoe_detail/presentations/widgets/static_box_widget.dart';
import 'package:sneakerhub/features/shoe_detail/presentations/widgets/static_closed_box_widget.dart';

class PlaygroundScreen extends StatefulHookConsumerWidget {
  const PlaygroundScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PlaygroundScreenState();
}

class _PlaygroundScreenState extends ConsumerState<PlaygroundScreen> {
  @override
  Widget build(BuildContext context) {
    final moveDownController = useAnimationController();
    ValueNotifier<bool> isCloseBoxNotifier = ValueNotifier(true);

    return AutoAnnotatedRegionWidget(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Playground',
            style: TextStyle(fontFamily: AppFonts.workSans),
          ),
        ),
        body: Stack(
          children: [
            TextButton(
                onPressed: () async {
                  moveDownController.forward();
                  await Future.delayed(Duration(milliseconds: 200));
                  isCloseBoxNotifier.value = false;
                  await Future.delayed(Duration(milliseconds: 200));
                  moveDownController.reverse();
                },
                child: Text(
                  'Move Box',
                  style: TextStyle(fontFamily: AppFonts.workSans),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: TextButton(
                  onPressed: () {
                    isCloseBoxNotifier.value = true;
                  },
                  child: Text(
                    'Close Box',
                    style: TextStyle(fontFamily: AppFonts.workSans),
                  )),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: AppValues.p_16),
                child: ValueListenableBuilder<bool>(
                        valueListenable: isCloseBoxNotifier,
                        builder: (context, isCloseBox, child) {
                          return isCloseBox ? StaticClosedBoxWidget() : StaticBoxWidget();
                        })
                    .animate(
                      controller: moveDownController,
                      autoPlay: false,
                    )
                    .slideY(
                      begin: 0,
                      end: 5,
                      curve: Curves.ease,
                      duration: Duration(milliseconds: 1000),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
