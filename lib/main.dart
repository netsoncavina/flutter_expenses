// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final _transactions = [
    Transaction(id: 't1', title: 'Novo Tênis de Corrida', value: 310.76, date: DateTime.now()),
    Transaction(id: 't2', title: 'Conta de Luz', value: 211.30, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Despesas Pessoais'),
          backgroundColor: Colors.blue[300],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Text('Gráfico'),
              elevation: 5,
            ),
            Column(
              children: _transactions.map((transaction) {
                return Card(
                  color: Colors.white,
                  elevation: 1,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.purple,
                            width: 2,
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'R\$ ${transaction.value.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transaction.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            DateFormat('d MMM y').format(transaction.date),
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
            Card(
                color: Colors.white,
                elevation: 1,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      TextField(decoration: InputDecoration(labelText: 'Título')),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Valor (R\$)',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            child: Text(
                              'Nova Transação',
                              style: TextStyle(
                                color: Colors.purple,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ));
  }
}
