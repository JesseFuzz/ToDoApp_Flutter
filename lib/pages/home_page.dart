import 'package:flutter/material.dart';
import 'package:todo_app/util/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          );
        },
      ),
    );
  }
}
