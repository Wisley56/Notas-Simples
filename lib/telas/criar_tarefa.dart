import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_app/componentes/editor.dart';
import 'package:simple_app/modelo/tarefa.dart';

const String _titulo = 'Simple App';

class CriarTarefa extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CriarTarefaState();
  }
}

class CriarTarefaState extends State<CriarTarefa> {
  final TextEditingController _controladorTitulo = TextEditingController();
  final TextEditingController _controlerDescricao = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          _titulo,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
                controlador: _controladorTitulo,
                rotulo: 'Titulo',
                dica: 'título'),
            Editor(
                controlador: _controlerDescricao,
                rotulo: 'Descrição',
                dica: 'detalhes'),
            ElevatedButton.icon(
                onPressed: () {
                  _criaTarefa(context);
                },
                icon: Icon(Icons.check),
                label: Text('Salvar'))
          ],
        ),
      ),
    );
  }

  void _criaTarefa(BuildContext context) {
    final String? titulo = _controladorTitulo.text;
    final String? descricao = _controlerDescricao.text;
    final tarefaCriada = Tarefa(titulo!, descricao!, 0);
    Navigator.pop(context, tarefaCriada);
  }
}
