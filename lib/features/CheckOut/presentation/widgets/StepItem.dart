import 'package:e_commerce/features/CheckOut/presentation/widgets/ActiveStepItem.dart';
import 'package:e_commerce/features/CheckOut/presentation/widgets/InActiveStepItem.dart';
import 'package:flutter/material.dart';

class StepItem extends StatelessWidget {
  const StepItem({super.key, required this.isActive});
 final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 300),
      firstChild: ActiveStepItem(),
      secondChild: InActiveStepItem(),
      crossFadeState: (isActive ? CrossFadeState.showFirst : CrossFadeState.showSecond),
    );
  }
}
