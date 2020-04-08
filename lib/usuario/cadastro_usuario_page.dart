import 'package:flutter/material.dart';
import 'package:movies_flutter/home/home_page.dart';
import 'package:movies_flutter/usuario/cadastro_usuario_api.dart';
import 'package:movies_flutter/usuario/cadastro_usuario_bloc.dart';
import 'package:movies_flutter/utils/nav.dart';
import 'package:movies_flutter/utils/validators.dart';
import 'package:movies_flutter/widgets/alert.dart';
import 'package:movies_flutter/widgets/bg_login.dart';
import 'package:movies_flutter/widgets/button.dart';
import 'package:movies_flutter/widgets/text_input.dart';

class CadastroUsuarioPage extends StatefulWidget {
  @override
  _CadastroUsuarioPageState createState() => _CadastroUsuarioPageState();
}

class _CadastroUsuarioPageState extends State<CadastroUsuarioPage> {
  final _formKey = GlobalKey<FormState>();

  final _input = CadastroUsuarioInput();
  final _bloc = CadastroUsuarioBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de Usuário"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[BgLogin(), _body()],
      ),
    );
  }

  _body() {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            Container(
              child: Image.asset("assets/images/logo_nf.png",
                  width: 120, height: 120),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: TextInput(
                "Nome",
                "Digite o seu nome",
                validator: (text) {
                  return validateRequired(text, "Informe seu nome");
                },
                onSave: (value) => this._input.nome = value,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: TextInput(
                "Login",
                "Digite o seu login",
                validator: (text) {
                  return validateRequired(text, "Informe seu login");
                },
                onSave: (value) => this._input.login = value,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: TextInput(
                "E-mail",
                "Digite o seu e-mail",
                keyboardType: TextInputType.emailAddress,
                validator: (text) {
                  return validateRequired(text, "Informe seu e-mail");
                },
                onSave: (value) => this._input.email = value,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: TextInput(
                "Senha",
                "Digite o seu senha",
                password: true,
                validator: (text) {
                  return validateRequired(text, "Informe seu senha");
                },
                onSave: (value) => this._input.senha = value,
              ),
            ),
            StreamBuilder<bool>(
              stream: _bloc.stream,
              initialData: false,
              builder: (context, snapshot) {
                return Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Button(
                    "Cadastrar",
                    _onClickCadastrar,
                    showProgress: snapshot.data,
                  ),
                );
              },
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Button("Cancelar", _onClickCancelar),
            )
          ],
        ),
      ),
    );
  }

  void _onClickCadastrar() async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    // Salva o form
    _formKey.currentState.save();

    final response = await _bloc.cadastrar(_input);

    if (response.isOk()) {
      pushReplacement(context, HomePage());
    } else {
      alert(context, "Filmes", response.msg);
    }
  }

  @override
  void dispose() {
    super.dispose();

    _bloc.dispose();
  }

  void _onClickCancelar() {
    pop(context);
  }
}
