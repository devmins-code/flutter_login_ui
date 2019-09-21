import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login_signup/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.redAccent,
          brightness: Brightness.light),
      debugShowCheckedModeBanner: false,
      title: "DUMMY LOGIN PAGE",
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    //change status bar color
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Color(0xffE2E2EE), //or set color with: Color(0xFF0000FF)
    ));

    return Scaffold(
      backgroundColor: Color(0xffE2E2EE),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xffE2E2EE),
      ),
      //body: SignupPage(),
      body: LoginPage(),
    );
  }
}
