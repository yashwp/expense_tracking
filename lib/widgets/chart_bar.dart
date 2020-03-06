import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double perOfTotal;

  ChartBar(this.label, this.perOfTotal, this.spendingAmount);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Container(
          child: Column(
            children: <Widget>[
              Container(
                height: constraints.maxHeight * .15,
                child: Text('\$${spendingAmount.toStringAsFixed(0)}'),
              ),
              Container(
                height: constraints.maxHeight * .6,
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
              Container(
                height: constraints.maxHeight * .15,
                child: Text(label)),
            ],
          ),
        );
      },
    );
  }
}
