
import 'package:flutter/material.dart';


class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final priceController = TextEditingController();

  void submitData(){
    final enteredTitle = titleController.text;
    final enteredPrice = double.parse(priceController.text);

    if(enteredTitle.isEmpty || enteredPrice<=0){
      return;
    }
    widget.addTransaction(
        enteredTitle,
        enteredPrice
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 5,
      child: SingleChildScrollView(
        child: Container(
          height: 300,
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
      ),
    );
  }
}
