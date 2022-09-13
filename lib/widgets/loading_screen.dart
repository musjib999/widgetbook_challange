// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:widgetbook_challenge/widgets/app_button.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key, required this.name}) : super(key: key);
  final TextEditingController name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: name,
            decoration: const InputDecoration(
              hintText: 'Enter Name',
              prefixIcon: Icon(Icons.person_outline),
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 15),
          AppButton(
            onTap: (startLoading, stopLoading, btnState) async {},
            child: const Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
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
    );
  }
}
