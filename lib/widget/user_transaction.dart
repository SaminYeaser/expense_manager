import 'package:expense_manager/widget/transaction_list.dart';
import 'package:flutter/material.dart';

import 'newTransection.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({Key key}) : super(key: key);

  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(),
        TransactioList()
      ],
    );
  }
}
