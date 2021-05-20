import 'package:expense_manager/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;

  TransactionList(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transaction.isEmpty
          ? Center(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 20),
                      child: Text(
                    'No Transaction Still now',
                    style: Theme.of(context).textTheme.headline6,
                  )),
                  Container(
                    height: 200,
                    padding: EdgeInsets.only(top: 30),
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '৳${transaction[index].price.toStringAsFixed(2)}',
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
                            transaction[index].title,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            DateFormat.yMMMd().format(transaction[index].date),
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: transaction.length,
            ),
    );
  }
}
