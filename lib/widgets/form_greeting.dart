import 'package:flutter/material.dart';
import 'package:widgetbook_challenge/global/constants.dart';
import 'package:widgetbook_challenge/widgets/app_button.dart';

/// [FormScreen] class which contains a textfield and a button
class FormScreen extends StatelessWidget {
  /// Instance of [FormScreen] which requires a controller
  const FormScreen({Key? key, required this.controller}) : super(key: key);

  /// [FormScreen] property which is a [TextEditingController]
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    final nameRegExp = RegExp('[a-zA-Z]');
    final _formKey = GlobalKey<FormState>();
    return Form(
      key: _formKey,
      child: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: controller,
              validator: (value) => value!.isEmpty
                  ? 'Enter Your Name'
                  : (nameRegExp.hasMatch(value)
                      ? null
                      : 'Name cannot be a number'),
              decoration: const InputDecoration(
                hintText: 'Enter Name',
                prefixIcon: Icon(Icons.person_outline),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 15),
            AppButton(
              onTap: (startLoading, stopLoading, btnState) async {
                if (_formKey.currentState!.validate()) {
                  startLoading();
                  await greetService.greet(
                    name: controller.text,
                    context: context,
                  );
                  stopLoading();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
