import 'dart:async';

mixin Validators {
  var emailValidators =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains('@')) {
      sink.add(email);
    } else {
      sink.addError("Invalid email address");
    }
  });

  var passwordValidators = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 6) {
      sink.add(password);
    } else {
      sink.addError("Password length should be greater than 6 chars");
    }
  });
}
