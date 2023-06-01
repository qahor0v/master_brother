import 'dart:convert';
import 'package:master_brother/src/utils/constants/employee_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDB {
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  Future<EmployeeModel?> getUserFromLocal() async {
    final SharedPreferences preferences = await prefs;
    try {
      final data = preferences.getString('user');
      final model = jsonDecode(data ?? '');
      return EmployeeModel.fromJson(model);
    } catch (e) {
      return null;
    }
  }

  Future<bool> addUserToLocal(EmployeeModel model) async {
    final SharedPreferences preferences = await prefs;
    final data =
        await preferences.setString('user', jsonEncode(model.toJson()));
    return data;
  }

  Future<bool> logout() async {
    bool status = false;
    final SharedPreferences preferences = await prefs;
    preferences.clear().then((value) {
      status = value;
    });
    return status;
  }
}
