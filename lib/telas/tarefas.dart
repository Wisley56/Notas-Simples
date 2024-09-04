import 'package:flutter/material.dart';
import 'package:simple_app/modelo/tarefa.dart';
import 'package:simple_app/telas/criar_tarefa.dart';
import 'package:simple_app/telas/detalhe_tarefa.dart';

const String _titulo = 'Simple Task';

class ListaTarefas extends StatefulWidget {
  ListaTarefas({super.key});

  final List<Tarefa> _listaTarefas = List.empty(growable: true);

  @override
  State<ListaTarefas> createState() => _ListaTarefasState();
}

class _ListaTarefasState extends State<ListaTarefas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          _titulo,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
              onPressed: () {
                final Future future = Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CriarTarefa()));
                future.then((tarefaRecebida) {
                  if (tarefaRecebida != null) {
                    setState(() {
                      widget._listaTarefas.add(tarefaRecebida);
                    });
                  }
                });
              },
              icon: Icon(Icons.add_circle_outline))
        ],
      ),
      body: ListView.builder(
          itemCount: widget._listaTarefas.length,
          itemBuilder: (context, indice) {
            return SimpleCard(
              tarefa: widget._listaTarefas[indice],
              listaDeTarefas: widget._listaTarefas,
              onDelete: () {
                setState(() {widget._listaTarefas.removeAt(indice);});
                }
              );
          }),
    );
  }
}

class SimpleCard extends StatefulWidget {
  final Tarefa tarefa;
  final List<Tarefa> listaDeTarefas;
  final VoidCallback onDelete;

  SimpleCard({required this.tarefa, required this.listaDeTarefas, required this.onDelete});

  @override
  State<StatefulWidget> createState() {
    return _SimpleCardState();
  }
}

class _SimpleCardState extends State<SimpleCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        shadowColor: Colors.black87,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.grey[300]!,
                Colors.amberAccent[200]!,
              ],
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
              leading: CircleAvatar(
                  backgroundColor: Colors.amberAccent,
                  child: Icon(Icons.account_circle)),
              title: Text(widget.tarefa.titulo,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  )),
              subtitle: Text('Nível: ${widget.tarefa.nivel}'),
              trailing: ElevatedButton(
                onPressed: () {
                  setState(() {
                    widget.tarefa.nivel++;
                  });
                },
                child: Icon(Icons.arrow_drop_up),
              ),
              onLongPress: () => {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Excluir Tarefa?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Fechar'),
                            ),
                            TextButton(
                                onPressed: () {
                                  
                                  //widget._tarefa.removerTarefa(widget._listaDeTarefas, widget._listaDeTarefas.indexOf(widget._listaDeTarefas as Tarefa));
                                  widget.onDelete();
                                  Navigator.of(context).pop();
                                },
                                child: Text('Confirmar'))
                          ],
                        );
                      },
                    )
                  },
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetalheTarefa(widget.tarefa)));
              }),
        ));
  }
}
