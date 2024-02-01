import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({super.key, required this.transactions, required this.onDelete});

  final List<Transaction> transactions;
  final void Function(String) onDelete;
  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                SizedBox(
                  height: constraints.maxHeight * 0.05,
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.3,
                  child: Text(
                    'Nenhuma Transação Cadastrada!',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.05,
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final transaction = transactions[index];
              return Card(
                elevation: 5,
                surfaceTintColor: Colors.white,
                margin: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                          child: Text('R\$${transaction.value}'),
                        ),
                      ),
                    ),
                    title: Text(
                      transaction.title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    subtitle: Text(
                      DateFormat('d MMM y').format(transaction.date),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      color: Theme.of(context).colorScheme.error,
                      onPressed: () {
                        onDelete(transaction.id);
                      },
                    )),
              );
            });
  }
}
