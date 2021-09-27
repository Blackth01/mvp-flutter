class LoginModel {

  String _nome = '';
  String _cidade = '';

  String get nome => _nome;
  set nome(String nome){
    _nome = nome;
  }

  String get cidade => _cidade;
  set cidade(String cidade){
    _cidade = cidade;
  }

  LoginModel();
}