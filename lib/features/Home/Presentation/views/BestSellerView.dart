import 'package:flutter/material.dart';
import '../widgets/BestSellerViewBody.dart';

class BestSellerView extends StatelessWidget {
  const BestSellerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BestSellerViewBody()),
    );
  }
}
