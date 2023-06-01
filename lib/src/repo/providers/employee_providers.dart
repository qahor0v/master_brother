import 'dart:developer';
import 'package:master_brother/src/data/local/local_db_services.dart';
import 'package:master_brother/src/data/remote/firestore_services.dart';
import 'package:master_brother/src/repo/models/employee_model.dart';
import 'package:master_brother/src/utils/constants/employees.dart';
import 'package:riverpod/riverpod.dart';

final authProvider = FutureProvider.family((ref, EmployeeModel model) async {
  int count = 0;
  final allEmployees = await AppFirestore(ref).getEmployees(
    Employee(
      name: model.login,
      id: model.type,
    ),
  );
  for (final emp in allEmployees) {
    log(emp.login);
    if (model.password == emp.password && model.login == emp.login) {
      LocalDB().addUserToLocal(model).then((value) {
        log("Saved");
      });
      count++;
      break;
    }
  }
  if (count == 0) {
    return false;
  } else {
    return true;
  }
});

final addEmployee = FutureProvider.family((ref, EmployeeModel model) async {
  final result = await AppFirestore(ref).addEmployee(model);
  return result;
});

final getAllEmployeesPfrovider = FutureProvider((ref) async {
  final result = await AppFirestore(ref).getAllEmployees();
  return result;
});

final getLocalUserProvider = FutureProvider((ref) async {
  final res = await LocalDB().getUserFromLocal();
  return res;
});
