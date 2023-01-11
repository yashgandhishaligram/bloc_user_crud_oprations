
class LoginModel {
  String? email;
  String? password;

  LoginModel({
      required this.email,
      required this.password});

  LoginModel.fromJson(dynamic json) {
    email = json['email'];
    password = json['password'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    return map;
  }

}