import 'package:expense_manager/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactioList extends StatelessWidget {

  final List<Transaction> transaction = [
    Transaction(id: 't1', title: 'shoes', price: 45.99, date: DateTime.now()),
    Transaction(id: 't2', title: 'shirts', price: 30.99, date: DateTime.now())
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: transaction
          .map((e) => Card(
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                  border:
                  Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(10),
              child: Text(
                '৳${e.price}',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  e.title,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  DateFormat.yMMMd().format(e.date),
                  style: TextStyle(color: Colors.grey),
                )
              ],
            )
          ],
        ),
      ))
          .toList(),
    );
  }
}
