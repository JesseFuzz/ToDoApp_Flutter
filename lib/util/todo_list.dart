import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ToDoList extends StatelessWidget {
  //parametros de cada atividade
  final String taskName;
  final String? taskDescription;
  final bool isTaskCompleted;
  //esse é basicamente o tipo de método que o onChanged do checkbox pede
  //eu só copiei dele, aparece quando eu coloco o mouse em cima do checkbox
  Function(bool?)? onChanged;

  //passo os paraetros das atividades construtor e ele deixará de ser const
  ToDoList(
      {super.key,
      required this.taskName,
      required this.isTaskCompleted,
      required this.onChanged,
      this.taskDescription});

  @override
  Widget build(BuildContext context) {
    return Padding(
      //padding fora do container:
      padding: const EdgeInsets.all(25.0),
      child: Container(
        //padding dentro do container
        padding: EdgeInsets.all(25.0),
        child: Row(
          children: [
            //checkbox
            Checkbox(value: isTaskCompleted, onChanged: onChanged),
            //nome da tarefa
            Text(taskName),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.grey,
          //arredondando as bordas
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
