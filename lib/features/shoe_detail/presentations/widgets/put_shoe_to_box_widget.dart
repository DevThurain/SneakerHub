import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sneakerhub/core/themes/app_values.dart';
import 'package:sneakerhub/features/shoe_detail/presentations/widgets/discount_widget.dart';
import 'package:sneakerhub/features/shoe_detail/presentations/widgets/draggable_shoe_widget.dart';
import 'package:sneakerhub/features/shoe_detail/presentations/widgets/precache_hook.dart';
import 'package:sneakerhub/features/shoe_detail/presentations/widgets/select_shoe_color_widget.dart';
import 'package:sneakerhub/features/shoe_detail/presentations/widgets/select_shoe_size_widget.dart';
import 'package:sneakerhub/features/shoe_detail/presentations/widgets/static_shoe_widget.dart';
import 'package:sneakerhub/features/shoe_detail/presentations/widgets/swipe_down_widget.dart';

class PutShoeToBoxWidget extends StatefulHookConsumerWidget {
  const PutShoeToBoxWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PutShoeToBoxWidgetState();
}

class _PutShoeToBoxWidgetState extends ConsumerState<PutShoeToBoxWidget> {
  ValueNotifier<bool> isCloseBoxNotifier = ValueNotifier(false);
  ValueNotifier<bool> showShoeNotifier = ValueNotifier(true);
  ValueNotifier<bool> showArrowNotifier = ValueNotifier(true);
  ValueNotifier<bool> isDraggingNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final myDraggableChild = StaticShoeWidget().animate().fadeIn();
    final myFeedbackWidget = StaticShoeWidget(
      width: 350,
    );

    final moveDownController = useAnimationController();
    final precacheHook = usPrecache();

    // Dough
    final myDraggableDough = ValueListenableBuilder<bool>(
        valueListenable: showShoeNotifier,
        builder: (context, showShoe, child) {
          return DraggableShoeWidget(
            onDragStart: () {
              isDraggingNotifier.value = true;
            },
            onDragEnd: () {
              isDraggingNotifier.value = false;
            },
            feedBackWidget: myFeedbackWidget,
            drageWidget: myDraggableChild,
            showShoe: showShoe,
          );
        });

    final myDragTarget = DragTarget<String>(
      builder: (context, candidateData, rejectedData) {
        return GestureDetector(
          onDoubleTap: () {
            showShoeNotifier.value = true;
          },
          child: ValueListenableBuilder<bool>(
              valueListenable: isCloseBoxNotifier,
              builder: (context, isCloseBox, child) {
                return Image.asset(
                  isCloseBox ? 'assets/pngs/ic_box_close.png' : 'assets/pngs/ic_box.png',
                  width: 300,
                );
              }),
        );
      },
      onWillAccept: (value) {
        return value == 'My data!';
      },
      onAccept: (value) async {
        /* close box -> hide shoe -> animate */
        isCloseBoxNotifier.value = true;
        showShoeNotifier.value = false;
        showArrowNotifier.value = false;

        await Future.delayed(Duration(milliseconds: 500));
        moveDownController.forward();

        await Future.delayed(Duration(milliseconds: 500));
        isCloseBoxNotifier.value = false;

        moveDownController.reverse();
        await Future.delayed(Duration(milliseconds: 600));

        showArrowNotifier.value = true;
        showShoeNotifier.value = true;
      },
    );
    return Expanded(
      child: Stack(
        children: [
          // shoe + branding + color + size
          SizedBox(
            height: height * 0.45,
            child: Stack(
              children: [
                /* Branding */
                Positioned.fill(
                  child: Image.asset(
                    'assets/pngs/ic_long_nike.png',
                  ),
                ),

                /* Shoe */
                Align(
                  alignment: Alignment.center,
                  child: myDraggableDough,
                ),

                /* Select Size */
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: AppValues.p_16, top: AppValues.p_16),
                    child: SelectShoeSizeWidget(),
                  ),
                ),

                /* Select Color */
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: AppValues.p_16, top: height * 0.05),
                    child: SelectShoeColorWidget(),
                  ),
                ),

                /* Discount */
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: AppValues.p_16),
                    child: DiscountWidget(),
                  ),
                ),
              ],
            ),
          ),

          // Shoe Box
          Align(
            alignment: Alignment.bottomCenter,
            child: myDragTarget,
          )
              .animate(
                controller: moveDownController,
                autoPlay: false,
              )
              .slideY(
                begin: 0,
                end: 5,
                curve: Curves.ease,
                duration: Duration(milliseconds: 2000),
              ),

          /* Swipe Arrow */
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 170),
              child: ValueListenableBuilder<bool>(
                  valueListenable: isDraggingNotifier,
                  builder: (context, isDragging, child) {
                    return isDragging
                        ? SizedBox()
                        : ValueListenableBuilder<bool>(
                            valueListenable: showArrowNotifier,
                            builder: (context, showArrow, child) {
                              return showArrow ? SwipeDownWidget() : SizedBox();
                            }).animate().fadeIn();
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
