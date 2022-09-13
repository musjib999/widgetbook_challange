// ignore_for_file: public_member_api_docs

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:widgetbook_challenge/api/widgetbook_api.dart';

part 'greet_event.dart';
part 'greet_state.dart';

class GreetBloc extends Bloc<GreetEvent, GreetState> {
  GreetBloc() : super(GreetInitial()) {
    on<GreetEvent>((event, emit) async {
      if (event is GreetUser) {
        emit.call(GreetLoading());
        try {
          final api = WidgetbookApi();
          final greeting = await api.welcomeToWidgetbook(message: event.name);
          emit.call(GreetDone(greeting: greeting));
        } catch (_) {
          emit.call(const GreetError(message: 'An Error Occured'));
        }
      }
    });
  }
}
