import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgetbook_challenge/bloc/greet_bloc.dart';
import 'package:widgetbook_challenge/widgets/app_button.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({Key? key, required this.name, required this.error})
      : super(key: key);
  final TextEditingController name;
  final String error;

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(microseconds: 100), () {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.warning_amber_outlined, color: Colors.red),
              const SizedBox(width: 5),
              Text(widget.error),
            ],
          ),
        ),
      );
    });
  }

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
              controller: widget.name,
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
                  context.read<GreetBloc>().add(
                        GreetUser(name: widget.name.text),
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
            Text(
              widget.error,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 19, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
