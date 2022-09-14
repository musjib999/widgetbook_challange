import 'package:flutter/material.dart';

/// [PopupService] class
class PopupService {
  /// function that displays a snackbar
  void showSnackBar({
    required BuildContext context,
    required String content,
    required bool isSuccess,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              isSuccess == true ? Icons.done : Icons.warning,
              color: isSuccess == true ? Colors.green : Colors.red,
            ),
            const SizedBox(width: 5),
            Text(content),
          ],
        ),
      ),
    );
  }
}
