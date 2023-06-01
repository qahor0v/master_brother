import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:master_brother/src/ui/widgets/helper_widgets/app_button.dart';
import 'package:master_brother/src/ui/widgets/helper_widgets/app_textfield.dart';
import 'package:master_brother/src/utils/constants/app_colors.dart';
import 'package:master_brother/src/utils/constants/employees.dart';

class AddEmployeePageAdmin extends HookConsumerWidget {
  const AddEmployeePageAdmin({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final selectedEmployee = useState(Employee.adminEmployees.last);
    final login = useState(TextEditingController());
    final password = useState(TextEditingController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0.8,
        title: const Text("Xodim Qo'shish"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 8.0,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Kim bu?",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            backgroundColor: Colors.transparent,
                            child: Container(
                              padding: const EdgeInsets.only(
                                top: 8.0,
                                bottom: 8.0,
                                left: 16,
                                right: 16,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: kBgColor,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: List.generate(
                                  Employee.adminEmployees.length,
                                  (index) {
                                    return GestureDetector(
                                      onTap: () {
                                        selectedEmployee.value =
                                            Employee.adminEmployees[index];
                                        Navigator.pop(context);
                                      },
                                      child: SizedBox(
                                        height: 32,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            Employee.adminEmployees[index].name,
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: SizedBox(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                selectedEmployee.value.name,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.white,
                                size: 30,
                              )
                            ],
                          ),
                          Container(
                            width: 200,
                            height: 1,
                            color: Colors.white70,
                            margin: const EdgeInsets.only(top: 4),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16.0),
              AppTextField(
                controller: login.value,
                title: "Login",
              ),
              AppTextField(
                controller: password.value,
                title: "Parol",
              ),
              const SizedBox(height: 8.0),
              AppButton(
                onTap: () {},
                title: "Qo'shish",
              )
            ],
          ),
        ),
      ),
    );
  }
}


