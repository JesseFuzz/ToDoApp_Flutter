import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoList extends StatelessWidget {
  //parametros de cada atividade
  final String taskName;
  final String taskDescription;
  final bool isTaskCompleted;
  //esse é basicamente o tipo de método que o onChanged do checkbox pede
  //eu só copiei dele, aparece quando eu coloco o mouse em cima do checkbox
  Function(bool?)? onChanged;
//eu só copiei dele, aparece quando eu coloco o mouse em cima do slidable
  Function(BuildContext)? deleteFunction;
  //passo os paraetros das atividades construtor e ele deixará de ser const
  ToDoList(
      {super.key,
      required this.taskName,
      required this.isTaskCompleted,
      required this.onChanged,
      required this.taskDescription,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      //padding fora do container:
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
      child: Slidable(
        //end eu arrasto da direita (ou fim)
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              //borda circular pra ficar igual o container abaixo
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          //padding dentro do container
          padding: const EdgeInsets.all(25.0),
          decoration: BoxDecoration(
            color: Colors.grey,
            //arredondando as bordas
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              //checkbox
              Checkbox(
                value: isTaskCompleted,
                onChanged: onChanged,
                //cor do checkbox
                activeColor: Colors.green,
              ),

              Column(
                //cross pra deixar todos no começo
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //nome da tarefa
                  Text(
                    taskName,
                    //ternário para mostrar o risco quando isTaskCompleted == true
                    style: TextStyle(
                        decoration: isTaskCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        fontSize: 16),
                  ),
                  //descrição da tarefa
                  Text(
                    '$taskDescription'.toUpperCase(),
                    style: const TextStyle(fontSize: 10),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
