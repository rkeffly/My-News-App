import 'package:flutter/material.dart';
import 'package:vibe/screens/Authenticate/register.dart';
import 'package:vibe/screens/Authenticate/signin.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showLogin =true;
  void toggleView(){
    setState(() => showLogin= !showLogin);
  }
  @override
  Widget build(BuildContext context) {
    if (showLogin){
      return Signup(toggleView: toggleView);
    }else{
      return Signin(toggleView: toggleView);
    }
    
  }
}