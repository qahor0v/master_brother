import 'package:firedart/firestore/firestore.dart';
import 'package:master_brother/src/repo/models/customer_model.dart';

class CustomerServices {
  static Future<List<CustomerModel>> getAllCustomers() async {
    final db = await Firestore.instance.collection('customers').get();
    List<CustomerModel> customers = [];
    for (var item in db) {
      customers.add(
        CustomerModel(
          id: item['id'],
          name: item['name'],
          phoneNumber: item['phoneNumber'],
          address: item['address'],
        ),
      );
    }
    return customers;
  }






}
