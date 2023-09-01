class LoginModel {
  String email;
  String password;

  LoginModel(this.email, this.password);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data["username"] = email;
    data["password"] = password;

    return data;
  }
}
