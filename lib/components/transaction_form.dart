import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  TransactionForm({super.key});
  final titleController = TextEditingController();
  final valueController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              TextField(controller: titleController, decoration: const InputDecoration(labelText: 'Título')),
              TextField(
                controller: valueController,
                decoration: const InputDecoration(
                  labelText: 'Valor (R\$)',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    child: const Text(
                      'Nova Transação',
                      style: TextStyle(
                        color: Colors.purple,
                      ),
                    ),
                    onPressed: () {
                      print(titleController.text);
                      print(valueController.text);
                    },
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
