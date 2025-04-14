import 'dart:developer';
import 'package:flutter/material.dart';

import '../../data/models/CustomerOrder.dart';
import 'TrackingStatusTile.dart';
import 'package:intl/intl.dart';

class OrderCard extends StatefulWidget {
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
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    log(widget.isExpanded.toString());
    return Column(
      children: [
        ListTile(
          onTap: widget.onTap,
          leading: Icon(
            widget.isExpanded
                ? Icons.keyboard_arrow_up
                : Icons.keyboard_arrow_down,
          ),
          title: Text("طلب رقم: ${widget.order.id}"),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "تم الطلب: ${DateFormat('d MMMM، yyyy', 'ar').format(widget.order.date)}",
              ),
              Text(
                "عدد الطلبات: ${widget.order.itemCount}",
              ),
              Text(
                "${widget.order.total} جنيه",
              ),
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
        if (widget.isExpanded)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: widget.order.status
                  .map((status) => TrackingStatusTile(status: status))
                  .toList(),
            ),
          ),
        Divider(),
      ],
    );
  }
}
