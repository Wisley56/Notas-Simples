import 'package:flutter/material.dart';
import 'package:simple_app/modelo/tarefa.dart';

class DetalheTarefa extends StatefulWidget {
  final Tarefa tarefa;
  DetalheTarefa(this.tarefa);
  
  @override
  State<StatefulWidget> createState() {
    return DetalheTarefaState();
  }
}

class DetalheTarefaState extends State<DetalheTarefa> {
  bool _editandoDescricao = false;
  TextEditingController _controllerDescricao = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controllerDescricao.text = widget.tarefa.descricao;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes da Tarefa'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                widget.tarefa.titulo,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Text('Nível: ${widget.tarefa.nivel}',
                  style: TextStyle(backgroundColor: Colors.amber)),
              SizedBox(height: 24),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _editandoDescricao = true;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.black),
                  ),
                  constraints: BoxConstraints.expand(height: 600, width: double.infinity),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: _editandoDescricao
                        ? TextField(
                            controller: _controllerDescricao,
                            onChanged: (novaDescricao) {
                              setState(() {
                                widget.tarefa.descricao = novaDescricao;
                              });
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                          )
                        : Text(widget.tarefa.descricao),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
