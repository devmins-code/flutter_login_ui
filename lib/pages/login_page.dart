import 'package:flutter/material.dart';
import 'package:flutter_login_signup/bloc/login_bloc.dart';
import 'home_page.dart';
import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  double _width;
  double _height;


  @override
  void initState() {

    super.initState();
  }

  void navigateToSecondPage(BuildContext context){
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => HomePage()
      ));
    }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    print(_height);

    final loginBloc = LoginBloc();

    

    return Container(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset("login_bg.png",height: (_width / 2.0),width: (_width / 2.0),),
              Text(
                "Welcome back!",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 12),
                child: Text(
                  "Log in to your existant account of Q Allure!",
                  style: TextStyle(fontSize: 14, color: Colors.black38),
                ),
              ),
              StreamBuilder<String>(
                stream: loginBloc.email,
                builder:(context,snapshot) => Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    onChanged: loginBloc.emailChanged,
                    decoration: new InputDecoration(
                      contentPadding: const EdgeInsets.all(16),
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
                        borderSide: new BorderSide(
                            color: Colors.white
                        ),
                      ),
                    ),
                    validator: (val) {
                      if (val.length == 0) {
                        return "Email cannot be empty";
                      } else if(val.contains('@')){
                        return "Invalid email address";
                      }else{
                        return null;
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    style: new TextStyle(
                        fontFamily: "Poppins",
                        color: Colors.blue,
                        fontSize: 18
                    ),
                  ),
                ),
              ),
              StreamBuilder<String>(
                stream: loginBloc.password,
                builder:(context,snapshot)=> Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    onChanged: loginBloc.passwordChanged,
                    decoration: new InputDecoration(
                      contentPadding: const EdgeInsets.all(16),
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
                        borderSide: new BorderSide(
                            color: Colors.white
                        ),
                      ),
                    ),
                    validator: (val) {
                      if (val.length == 0) {
                        return "Password cannot be empty";
                      } else if(val.length < 8){
                        return "Password lenght must be greater than 8 chars";
                      }else{
                        return null;
                      }
                    },
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    style: new TextStyle(
                        fontFamily: "Poppins",
                        color: Colors.blue,
                        fontSize: 18
                    ),
                  ),
                ),
              ),

              InkWell(
                onTap: (){
                  //todo forgot password logic here...
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Spacer(),
                      Text("Forgot password?",style: TextStyle(color: Colors.black),)
                    ],
                  ),
                ),
              ),
              StreamBuilder<bool>(
                stream: loginBloc.submitCheck,
                builder:(context,snapshot)=> Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: RaisedButton(
                    onPressed: snapshot.hasData ? () {
                      navigateToSecondPage(context);
                    } : null,
                    color: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    child: Text("LOGIN",style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text("Or Connect using",style: TextStyle(color: Colors.black38),),
              SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: RaisedButton(
                      onPressed: () {

                      },
                      color: Colors.blue,
                      padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.favorite,color: Colors.white,size: 18,),
                          SizedBox(width: 6),
                          Text("facebook",style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 4,),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: RaisedButton(
                      onPressed: () {},
                      color: Colors.red,
                      padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.favorite,color: Colors.white,size: 18,),
                          SizedBox(width: 6,),
                          Text("google",style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ),

                ],
              ),

              InkWell(
                onTap: (){

                  Navigator.push(context, MaterialPageRoute(
                   builder: (context){
                     return SignupPage();
                   }
                  ));
                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text("Don't have an account?",style: TextStyle(fontWeight: FontWeight.bold),),
                      Text(" Signup here",style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
