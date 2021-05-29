import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Transaction {
  String title;
  String id;
  double price;
  DateTime date;

  Transaction({
    @required this.title,
    @required this.id,
    @required this.price,
    @required this.date
  });

  Transaction.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        title = res["title"],
        price = res["price"],
        date = res["date"];

  Map<String, Object> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'date': date,
    };
  }
}
