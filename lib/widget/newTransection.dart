import 'package:expense_manager/widget/user_transaction.dart';
import 'package:flutter/material.dart';


class NewTransaction extends StatelessWidget {
  final Function addTransaction;
  final titleController = TextEditingController();
  final priceController = TextEditingController();

  NewTransaction(this.addTransaction);

  @override
  Widget build(BuildContext context) {


    return Card(
      elevation: 5,
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Price'),
              controller: priceController,
            ),
            ElevatedButton(
              child: Text('Add Transaction'),
              onPressed: () {
                addTransaction(titleController.text, double.parse(priceController.text));
              },
            )
          ],
        ),
      ),
    );
  }
}
