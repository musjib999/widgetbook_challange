part of 'greet_bloc.dart';

abstract class GreetState extends Equatable {
  const GreetState();

  @override
  List<Object> get props => [];
}

class GreetInitial extends GreetState {}

class GreetLoading extends GreetState {}

class GreetDone extends GreetState {
  const GreetDone({required this.greeting});
  final String greeting;

  @override
  List<Object> get props => [greeting];
}

class GreetError extends GreetState {
  const GreetError({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
