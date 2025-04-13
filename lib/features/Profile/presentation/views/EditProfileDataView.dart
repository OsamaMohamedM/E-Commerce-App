import 'package:flutter/material.dart';

import '../widgets/EditProfileDataViewBody.dart';

class EditProfileDataView extends StatelessWidget {
   final void Function(int index) onTabChange;
const EditProfileDataView({ super.key, required this.onTabChange });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(child: EditProfileDataViewBody(onTabChange: onTabChange,)),
    );
  }
}