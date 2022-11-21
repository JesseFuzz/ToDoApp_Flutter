import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo_app/util/buttons.dart';

class FloatingDialogBox extends StatelessWidget {
  VoidCallback onSave;
  VoidCallback onCancel;
  //minha variável para o controller
  final controller1;
  final controller2;
  //inicio essa variável no construtor:
  //ou seja, vou precisar passar um controller quando eu chamar FloatingDialogBox
  FloatingDialogBox(
      {super.key,
      required this.controller1,
      required this.controller2,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[400],
      content: Container(
        height: 200,
        child: Column(
          //defino como tudo se posicionará dentro do container em forma de coluna
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: controller1,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Adicione uma nova tarefa"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: controller2,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "descrição da tarefa"),
              ),
            ),
            Row(
              //defino como os botões irão se posicionar
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //chamo os botões que eu criei e passo os argumentos
                MyButton(
                  text: "Salvar",
                  onPressed: onSave,
                ),
                //esse sizedBox desconsidere o meu spaceEvenly
                // const SizedBox(width: 40),
                MyButton(
                  text: "Cancelar",
                  onPressed: onCancel,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
