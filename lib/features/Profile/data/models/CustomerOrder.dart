import 'TrackingStatus.dart';

class CustomerOrder {
  final String id;
  final DateTime date;
  final int itemCount;
  final double total;
  final List<TrackingStatus> status;
  final String PayWithCash;

  CustomerOrder({
    this.PayWithCash = 'PayWithCash',
    required this.id,
    required this.date,
    required this.itemCount,
    required this.total,
    required this.status,
  });

  factory CustomerOrder.fromMap(Map<String, dynamic> map) {
    return CustomerOrder(
      PayWithCash: map['PayWithCash'] ?? '',
      id: map['id'] ?? '',
      date: DateTime.parse(map['date']),
      itemCount: map['itemCount'] ?? 0,
      total: map['total']?.toDouble() ?? 0.0,
      status: (map['status'] as List<dynamic>?)
              ?.map((e) => TrackingStatus.fromMap(e))
              .toList() ??
          [],
    );
  }
}
