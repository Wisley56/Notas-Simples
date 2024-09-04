import 'package:flutter/material.dart';
import 'package:simple_app/telas/tarefas.dart';

void main() => runApp(SimpleApp());

class SimpleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListaTarefas(),
    );
  }
}