import 'package:expense_manager/model/transaction.dart';
import 'package:expense_manager/widget/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedTransaction {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      var totalSum = 0.0;
      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekDay.day &&
            recentTransaction[i].date.month == weekDay.month &&
            recentTransaction[i].date.year == weekDay.year) {
          totalSum = totalSum + recentTransaction[i].price;
        }
      }
      // print(totalSum);
      print(DateFormat.E().format(weekDay));
      return {'date': DateFormat.E().format(weekDay), 'price': totalSum};
    });
  }

  double get totalSpending {
    return groupedTransaction.fold(0.0, (sum, element) {
      return sum + element['price'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransaction);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: groupedTransaction.map((e) {
          return Flexible(
            fit: FlexFit.tight,
            child: ChartBar(
                e['date'], e['price'], totalSpending == 0.0 ? 0.0 : (e['price'] as double) / totalSpending),
          );
        }).toList(),
      ),
    );
  }
}
