part of 'greet_bloc.dart';

abstract class GreetEvent extends Equatable {
  const GreetEvent();

  @override
  List<Object> get props => [];
}

class GreetUser extends GreetEvent {
  const GreetUser({required this.name});
  final String name;

  @override
  List<Object> get props => [name];
}
