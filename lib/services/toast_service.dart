import 'package:flutter/material.dart';

class ToastService {
  static final GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static void showSuccess(String message) {
    _showToast(message, Colors.green);
  }

  static void showError(String message) {
    _showToast(message, Colors.red);
  }

  static void showInfo(String message) {
    _showToast(message, Colors.blue);
  }

  static void _showToast(String message, Color color) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
    );

    messengerKey.currentState?.showSnackBar(snackBar);
  }
}