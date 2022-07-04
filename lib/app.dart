import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:widgetbook_challenge/api/widgetbook_api.dart';
import 'package:widgetbook_challenge/greet_state.dart';

/// The app.
class App extends StatelessWidget {
  /// Creates a new instance of [App].
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Interview Challenge'),
        ),
        body: const MyApp(),
      ),
    );
  }
}

// ignore: public_member_api_docs
class MyApp extends StatefulWidget {
  // ignore: public_member_api_docs
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final api = WidgetbookApi();
  final name = TextEditingController();
  static final RegExp nameRegExp = RegExp('[a-zA-Z]');
  final _formKey = GlobalKey<FormState>();
  final greet = Greet();
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
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
              ArgonButton(
                height: 40,
                width: 180,
                color: Colors.blue,
                borderRadius: 8,
                onTap: (startLoading, stopLoading, btnState) async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      final response =
                          await api.welcomeToWidgetbook(message: name.text);
                      greet.greetUser(response);
                    } on UnexpectedException catch (e) {
                      greet.greetUser('An Error occured >>> ${e.toString()}');
                    }
                  }
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
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
              Text(
                greet.message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 19,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
