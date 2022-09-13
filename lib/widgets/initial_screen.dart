// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgetbook_challenge/bloc/greet_bloc.dart';
import 'package:widgetbook_challenge/widgets/app_button.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({Key? key, required this.name}) : super(key: key);
  final TextEditingController name;

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
              controller: name,
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
                  context.read<GreetBloc>().add(
                        GreetUser(name: name.text),
                      );
                }
              },
            ),
            const SizedBox(height: 15),
            const Divider(),
            const SizedBox(height: 15),
            const Text(
              'Greeting Message',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 19,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
