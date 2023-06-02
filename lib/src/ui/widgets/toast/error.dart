import 'package:flutter/material.dart';

SnackBar errorSnackBar(String message) {
  return SnackBar(
    backgroundColor: Colors.red,
    content: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),
      ),
    ),
  );
}
