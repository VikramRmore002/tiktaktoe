import 'package:flutter/material.dart';
import 'HomePage.dart';

void main () => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'tic toc toe game',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/background.jpg"),
                  fit: BoxFit.cover)),
          child :HomePage(),
        ));
  }

}


