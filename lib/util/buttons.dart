import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyButton extends StatelessWidget {
  //nome do botão
  final String text;
  //um método que nada retorna, o anterior retornava um bool
  VoidCallback onPressed;
  //passo no construtor:
  MyButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      //passei o nome onPressed para quando pressionar
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      //passo o nome do botão
      child: Text(text),
    );
  }
}
