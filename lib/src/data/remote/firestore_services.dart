 import 'package:firedart/firestore/firestore.dart';
import 'package:firedart/firestore/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:master_brother/src/repo/models/product_model.dart';
import 'package:master_brother/src/repo/models/employee_model.dart';
import 'package:master_brother/src/utils/constants/employees.dart';

class AppFirestore {
  Ref ref;

  AppFirestore(this.ref);

  Future<List<EmployeeModel>> getEmployees(Employee employee) async {
    final db = await Firestore.instance.collection('employees').get();
    List<EmployeeModel> employees = [];
    for (final emps in db) {
      if (emps['type'] == employee.id) {
        employees.add(
          EmployeeModel(
            login: emps['login'],
            password: emps['password'],
            type: emps['type'],
          ),
        );
      }
    }
    return employees;
  }

  Future<List<EmployeeModel>> getAllEmployees(bool useAdmin) async {
    final db = await Firestore.instance.collection('employees').get();
    List<EmployeeModel> employees = [];
    for (var emps in db) {
      if (!useAdmin) {
        if (emps['type'] != 'admin') {
          employees.add(
            EmployeeModel(
              login: emps['login'],
              password: emps['password'],
              type: emps['type'],
            ),
          );
        }
      } else {
        employees.add(
          EmployeeModel(
            login: emps['login'],
            password: emps['password'],
            type: emps['type'],
          ),
        );
      }
    }
    return employees;
  }

  Future<bool> addEmployee(EmployeeModel employee) async {
    int counter = 0;
    final alls = await getEmployees(Employee(name: "name", id: employee.type));
    bool status = false;
    final db = Firestore.instance.collection('employees');
    for (var item in alls) {
      if (item.login == employee.login) {
        counter++;
      }
    }

    if (counter == 0) {
      await db.add({
        "login": employee.login,
        "password": employee.password,
        "type": employee.type
      }).then((value) {
        status = true;
      });
    } else {
      status = false;
    }
    return status;
  }

  Future<bool> addNewProduct(ProductModel product) async {
    bool status = false;
    final db = Firestore.instance.collection('products');
    await db.add(product.toJson()).then((value) {
      status = true;
    });
    return status;
  }

  Future<Page<Document>> getAllProducts() async {
    final db = Firestore.instance.collection('products');
    final result = await db.get();
    return result;
  }
}
