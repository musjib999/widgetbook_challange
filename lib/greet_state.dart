// ignore: lines_longer_than_80_chars
// ignore_for_file: use_setters_to_change_properties, public_member_api_docs, library_private_types_in_public_api

import 'package:mobx/mobx.dart';

part 'greet_state.g.dart';

class Greet = _Greet with _$Greet;

abstract class _Greet with Store {
  @observable
  String message = '';

  @action
  void greetUser(String greetMessage) {
    message = greetMessage;
  }

  @action
  void greetError(String errorMessage) {
    message = errorMessage;
  }
}
