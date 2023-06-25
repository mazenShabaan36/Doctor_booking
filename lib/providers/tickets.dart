import 'package:doctor_appointment/models/data.dart';
import 'package:flutter/material.dart';
//enum FilterStatus { upcoming, complete, cancel }
class tickets with ChangeNotifier {
  List<ticket> _orders = [];

  List<ticket> get orders {
    return [..._orders];
  }

  void addOrder(String name, String date, String time, FilterStatus type) {
    _orders.add(
      ticket(
        doc_name: name,
        Date: date,
        time: time,
        type: type,
      ),
    );
    notifyListeners();
    print(_orders[0].doc_name);
  }
}
