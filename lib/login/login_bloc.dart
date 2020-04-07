import 'package:movies_flutter/login/login_api.dart';
import 'package:movies_flutter/utils/simple_bloc.dart';

class LoginBloc extends SimpleBloc<bool> {
  
  login(LoginInput input) async {
    add(true);

    try {
      return await LoginApi.login(input);
    } finally {
      add(false);
    }
  }

}
