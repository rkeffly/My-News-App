import 'package:flutter/material.dart';
import 'package:vibe/Services/auth.dart';
import 'package:vibe/Shared/loading.dart';

class Signin extends StatefulWidget {

  final Function toggleView;
  Signin({this.toggleView});


  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
 final AuthService _auth =AuthService();
 final _formkey = GlobalKey<FormState>();
 bool loading = false;


 String email ='';
 String password ='';
 String error ='';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading(): Scaffold(
      resizeToAvoidBottomPadding: false,
       appBar: AppBar(
          backgroundColor: Colors.green,
          elevation: 0.0,
         actions: <Widget>[
          FlatButton.icon(
           label: Text('Sign in'),
           icon: Icon(Icons.person),
           onPressed: (){
          widget.toggleView();
          },
          )
           
        ],
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 120.0, 0.0, 0.0),
                  child: Text(
                    'SignUp',
                    style:
                        TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(265, 120.0, 0.0, 0.0),
                  child: Text(
                    '.',
                    style: TextStyle(
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                )
              ],
            ),
          ),
          Container
          (padding: EdgeInsets.only(top: 35.0, left: 18.0, right: 20.0),
            child: Form(
              key: _formkey,    
              child: Column(
                children: <Widget>[
                  TextFormField(
                    validator: (val) => val.isEmpty? 'Enter an email' : null,
                    onChanged: (val){
                      setState(()=> email = val);
                    },
                    decoration: InputDecoration(
                        labelText: 'EMAIL',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        // hintText: 'EMAIL',
                        // hintStyle: ,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    validator: (val) => val.length <6? 'Enter a password 6+ characters long' : null,
                    onChanged: (val){
                      setState(()=> password=val);
                    },
                    decoration: InputDecoration(
                        labelText: 'PASSWORD ',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                    obscureText: true,
                  ),
                  SizedBox(height: 50.0),
                  Container(
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.greenAccent,
                        color: Colors.green,
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: ()async{
                        if(_formkey.currentState.validate()){
                          setState(()=> loading = true);
                        dynamic result =await _auth.signInWithEmailAndPassword(email, password);
                        if(result==null){
                          setState((){
                             error='could not sign in with those credentials.';
                             loading=false;
                          });
                        }
                        }
                          },
                          child: Center(
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                        ),
                      )),
                       SizedBox(height: 10.0),
                    Text(
                      error,
                    style: TextStyle(color: Colors.red, fontSize: 12.0),
                    ),
                  
          // SizedBox(height: 15.0),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     Text(
          //       'New to Spotify?',
          //       style: TextStyle(
          //         fontFamily: 'Montserrat',
          //       ),
          //     ),
          //     SizedBox(width: 5.0),
          //     InkWell(
          //       child: Text('Register',
          //           style: TextStyle(
          //               color: Colors.green,
          //               fontFamily: 'Montserrat',
          //               fontWeight: FontWeight.bold,
          //               decoration: TextDecoration.underline)),
          //     )
          //   ],
          // )
        ])))]));
  }
}
