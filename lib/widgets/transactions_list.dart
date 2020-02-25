import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  final Function _deleteTransaction;

  TransactionList(this._transactions, this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                radius: 20,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: FittedBox(
                    child: Text(
                      '\$${_transactions[index].amount.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              title: Text(
                _transactions[index].title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                DateFormat.yMMMd().format(_transactions[index].date),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => _deleteTransaction(_transactions[index].id),
              ),
            ),
          );
        },
        itemCount: _transactions.length,
      ),
    );
  }
}
