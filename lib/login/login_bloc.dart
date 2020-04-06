import 'package:movies_flutter/login/login_api.dart';
import 'package:movies_flutter/utils/progress_bloc.dart';

class LoginBloc {
  final progress = ProgressBloc();
  
  login(LoginInput input) async {
    progress.setProgress(true);

    try {
      return await LoginApi.login(input);
    } finally {
      progress.setProgress(false);
    }
  }

  disponse() {
    progress.close();
  }

}