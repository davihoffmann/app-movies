import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:movies_flutter/login/login_api.dart';
import 'package:movies_flutter/utils/validators.dart';
import 'package:movies_flutter/widgets/button.dart';
import 'package:movies_flutter/widgets/link.dart';
import 'package:movies_flutter/widgets/text_input.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _formKey = GlobalKey<FormState>();

  LoginInput _input = LoginInput();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[bgLogin(), _body()],
      ),
    );
  }

  bgLogin() {
    return Image.asset(
      "assets/images/bg_login.jpg",
      fit: BoxFit.cover,
    );
  }

  _body() {
    return Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(15),
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(30),
                child: Image.asset(
                  "assets/images/logo_nf.png",
                  height: 120,
                  width: 120,
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
                  "Senha",
                  "Digite sua senha",
                  validator: (text) {
                    return validateRequired(text, "Informe sua senha");
                  },
                  onSave: (value) => this._input.senha = value,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Button(
                  "Login",
                  _onClickLogin,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: GoogleSignInButton(
                  onPressed: _onClickLoginGoogle,
                  borderRadius: 22,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Center(
                  child: Link(
                    "Cadastre-se",
                    _onClickCadastrar,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ));
  }

  _onClickLogin() {
    if(!_formKey.currentState.validate()) {
      return;
    }

    _formKey.currentState.save();

  }

  void _onClickLoginGoogle() {

  }

  void _onClickCadastrar() {
    
  }
}
