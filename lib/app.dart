import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgetbook_challenge/bloc/greet_bloc.dart';
import 'package:widgetbook_challenge/widgets/error_screen.dart';
import 'package:widgetbook_challenge/widgets/initial_screen.dart';
import 'package:widgetbook_challenge/widgets/loading_screen.dart';
import 'package:widgetbook_challenge/widgets/success_screen.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';
GreetBloc greetBloc = GreetBloc();

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
    return BlocBuilder<GreetBloc, GreetState>(
      bloc: greetBloc,
      builder: (context, state) {
        if (state is GreetInitial) {
          return InitialScreen(name: name);
        } else if (state is GreetLoading) {
          return LoadingScreen(name: name);
        } else if (state is GreetError) {
          return ErrorScreen(name: name, error: state.message);
        }
        final message = state as GreetDone;
        return SuccessScreen(name: name, greeting: message.greeting);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    greetBloc.close();
  }
}
