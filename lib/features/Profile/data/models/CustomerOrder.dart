import 'TrackingStatus';

class CustomerOrder {
  final String id;
  final DateTime date;
  final int itemCount;
  final double total;
  final List<TrackingStatus> status;

  CustomerOrder({
    required this.id,
    required this.date,
    required this.itemCount,
    required this.total,
    required this.status,
  });
}

