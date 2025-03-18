import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
const CustomBottomNavigationBar({ super.key });

  @override
  Widget build(BuildContext context){
    return Container(
      width: 375,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x19000000),
            spreadRadius: 0,
            blurRadius: 25,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      
    );
  }
}