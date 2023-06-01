class EmployeeModel {
  String login;
  String password;
  String type;

  EmployeeModel({
    required this.login,
    required this.password,
    required this.type,
  });

  Map<String, dynamic> toJson() => {
        "login": login,
        "password": password,
        "type": type,
      };

  EmployeeModel.fromJson(Map<String, dynamic> json)
      : login = json['login'],
        password = json['password'],
        type = json['type'];
}
