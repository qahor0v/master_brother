import 'package:flutter/material.dart';

class EmployeeCard extends StatelessWidget {
  final String title;
  final String job;
  const EmployeeCard({
    super.key,
    required this.title,
    required this.job,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.person,
        color: Colors.white,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        job,
        style: const TextStyle(
          color: Colors.white70,
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),
      ),
    );
  }
}
