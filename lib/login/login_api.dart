import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:movies_flutter/utils/response.dart';

class LoginInput {
  String login;
  String senha;

  topMap() {
    return {
      "login": login,
      "senha": senha,
    };
  }
}

class LoginResponse {
  final bool status;
  final String msg;

  LoginResponse.fromJson(Map<String, dynamic> map)
      : status = map["status"] == "OK",
        msg = map["msg"];
}

class LoginApi {
  
  static Future<GenericResponse<LoginResponse>> login(LoginInput loginInput)  async {
    try {
      final url = "http://livrowebservices.com.br/rest/login";

      final params = {
        "login": loginInput.login,
        "senha": loginInput.senha
      };

      final response = await http.post(url, body: params);

      final json = response.body;
      final map = convert.json.decode(json);
      print("< json: $map");

      final r = LoginResponse.fromJson(map);

      return GenericResponse(true, msg: r.msg, result: r);
    } catch(error, stracktrace) {
      print("Login error: $error - $stracktrace");

      return GenericResponse(false, msg: "Erro ao fazer login!");
    }
  }

}
