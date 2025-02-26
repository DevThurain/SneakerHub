import 'package:dough/dough.dart';
import 'package:flutter/material.dart';

class DraggableShoeWidget extends StatelessWidget {
  const DraggableShoeWidget({
    super.key,
    required this.onDragStart,
    required this.onDragEnd,
    required this.feedBackWidget,
    required this.drageWidget,
    required this.showShoe,
  });

  final VoidCallback onDragStart;
  final VoidCallback onDragEnd;
  final Widget feedBackWidget;
  final Widget drageWidget;
  final bool showShoe;

  @override
  Widget build(BuildContext context) {
    return DoughRecipe(
      data: DoughRecipeData(
        adhesion: 4,
        viscosity: 500,
        draggableRecipe: DraggableDoughRecipeData(
          breakDistance: 80,
          useHapticsOnBreak: true,
        ),
      ),
      child: DraggableDough<String>(
        data: 'My data!',
        feedback: feedBackWidget,
        longPress: false,
        childWhenDragging: SizedBox(),
        onDragStarted: () {
          onDragStart();
        },
        onDraggableCanceled: (velocity, offset) {
          onDragEnd();
        },
        onDragCompleted: () {
          onDragEnd();
        },
        onDragEnd: (details) {
          onDragEnd();
        },
        onDoughBreak: () {
          // // This callback is raised when the dough snaps from its hold at its origin.
          // print('Demo dough snapped and is freely being dragged!');
        },
        child: showShoe ? drageWidget : SizedBox(),
      ),
    );
  }
}
