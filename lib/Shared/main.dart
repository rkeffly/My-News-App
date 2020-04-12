import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibe/Services/auth.dart';
import 'package:vibe/models/user.dart';
import 'package:vibe/screens/wrapper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
          child: MaterialApp(
             debugShowCheckedModeBanner: false,
             theme: ThemeData(
               primaryColor: Colors.white,
             ),
       home:  Wrapper(),
      ),
    );
  }
}

