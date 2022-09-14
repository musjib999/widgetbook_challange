part of 'greet_bloc.dart';

/// Abstract class of [GreetEvent]
abstract class GreetEvent extends Equatable {
  /// Instance of [GreetEvent]
  const GreetEvent();

  @override
  List<Object> get props => [];
}

/// [GreetUser] event that requires greeting property
class GreetUser extends GreetEvent {
  /// Instance of [GreetUser] event
  const GreetUser({required this.greeting});

  ///Greeting property of type [String]
  final String greeting;

  @override
  List<Object> get props => [greeting];
}

/// [GreetUserError] event that requires error property
class GreetUserError extends GreetEvent {
  /// Instance of [GreetUserError] event
  const GreetUserError({required this.error});

  ///Error property
  final String error;

  @override
  List<Object> get props => [error];
}
