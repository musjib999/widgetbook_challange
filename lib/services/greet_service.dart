import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgetbook_challenge/api/widgetbook_api.dart';
import 'package:widgetbook_challenge/bloc/greet_bloc.dart';

/// [GreetService] class
class GreetService {
  /// Function that greets the user which require a name as parameter
  Future greet({required String name, required BuildContext context}) async {
    try {
      final api = WidgetbookApi();
      final greeting = await api.welcomeToWidgetbook(message: name);
      context.read<GreetBloc>().add(GreetUser(greeting: greeting));
    } catch (_) {
      context.read<GreetBloc>().add(
            const GreetUserError(error: 'An Error Occured'),
          );
    }
  }
}
