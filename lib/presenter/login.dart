import 'package:exemplo_mvp/view/login.dart';
import 'package:exemplo_mvp/model/login.dart';

class LoginPresenter {
  LoginModel _model = LoginModel();
  LoginView _view = LoginView();

  set view(LoginView value){
  	_view = value;
  	_view.updateNome(_model.nome);
  	_view.updateCidade(_model.cidade);
  }

  void onNomeChanged(String nome){
  	//inverte a string
	nome = nome.split('').reversed.join('');

	_model.nome = nome;

	_view.updateNome(_model.nome);
  }

  void onCidadeChanged(String cidade){
  	//cRiA eSsE eFeITo Na StRiNg
	var sb = new StringBuffer();
	var capitalize = false;
	for(var i = 0; i < cidade.length; i++) {
		if(capitalize){
	    	sb.write(cidade[i].toUpperCase());
	    	capitalize = false;
		}
		else{
			sb.write(cidade[i].toLowerCase());
			capitalize = true;
		}
	}

    cidade = sb.toString();

  	_model.cidade = cidade;

  	_view.updateCidade(_model.cidade);
  }


}