class EmployeeModel {
  String login;
  String password;
  String type;
  String docID;

  EmployeeModel({
    required this.login,
    required this.password,
    required this.type,
    this.docID = '',
  });

  Map<String, dynamic> toJson() => {
        "login": login,
        "password": password,
        "type": type,
        "docID": docID,
      };

  EmployeeModel.fromJson(Map<String, dynamic> json)
      : login = json['login'],
        password = json['password'],
        docID = json['docID'],
        type = json['type'];
}
