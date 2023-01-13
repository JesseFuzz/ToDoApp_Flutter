import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/util/todo_list.dart';

import '../util/floating_dialog_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //fazendo referência ao Hive Box
  final _myHiveBox = Hive.box("myHiveBox");

//uma instância da classe de dados
  TodoDataBase db = TodoDataBase();

  final _controllerTask = TextEditingController();
  final _controllerDescription = TextEditingController();

  @override
  void initState() {
    // se essa é a primeira vez abrindo o app ele vai rodar os dados mockados
    if (_myHiveBox.get("LISTATAREFAS") == null) {
      db.createInitalData();
    } else {
      //se já existe dados e não é a primeira vez que abre o app
      db.loadData();
    }
    super.initState();
  }

  //lista das tarefas
  // List listaTarefas = [
  //   ["estudar Flutter", true, "finalizar os meus projetos pessoais"],
  //   ["estudar Angular", false, "Ecommerce"],
  //   ["Prova faculdade", false, "entregar a prova"]
  // ];

  // get value => null;

  //quando eu clicar no checkbox
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      //mudando de verdadeiro pra falso (ou contrário) o item que ta na posiçao 1 da lista
      db.listaTarefas[index][1] = !db.listaTarefas[index][1];
    });
    //se o checkbox mudar roda esse método do db para atualizar
    db.updateDataBase();
  }

// método para salvar
  void saveNewTask() {
    setState(() {
      //.text para que seja String
      db.listaTarefas
          .add([_controllerTask.text, false, _controllerDescription.text]);
    });
    //limpo para não aparecer no textBox sempre
    _controllerDescription.clear();
    _controllerTask.clear();
    //fecho a página após salvar
    Navigator.of(context).pop(true);
    //se salvar algo roda esse método do db para atualizar
    db.updateDataBase();
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
          onCancel: (() => setState(
                () {
                  Navigator.of(context).pop(true);
                },
              )),
        );
      },
    );
  }

//deleto uma tarefa já criada
  void deleteTask(int index) {
    setState(() {
      //removeAt é pra quando eu passo um index
      db.listaTarefas.removeAt(index);
    });
    //se apagar algo roda esse método do db para atualizar
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: const Text("Lista de Tarefas"),
        centerTitle: true,
        //retirando a sombra do appBar
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      //estou instanciando as atividades no ListView.builder
      body: ListView.builder(
        itemCount: db.listaTarefas.length,
        itemBuilder: (context, index) {
          //retorno as instancias baseado na lista de tarefas que eu fiz
          return ToDoList(
            taskName: db.listaTarefas[index][0],
            isTaskCompleted: db.listaTarefas[index][1],
            taskDescription: db.listaTarefas[index][2],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
