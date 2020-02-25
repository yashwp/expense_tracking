import 'package:expense_tracking/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentExpenses;

  Chart(this.recentExpenses);

  List<Map<String, Object>> get groupedExpenses {
    return List.generate(7, (index) {
      var totalSum = 0.0;
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      for (int i = 0; i < recentExpenses.length; i++) {
        if (recentExpenses[i].date.day == weekDay.day &&
            recentExpenses[i].date.month == weekDay.month &&
            recentExpenses[i].date.day == weekDay.day) {
          totalSum += recentExpenses[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedExpenses.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: groupedExpenses.map((data) {
              return ChartBar(
                data['day'],
                (totalSpending == 0.0) ? 0.0 : (data['amount'] as double) / totalSpending,
                data['amount']
              );
            }).toList(),
          ),
        ),
        elevation: 9,
      ),
    );
  }
}
