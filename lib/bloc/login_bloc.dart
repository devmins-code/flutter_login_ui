import 'dart:async';
import 'package:flutter_login_signup/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends Object with Validators implements LoginBaseBloc {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Function(String) get emailChanged => _emailController.sink.add;
  Function(String) get passwordChanged => _passwordController.sink.add;

Stream<String> get email => _emailController.stream.transform(emailValidators);
Stream<String> get password => _passwordController.stream.transform(passwordValidators);
Stream<bool> get submitCheck => Observable.combineLatest2(email, password, (e,p)=>true);

  @override
  void dispose() {
    _emailController?.close();
    _passwordController?.close();
  }
}

abstract class LoginBaseBloc {
  void dispose();
}
