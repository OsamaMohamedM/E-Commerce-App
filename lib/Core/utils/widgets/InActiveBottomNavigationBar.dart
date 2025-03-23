import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InActiveBottomNavigationBar extends StatelessWidget {
  final String image;
  final String name;

  const InActiveBottomNavigationBar(
      {super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: SvgPicture.asset(image, width: 24, height: 24)
      );
  }
}
