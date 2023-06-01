// ignore_for_file: unrelated_type_equality_checks
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:master_brother/src/ui/screens/who_is.dart';
import 'package:master_brother/src/ui/widgets/helper_box/sized_box.dart';
import 'package:master_brother/src/ui/widgets/loadings/auth_loading.dart';
import 'package:master_brother/src/ui/widgets/text_field.dart';
import 'package:master_brother/src/utils/constants/app_colors.dart';
import 'package:master_brother/src/repo/models/employee_model.dart';
import 'package:master_brother/src/utils/constants/employees.dart';

class LoginPage extends HookConsumerWidget {
  static const String id = "6767q";

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final whoIs = useState<Employee>(Employee.all.first);
    final loginController =
        useState<TextEditingController>(TextEditingController());
    final passwordController =
        useState<TextEditingController>(TextEditingController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HBox(48.0),
              const Center(
                child: Icon(
                  IconlyLight.lock,
                  color: mainColor,
                  size: 100,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 32.0,
                ),
                child: Center(
                  child: Text(
                    "Kirish",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              HBox(24.0),
              WhoIsWidget(whoIs: whoIs),
              HBox(16.0),
              MyTextField(
                controller: loginController.value,
                title: "Login",
              ),
              HBox(16.0),
              MyTextField(
                controller: passwordController.value,
                title: "Parol",
              ),
              HBox(16.0),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AuthLoadingWidget(
                      model: EmployeeModel(
                          login: loginController.value.text.trim(),
                          password: passwordController.value.text.trim(),
                          type: whoIs.value.id),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(
                    left: 44,
                    right: 44,
                  ),
                  decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.circular(
                      36.0,
                    ),
                  ),
                  width: double.infinity,
                  padding: const EdgeInsets.all(12.0),
                  child: const Center(
                    child: Text(
                      "Kirish",
                      style: TextStyle(
                        color: bgColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              HBox(32.0),
              const Padding(
                padding: EdgeInsets.only(
                  left: 48,
                  right: 48,
                  bottom: 48.0,
                ),
                child: Center(
                  child: Text(
                    "Agarda login yoki parolingizni\nunutgan bo'lsangiz\ndirektorga murojaat qiling!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
