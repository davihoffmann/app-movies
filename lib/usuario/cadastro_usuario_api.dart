import 'package:movies_flutter/utils/response.dart';

class CadastroUsuarioInput {
  String nome;
  String login;
  String email;
  String senha;

  toMap() {
    return {
      "nome": nome,
      "login": login,
      "email": email,
      "senha": senha,
    };
  }

  @override
  String toString() {
    return "${toMap()}";
  }
}

class CadastroUsuarioApi {

  static Future<GenericResponse> cadastrar(CadastroUsuarioInput c) async {
    print("> post cadastro $c");
    await Future.delayed(Duration(seconds: 2));
    return GenericResponse(true);
  }

}