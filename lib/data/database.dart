import 'package:hive/hive.dart';

class TodoDataBase {
  //lista das tarefas agora está aqui
  List listaTarefas = [];

  //fazendo referência a caixa do hive
  final _myHiveBox = Hive.box("myHiveBox");

  //roda esse método se essa for a primeira vez ever abrindo esse app
  void createInitalData() {
    listaTarefas = [
      // ["estudar Flutter", true, "finalizar os meus projetos pessoais"],
      // ["estudar Angular", false, "Ecommerce"],
      // ["Prova faculdade", false, "entregar a prova"]
    ];
  }

  //carregar os dados do banco de dados
  void loadData() {
    listaTarefas = _myHiveBox.get("LISTATAREFAS");
  }

  //atualizar o banco de dados
  void updateDataBase() {
    _myHiveBox.put("LISTATAREFAS", listaTarefas);
  }
}
