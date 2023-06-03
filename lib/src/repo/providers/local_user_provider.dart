import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:master_brother/src/repo/models/employee_model.dart';

final localUser = StateProvider<EmployeeModel?>((ref) {
  return null;
});
