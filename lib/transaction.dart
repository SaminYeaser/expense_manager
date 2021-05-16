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
}
