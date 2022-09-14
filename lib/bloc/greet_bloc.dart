import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'greet_event.dart';
part 'greet_state.dart';

/// [GreetBloc] class
class GreetBloc extends Bloc<GreetEvent, GreetState> {
  /// Instance of [GreetBloc] event that listens for [GreetEvent], [GreetUser]
  ///  and [GreetUserError]
  GreetBloc() : super(GreetInitial()) {
    on<GreetEvent>((event, emit) {
      emit.call(GreetInitial());
    });
    on<GreetUser>((event, emit) {
      emit.call(GreetLoaded(greeting: event.greeting));
    });
    on<GreetUserError>((event, emit) {
      emit.call(const GreetError(message: 'Error While Greeting user'));
    });
  }
}
