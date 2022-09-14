import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgetbook_challenge/bloc/greet_bloc.dart';
import 'package:widgetbook_challenge/global/constants.dart';
import 'package:widgetbook_challenge/widgets/form_greeting.dart';

/// The app.
class App extends StatelessWidget {
  /// Creates a new instance of [App].
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => greetBloc,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Interview Challenge'),
          ),
          body: const MyApp(),
        ),
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
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<GreetBloc, GreetState>(
      bloc: greetBloc,
      listener: (context, state) {
        if (state is GreetLoaded) {
          name.clear();
          popupService.showSnackBar(
            context: context,
            content: state.greeting,
            isSuccess: true,
          );
        } else if (state is GreetError) {
          popupService.showSnackBar(
            context: context,
            content: state.message,
            isSuccess: false,
          );
        }
      },
      child: FormScreen(
        controller: name,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    greetBloc.close();
  }
}
