import 'package:flutter/material.dart';
import 'package:exemplo_mvp/presenter/login.dart';

class LoginView {
  void updateNome(String nome){}
  void updateCidade(String cidade){}
}

class LoginPage extends StatefulWidget{
  final LoginPresenter presenter;
  const LoginPage(this.presenter, {Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> implements LoginView{

  final cidadeController = TextEditingController();
  final nomeController = TextEditingController();
  String _cidade = "";
  String _nome = "";

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    nomeController.addListener(_nomeAtualizou);
    cidadeController.addListener(_cidadeAtualizou);

    this.widget.presenter.view = this;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    cidadeController.dispose();
    super.dispose();
  }

  //função ativada toda vez que o campo de nome é atualizado
  void _nomeAtualizou() {
    this.widget.presenter.onNomeChanged(nomeController.text);
  }

  //função ativada toda vez que o campo de cidade é atualizado
  void _cidadeAtualizou() {
    this.widget.presenter.onCidadeChanged(cidadeController.text);
  }

  @override
  void updateNome(String nome){
    setState(() {
     _nome = nome; 
    });
  }

  @override
  void updateCidade(String cidade){
    setState(() {
     _cidade = cidade; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teste MVP'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Row(
              children: <Widget>[
                Text("Nome: ", style: TextStyle(fontSize: 21)),
                Text("$_nome", style: TextStyle(fontSize: 21))
              ],
            ),
            Row(
              children: <Widget>[
                Text("Cidade: ", style: TextStyle(fontSize: 21)),
                Text("$_cidade", style: TextStyle(fontSize: 21))
              ],
            ),
            TextField(
              controller: nomeController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration( 
               labelText: "Nome",
               labelStyle: TextStyle(fontSize:20.0, color: Colors.black),
               hintText: "Nome"
              )
            ),
            TextField(
              controller: cidadeController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration( 
               labelText: "Cidade",
               labelStyle: TextStyle(fontSize:20.0, color: Colors.black),
               hintText: "Cidade"
              )
            ),
          ],
        ),
      ),
    );
  }
}