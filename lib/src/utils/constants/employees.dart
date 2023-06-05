// ignore_for_file: constant_identifier_names

class Employee {
  String name;
  String id;

  Employee({
    required this.name,
    required this.id,
  });

  static List<Employee> all = [
    Employee(name: "Direktor", id: "main"),
    Employee(name: "Admin", id: "admin"),
    Employee(name: "Sotuvchi", id: "seller"),
    Employee(name: "Ishlab chiqaruvchi xodim", id: "creator"),
    Employee(name: "Omborxona Xodimi", id: "sklad"),
  ];

  static List<Employee> adminEmployees = [
    Employee(name: "Sotuvchi", id: "seller"),
    Employee(name: "Ishlab chiqaruvchi xodim", id: "creator"),
    Employee(name: "Omborxona Xodimi", id: "sklad"),
  ];

  static List<Employee> directorEmployees = [
    Employee(name: "Admin", id: "admin"),
    Employee(name: "Sotuvchi", id: "seller"),
    Employee(name: "Ishlab chiqaruvchi xodim", id: "creator"),
    Employee(name: "Omborxona Xodimi", id: "sklad"),
  ];

  static const String admin = 'admin';
  static const String director = 'main';
  static const String seller = 'seller';
  static const String creator = 'creator';
  static const String sclad = 'sklad';
}

enum EmployeeType {
  DIRECTOR,
  ADMIN,
  SELLER,
  CREATOR,
  SCLAD,
}

Employee type(EmployeeType type) {
  switch (type) {
    case EmployeeType.DIRECTOR:
      return Employee.all[0];
    case EmployeeType.ADMIN:
      return Employee.all[1];
    case EmployeeType.SELLER:
      return Employee.all[2];
    case EmployeeType.CREATOR:
      return Employee.all[3];
    case EmployeeType.SCLAD:
      return Employee.all[4];
  }
}

EmployeeType employe(Employee employee) {
  if (employee.id == "main") {
    return EmployeeType.DIRECTOR;
  } else if (employee.id == "admin") {
    return EmployeeType.ADMIN;
  } else if (employee.id == "seller") {
    return EmployeeType.SELLER;
  } else if (employee.id == "creator") {
    return EmployeeType.CREATOR;
  } else {
    return EmployeeType.SCLAD;
  }
}
