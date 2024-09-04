import 'package:flutter/material.dart';
import 'package:simple_app/componentes/editor.dart';

class Tarefa {
  final String titulo;
  String descricao;
  int nivel = 0;

  Tarefa(this.titulo, this.descricao, this.nivel);

  void editarTarefa(BuildContext context, Function(String) onDescricaoAtualizada) async {
    TextEditingController descricaoController = TextEditingController(text: descricao);
    
    String novaDescricao = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Editar Descrição"),
          content: Editor(
            controlador: descricaoController,
            rotulo: "Descrição",
            dica: "Digite a nova descrição",
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                descricao = descricaoController.text;
                Navigator.of(context).pop();
              },
              child: Text("Salvar"),
            ),
          ],
        );
      },
    );
    // ignore: unnecessary_null_comparison
    if (novaDescricao != null) {
      descricao = novaDescricao;
      onDescricaoAtualizada(descricao);
    }
  }

  void removerTarefa(List<Tarefa> lista, int index) {
    lista.removeAt(index);
  }
}
