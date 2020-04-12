import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibe/models/user.dart';
import 'package:vibe/screens/Authenticate/authenticate.dart';
import 'package:vibe/screens/Home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    
    if(user == null){
      return Authenticate();
    }else{
      return Home();
    }
  }
}