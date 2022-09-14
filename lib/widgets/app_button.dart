// ignore_for_file: public_member_api_docs

import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.onTap,
    this.child = const Text(
      'Submit',
      style: TextStyle(color: Colors.white),
    ),
  }) : super(key: key);
  final dynamic Function(Function, Function, ButtonState)? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ArgonButton(
      height: 40,
      width: 180,
      color: Colors.blue,
      borderRadius: 8,
      loader: Container(
        padding: const EdgeInsets.all(10),
        child: const CircularProgressIndicator(
          color: Colors.white,
          // size: loaderWidth ,
        ),
      ),
      onTap: onTap,
      child: child,
    );
  }
}
