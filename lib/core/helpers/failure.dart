import 'package:flutter/material.dart';

void showError(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}

class Failure {
  final String message;

  Failure(this.message);

  @override
  String toString() => message;
}
