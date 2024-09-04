import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  //const Editor({super.key});

  final TextEditingController controlador;
  final String rotulo;
  final String dica;

  Editor({required this.controlador, required this.rotulo, required this.dica});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
          controller: controlador,
          style: TextStyle(fontSize: 24.0),
          decoration: InputDecoration(
            labelText: rotulo,
            hintText: dica,
          ),
          ),
    );
  }
}
