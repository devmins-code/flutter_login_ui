import 'package:flutter_login_signup/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class SignupBloc extends Object with Validators implements SignupBaseBloc {
  final _usernameController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  final _phoneController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _confirmPasswordController = BehaviorSubject<String>();

  Stream<String> get username =>
      _usernameController.stream.transform(usernameValidators);
  Stream<String> get phone =>
      _phoneController.stream.transform(phoneValidators);
  Stream<String> get email =>
      _emailController.stream.transform(emailValidators);
  Stream<String> get password =>
      _passwordController.stream.transform(passwordValidators);
  Stream<String> get confirmPassword =>
      _confirmPasswordController.stream.transform(passwordValidators);

  Stream<bool> get submitCheck => Observable.combineLatest5(
          username, phone, email, password, confirmPassword,
          (c_username, c_phone, c_email, c_password, c_confirmpassword) {
        print("username ${c_username.toString()}");
        print("phone ${c_phone.toString()}");
        print("email ${c_email.toString()}");
        print("password ${c_password.toString()}");
        print("confirm password ${c_confirmpassword.toString()}");

        if (c_password == c_confirmpassword) {
          return true;
        } else {
          _confirmPasswordController.sink.addError("Password mismatched");
          return false;
        }
      });

  Function(String) get usernameChanged => _usernameController.sink.add;
  Function(String) get phoneChanged => _phoneController.sink.add;
  Function(String) get emailChanged => _emailController.sink.add;
  Function(String) get passwordChanged => _passwordController.sink.add;
  Function(String) get confirmPasswordChanged =>
      _confirmPasswordController.sink.add;

  @override
  void dispose() {
    _usernameController.close();
    _emailController.close();
    _phoneController.close();
    _passwordController.close();
    _confirmPasswordController.close();
  }
}

abstract class SignupBaseBloc {
  void dispose();
}
