import 'package:flutter/material.dart';
import 'package:flutter_login_signup/bloc/signup_bloc.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    final signupBloc = SignupBloc();
    return Scaffold(
      backgroundColor: Color(0xffE2E2EE),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xffE2E2EE),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Let's Get Started!",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Create an account to Q Allure to get All features",
                    style: TextStyle(fontSize: 14, color: Colors.black38),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                StreamBuilder<String>(
                  stream: signupBloc.username,
                  builder: (context, snapshot) => Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      onChanged: signupBloc.usernameChanged,
                      decoration: new InputDecoration(
                        contentPadding: const EdgeInsets.all(14),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.person),
                        hintText: "Username",
                        errorText: snapshot.error,
                        enabledBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                          borderSide: new BorderSide(color: Colors.white),
                        ),
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                          borderSide: new BorderSide(),
                        ),
                      ),
                      validator: (val) {
                        if (val.length == 0) {
                          return "Username cannot be empty";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.text,
                      style: new TextStyle(
                          fontFamily: "Poppins",
                          color: Colors.blue,
                          fontSize: 18),
                    ),
                  ),
                ),
                StreamBuilder<String>(
                  stream: signupBloc.email,
                  builder: (context, snapshot) => Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      onChanged: signupBloc.emailChanged,
                      decoration: new InputDecoration(
                        contentPadding: const EdgeInsets.all(14),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.email),
                        hintText: "Email",
                        errorText: snapshot.error,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                          borderSide: new BorderSide(),
                        ),
                        enabledBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                          borderSide: new BorderSide(color: Colors.white),
                        ),
                      ),
                      validator: (val) {
                        if (val.length == 0) {
                          return "Email cannot be empty";
                        } else if (val.contains('@')) {
                          return "Invalid email address";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      style: new TextStyle(
                          fontFamily: "Poppins",
                          color: Colors.blue,
                          fontSize: 18),
                    ),
                  ),
                ),
                StreamBuilder<String>(
                  stream: signupBloc.phone,
                  builder: (context, snapshot) => Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      onChanged: signupBloc.phoneChanged,
                      decoration: new InputDecoration(
                        contentPadding: const EdgeInsets.all(14),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.phone),
                        hintText: "Phone",
                        errorText: snapshot.error,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                          borderSide: new BorderSide(),
                        ),
                        enabledBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                          borderSide: new BorderSide(color: Colors.white),
                        ),
                      ),
                      validator: (val) {
                        if (val.length == 0) {
                          return "Phone cannot be empty";
                        } else if (val.length < 10) {
                          return "Invalid phone number";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.phone,
                      style: new TextStyle(
                          fontFamily: "Poppins",
                          color: Colors.blue,
                          fontSize: 18),
                    ),
                  ),
                ),
                StreamBuilder<String>(
                  stream: signupBloc.password,
                  builder: (context, snapshot) => Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      onChanged: signupBloc.passwordChanged,
                      decoration: new InputDecoration(
                        contentPadding: const EdgeInsets.all(14),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.lock),
                        hintText: "Password",
                        errorText: snapshot.error,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                          borderSide: new BorderSide(),
                        ),
                        enabledBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                          borderSide: new BorderSide(color: Colors.white),
                        ),
                      ),
                      validator: (val) {
                        if (val.length == 0) {
                          return "Password cannot be empty";
                        } else if (val.length < 8) {
                          return "Password lenght must be greater than 8 chars";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      style: new TextStyle(
                          fontFamily: "Poppins",
                          color: Colors.blue,
                          fontSize: 18),
                    ),
                  ),
                ),
                StreamBuilder<String>(
                  stream: signupBloc.confirmPassword,
                  builder: (context, snapshot) => Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      onChanged: signupBloc.confirmPasswordChanged,
                      decoration: new InputDecoration(
                        contentPadding: const EdgeInsets.all(14),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.lock),
                        hintText: "Confirm Password",
                        errorText: snapshot.error,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                          borderSide: new BorderSide(),
                        ),
                        enabledBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                          borderSide: new BorderSide(color: Colors.white),
                        ),
                      ),
                      validator: (val) {
                        if (val.length == 0) {
                          return "Password cannot be empty";
                        } else if (val.length < 8) {
                          return "Password lenght must be greater than 8 chars";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      style: new TextStyle(
                          fontFamily: "Poppins",
                          color: Colors.blue,
                          fontSize: 18),
                    ),
                  ),
                ),
                StreamBuilder<bool>(
                  stream: signupBloc.submitCheck,
                  builder:(context,snapshot) => Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: RaisedButton(
                      onPressed: snapshot.hasData ? () {} : null,
                      color: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(
                        "CREATE",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "Already have an account?",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          " Login here",
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
