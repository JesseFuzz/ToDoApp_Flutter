import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'pages/home_page.dart';

void main() async {
  //inciando o hive async e await
  await Hive.initFlutter();
  //abrir a caixa do hive, nos outros a gente só referencia com .box
  var box = await Hive.openBox('myHiveBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      //essa é cor padrão caso eu não defina cores para algo
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
