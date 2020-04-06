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