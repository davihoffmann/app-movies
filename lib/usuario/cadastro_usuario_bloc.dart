import 'package:movies_flutter/usuario/cadastro_usuario_api.dart';
import 'package:movies_flutter/utils/simple_bloc.dart';

class CadastroUsuarioBloc extends SimpleBloc<bool> {

  cadastrar(CadastroUsuarioInput usuario) async {
    add(true);
    try {
      return await CadastroUsuarioApi.cadastrar(usuario);
    } finally {
      add(false);
    }
  }

}