import 'package:e_commerce/features/CheckOut/presentation/widgets/ActiveStepItem.dart';
import 'package:e_commerce/features/CheckOut/presentation/widgets/InActiveStepItem.dart';
import 'package:flutter/material.dart';

class StepItem extends StatelessWidget {
  final String title;
  final String number;
  const StepItem({super.key, required this.isActive, required this.title ,required this.number});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 300),
      firstChild: ActiveStepItem(
        text: title,
      ),
      secondChild: InActiveStepItem(
        title: title,
        number: number,
      ),
      crossFadeState:
          (isActive ? CrossFadeState.showFirst : CrossFadeState.showSecond),
    );
  }
}
