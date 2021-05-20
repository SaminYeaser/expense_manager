import 'package:expense_manager/widget/newTransection.dart';
import 'package:expense_manager/widget/transaction_list.dart';
import 'package:flutter/material.dart';

import 'model/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.purple,
          fontFamily: 'Quicksand',
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(fontFamily: 'OpenSans', fontSize: 20))),
          textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(fontFamily: 'OpenSans', fontSize: 15, fontWeight: FontWeight.bold))),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  void _startNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return NewTransaction(_addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Manager'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _startNewTransaction(context))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Card(
                elevation: 5,
                color: Colors.blue,
                child: Text('Chart'),
              ),
            ),
            TransactionList(_userTransaction)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startNewTransaction(context),
      ),
    );
  }
}
