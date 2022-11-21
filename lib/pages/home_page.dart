import 'package:flutter/material.dart';
import 'package:todo_app/util/todo_list.dart';

import '../util/floating_dialog_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controllerTask = TextEditingController();
  final _controllerDescription = TextEditingController();
  //lista das tarefas
  List listaTarefas = [
    ["estudar Flutter", true, "finalizar os meus projetos pessoais"],
    ["estudar Angular", false, "Ecommerce"],
    ["Prova faculdade", false, "entregar a prova"]
  ];

  // get value => null;

  //quando eu clicar no checkbox
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      //mudando de verdadeiro pra falso (ou contrário) o item que ta na posiçao 1 da lista
      listaTarefas[index][1] = !listaTarefas[index][1];
    });
  }

// método para salvar
  void saveNewTask() {
    setState(() {
      //.text para que seja String
      listaTarefas
          .add([_controllerTask.text, false, _controllerDescription.text]);
    });
    //limpo para não aparecer no textBox sempre
    _controllerDescription.clear();
    _controllerTask.clear();
    //fecho a página após salvar
    Navigator.of(context).pop;
  }

  //criando uma nova tarefa
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        //retorno a página criada no util
        return FloatingDialogBox(
          //aqui nós conseguimos ter acesso ao que for digitado
          controller1: _controllerTask,
          controller2: _controllerDescription,

          onSave: saveNewTask,
          //fecho a página
          onCancel: (() => setState(() {
                Navigator.of(context).pop;
              })),
        );
      },
    );
  }

//deleto uma tarefa já criada
  void deleteTask(int index) {
    setState(() {
      //removeAt é pra quando eu passo um index
      listaTarefas.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Row(
          //mainAxisAlignment foi pra centralizar o título da appbar
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Lista de Tarefas"),
          ],
        ),
        //retirando a sombra do appBar
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      //estou instanciando as atividades no ListView.builder
      body: ListView.builder(
        itemCount: listaTarefas.length,
        itemBuilder: (context, index) {
          //retorno as instancias baseado na lista de tarefas que eu fiz
          return ToDoList(
            taskName: listaTarefas[index][0],
            isTaskCompleted: listaTarefas[index][1],
            taskDescription: listaTarefas[index][2],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
