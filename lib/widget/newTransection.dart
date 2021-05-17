import 'package:expense_manager/widget/user_transaction.dart';
import 'package:flutter/material.dart';


class NewTransaction extends StatelessWidget {
  final Function addTransaction;
  final titleController = TextEditingController();
  final priceController = TextEditingController();

  NewTransaction(this.addTransaction);

  void submitData(){
    final enteredTitle = titleController.text;
    final enteredPrice = double.parse(priceController.text);

    if(enteredTitle.isEmpty || enteredPrice<=0){
      return;
    }
    addTransaction(
        enteredTitle,
        enteredPrice
    );
  }

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
              onSubmitted: (_)=>submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Price'),
              controller: priceController,
              keyboardType: TextInputType.number,
              onSubmitted: (_)=>submitData(),
            ),
            ElevatedButton(
              child: Text('Add Transaction'),
              onPressed: () {
                  submitData;
              },
            )
          ],
        ),
      ),
    );
  }
}
