import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc with Validators {
  final _email = BehaviorSubject();
  final _password = BehaviorSubject();

  Stream<bool> get submitValid =>
      Rx.combineLatest2(email, password, (e, p) => true);

  // Add data to stream
  Stream<String> get email => _email.stream.transform(validateEmail);

  Stream<String> get password => _password.stream.transform(validatePassword);

  // Change data
  Function(String) get changeEmail => _email.sink.add;

  Function(String) get changePassword => _password.sink.add;

  submit() {
    final validEmail = _email.value;
    final validPassword = _password.value;

    print('this is the valid email $validEmail');
    print('this is the valid password $validPassword');

  }

  dispose() {
    _email.close();
    _password.close();
  }
}
