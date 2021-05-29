import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  DateTime _selectedDate;
  final priceController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredPrice = double.parse(priceController.text);

    if (enteredTitle.isEmpty || enteredPrice <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTransaction(enteredTitle, enteredPrice, _selectedDate);
    Navigator.of(context).pop();
  }

  void _datePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });

    });
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
                onSubmitted: (_) => submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Price'),
                controller: priceController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Text(_selectedDate == null
                          ? 'No Date Chosen'
                          : 'Picked Date: ${(DateFormat.yMd().format(_selectedDate))}'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _datePicker();
                      },
                      child: Text(
                        'Pic the Date',
                      ),
                      style: ButtonStyle(),
                    )
                  ],
                ),
              ),
              ElevatedButton(
                child: Text('Add Transaction'),
                onPressed: () {
                  submitData();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
