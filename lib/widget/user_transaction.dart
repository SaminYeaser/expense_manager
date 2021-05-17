import 'package:expense_manager/model/transaction.dart';
import 'package:expense_manager/widget/transaction_list.dart';
import 'package:flutter/material.dart';

import 'newTransection.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({Key key}) : super(key: key);

  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransaction = [
    Transaction(title: 'shoe', id: 'd1', price: 69.99, date: DateTime.now()),
    Transaction(title: 'shirt', id: 'd2', price: 23.99, date: DateTime.now())
  ];

  void _addNewTransaction(String txTitle, double txPrice) {
    final newTransaction = Transaction(
        title: txTitle,
        price: txPrice,
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      _userTransaction.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [NewTransaction(_addNewTransaction), TransactionList(_userTransaction)],
    );
  }
}
