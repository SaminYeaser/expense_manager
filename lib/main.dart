import 'package:expense_manager/transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transaction = [
    Transaction(id: 't1', title: 'shoes', price: 45.99, date: DateTime.now()),
    Transaction(id: 't2', title: 'shirts', price: 30.99, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Manager'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            child: Card(
              color: Colors.blue,
              child: Text('Chart'),
            ),
          ),
          Column(
            children: transaction
                .map((e) => Card(
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                            ),
                            padding: EdgeInsets.all(10),
                            child: Text(e.price.toString()),
                          ),
                          Column(
                            children: [Text(e.title), Text(e.date.toString())],
                          )
                        ],
                      ),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
