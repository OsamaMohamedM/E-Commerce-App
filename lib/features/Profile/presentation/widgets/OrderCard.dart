import 'package:flutter/material.dart';

import '../../data/models/CustomerOrder.dart';
import 'TrackingStatusTile.dart';
import 'package:intl/intl.dart';


class OrderCard extends StatelessWidget {
  final CustomerOrder order;
  final bool isExpanded;
  final VoidCallback onTap;

  const OrderCard({
    super.key,
    required this.order,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          leading: Icon(
            isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
          ),
          title: Text("طلب رقم: ${order.id}"),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "تم الطلب: ${DateFormat('d MMMM، yyyy', 'ar').format(order.date)}",
                   
              ),
              Text("عدد الطلبات: ${order.itemCount}",   ),
              Text("${order.total} جنيه",     ),
            ],
          ),
          trailing: Container(
            width: 66,
            height: 66,
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.inventory_2_outlined),
          ),
        ),
        if (isExpanded)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: order.status.map((status) => TrackingStatusTile(status: status)).toList(),
            ),
          ),
        Divider(),
      ],
    );
  }
}
