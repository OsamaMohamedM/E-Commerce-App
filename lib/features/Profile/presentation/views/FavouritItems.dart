import 'package:flutter/material.dart';

import '../widgets/FavoriteItemsViewBody.dart';

class FavoriteItemsView extends StatelessWidget {
    final void Function(int index) onTabChange;
const FavoriteItemsView({ super.key  ,required this.onTabChange});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: FavoriteItemsViewBody(onTabChange: onTabChange,),
    );
  }
}