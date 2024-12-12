import 'package:flutter/material.dart';

// class SuccessSnackbar extends StatelessWidget {
//   final String message;
//   final Duration duration;

//   const SuccessSnackbar({
//     super.key,
//     required this.message,
//     this.duration = const Duration(seconds: 3),
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SnackBar(
//       content: Text(message),
//       backgroundColor: Colors.green,
//       duration: duration,
//     );
//   }
// }

void showSuccess(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
