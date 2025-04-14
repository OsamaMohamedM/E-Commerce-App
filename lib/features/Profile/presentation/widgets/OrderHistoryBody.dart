import 'package:flutter/material.dart';
import '../../../../Core/utils/widgets/CustomAppBar.dart';
import '../../data/models/CustomerOrder.dart';
import '../../data/models/TrackingStatus.dart';
import 'OrderCard.dart';

class OrderHistoryBody extends StatefulWidget {
  final void Function(int index) onTabChange;
  const OrderHistoryBody({super.key, required this.onTabChange});

  @override
  _OrderHistoryBodyState createState() => _OrderHistoryBodyState();
}

class _OrderHistoryBodyState extends State<OrderHistoryBody> {
  List<bool> expanded = [false];

  List<CustomerOrder> orders = [
    CustomerOrder(
      id: '#1234567',
      date: DateTime(2024, 3, 22),
      itemCount: 10,
      total: 250,
      status: [
        TrackingStatus(
            title: 'تتبع الطلب', date: '22 مارس، 2024', isCompleted: true),
        TrackingStatus(
            title: 'قبول الطلب', date: '22 مارس، 2024', isCompleted: true),
        TrackingStatus(
            title: 'تم شحن الطلب', date: '22 مارس، 2024', isCompleted: true),
        TrackingStatus(title: 'خرج للتوصيل', date: '', isCompleted: false),
        TrackingStatus(title: 'تم التسليم', date: '', isCompleted: false),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
            tittle: "تتبع الطلبات",
            visibleLeading: true,
            visibleTrailing: false,
            onPressed: () {
              widget.onTabChange(3);
            },
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                return OrderCard(
                  order: orders[index],
                  isExpanded: expanded[index],
                  onTap: () {
                    setState(() {
                      expanded[index] = !expanded[index];
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
