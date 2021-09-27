import 'package:flutter/material.dart';
import 'package:exemplo_mvp/view/login.dart';
import 'package:exemplo_mvp/presenter/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor : Colors.blue
       ),
       home: LoginPage(new LoginPresenter())
     );
  }
}
