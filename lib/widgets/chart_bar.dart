import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double perOfTotal;

  ChartBar(this.label, this.perOfTotal, this.spendingAmount);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text('\$${spendingAmount.toStringAsFixed(0)}'),
          Container(
            height: 60,
            width: 10,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300], width: 1),
                    color: Colors.grey[300],
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: perOfTotal,
                  child: Container(
                    color: Theme.of(context).primaryColorDark,
                  ),
                ),
              ],
            ),
          ),
          Text(label),
        ],
      ),
    );
  }
}
