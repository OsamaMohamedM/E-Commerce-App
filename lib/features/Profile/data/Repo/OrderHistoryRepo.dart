import 'dart:developer';

import 'package:e_commerce/Core/Services/DataBaseService.dart';
import 'package:e_commerce/Core/utils/constants/BackEndEndPoints.dart';

import '../../data/models/CustomerOrder.dart';

class OrderHistoryRepo {
  final DataBaseService dataBaseService;

  OrderHistoryRepo({required this.dataBaseService});

  Future<List<CustomerOrder>> fetchOrders(String uid) async {
    try {
      
      final data = await dataBaseService.getData(BackEndEndPoints.orders);
      final List filtered =
          (data as List).where((order) => order['uid'] == uid).toList();

      return filtered.map((e) => CustomerOrder.fromMap(e)).toList();
    } catch (e) {
      throw Exception('فشل في جلب الطلبات: $e');
    }
  }
}
