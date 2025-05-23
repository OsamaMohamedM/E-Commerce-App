import 'dart:developer';

import 'package:e_commerce/Core/utils/styles/app_colors.dart';
import 'package:flutter/material.dart';
import '../../data/models/TrackingStatus.dart';

class TrackingStatusTile extends StatelessWidget {
  final TrackingStatus status;

  const TrackingStatusTile({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    log(" name ${status.title}");
    return ListTile(
      leading: Icon(
        Icons.check_circle,
        color: status.isCompleted ? AppColors.darkPrimaryColor : AppColors.grayTextColor,
      ),
      title: Text(status.title,),
      subtitle: status.date.isNotEmpty
          ? Text(status.date,)
          : null,
    );
  }
}
