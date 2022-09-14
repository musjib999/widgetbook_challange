part of 'greet_bloc.dart';

///Abstract class of [GreetState]
abstract class GreetState extends Equatable {
  /// Instance of [GreetState] state
  const GreetState();

  @override
  List<Object> get props => [];
}

/// [GreetInitial] state class
class GreetInitial extends GreetState {}

/// [GreetLoaded] state
class GreetLoaded extends GreetState {
  /// Instance of [GreetLoaded] state which reqiures a greeting message
  const GreetLoaded({required this.greeting});

  /// Greeting property
  final String greeting;

  @override
  List<Object> get props => [greeting];
}

/// [GreetError] state
class GreetError extends GreetState {
  /// Instance of [GreetError] state which reqiures an error
  const GreetError({required this.message});

  /// error message property
  final String message;

  @override
  List<Object> get props => [message];
}
