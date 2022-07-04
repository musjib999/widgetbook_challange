// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'greet_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Greet on _Greet, Store {
  late final _$messageAtom = Atom(name: '_Greet.message', context: context);

  @override
  String get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  late final _$_GreetActionController =
      ActionController(name: '_Greet', context: context);

  @override
  void greetUser(String greetMessage) {
    final _$actionInfo =
        _$_GreetActionController.startAction(name: '_Greet.greetUser');
    try {
      return super.greetUser(greetMessage);
    } finally {
      _$_GreetActionController.endAction(_$actionInfo);
    }
  }

  @override
  void greetError(String errorMessage) {
    final _$actionInfo =
        _$_GreetActionController.startAction(name: '_Greet.greetError');
    try {
      return super.greetError(errorMessage);
    } finally {
      _$_GreetActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
message: ${message}
    ''';
  }
}
