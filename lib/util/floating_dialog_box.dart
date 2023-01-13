import 'package:flutter/material.dart';
import 'package:todo_app/util/buttons.dart';

class FloatingDialogBox extends StatelessWidget {
  //definindo uma chave para o meu validator e aí adiciono essa _formKey na key do meu Form a ser validado
  final _formKey = GlobalKey<FormState>();
  VoidCallback onSave;
  VoidCallback onCancel;
  //minha variável para o controller
  final controller1;
  final controller2;
  //inicio essa variável no construtor:
  //ou seja, vou precisar passar um controller quando eu chamar FloatingDialogBox
  FloatingDialogBox({
    super.key,
    required this.controller1,
    required this.controller2,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[400],
      content: SizedBox(
        height: 200,
        child: Column(
          //defino como tudo se posicionará dentro do container em forma de coluna
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  controller: controller1,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Adicione uma nova tarefa"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    if (value.length < 3) {
                      return "this text looks short, isn't it?";
                    }
                    return null;
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: controller2,
                decoration: const InputDecoration(
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
                    onPressed: () {
                      if (_formKey.currentState?.validate() != null &&
                          _formKey.currentState!.validate()) {
                        onSave();
                      }
                    }),
                //esse sizedBox desconsidere o meu spaceEvenly
                // const SizedBox(width: 40),
                MyButton(
                  text: "Cancelar",
                  // child: Text("Cancelar"),
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
