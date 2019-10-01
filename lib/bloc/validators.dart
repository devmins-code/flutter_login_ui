import 'dart:async';

mixin Validators {

var usernameValidators =
      StreamTransformer<String, String>.fromHandlers(handleData: (username, sink) {
    if (username.length>2) {
      sink.add(username);
    } else {
      sink.addError("Invalid username!");
    }
  });

  var phoneValidators =
      StreamTransformer<String, String>.fromHandlers(handleData: (phone, sink) {
    if (phone.length >= 10 && phone.length <= 15) {
      sink.add(phone);
    } else {
      sink.addError("Invalid phone no.!");
    }
  });

  var emailValidators =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains('@')) {
      sink.add(email);
    } else {
      sink.addError("Invalid email address!");
    }
  });

  var passwordValidators = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 6) {
      sink.add(password);
    } else {
      sink.addError("Password length should be greater than 6 chars!");
    }
  });
}
