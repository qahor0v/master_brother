import 'dart:developer';

 import 'package:firedart/firestore/firestore.dart';
import 'package:firedart/firestore/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:master_brother/src/repo/models/product_model.dart';
import 'package:master_brother/src/utils/constants/employee_model.dart';
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

  Future<List<EmployeeModel>> getAllEmployees() async {
    final db = await Firestore.instance.collection('employees').get();
    List<EmployeeModel> employees = [];
    for (var emps in db) {
      employees.add(
        EmployeeModel(
          login: emps['login'],
          password: emps['password'],
          type: emps['type'],
        ),
      );
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

  Future<Page<Document>>
      getAllProducts() async {
    final db = Firestore.instance.collection('products');
    final result = await db.get();
    return result;
  }
}

class ProductServices {
  static Future<bool> addNewProduct(ProductModel product) async {
    bool status = false;
    try {
      final db = Firestore.instance.collection('products');
      await db.add(product.toJson()).then((value) {
        status = true;
      });
    } catch (e) {
      log("Error:", error: e);
    }
    return status;
  }

  static Future<List<ProductModel>> getAllProducts() async {
    List<ProductModel> list = [];
    final db = Firestore.instance.collection('products');
    final result = await db.get();
    for (final item in result) {
      list.add(
        ProductModel(
          name: item['name'],
          id: item['id'],
          price: item['price'],
        ),
      );
    }
    return list;
  }
}
