import 'package:flutter/material.dart';


class NewTransaction extends StatelessWidget {
  const NewTransaction({Key key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final priceController = TextEditingController();

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
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
