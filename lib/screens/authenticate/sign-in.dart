import 'package:cafeorderadmin/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:cafeorderadmin/shared/constants.dart';


class SignIn extends StatefulWidget {

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return /*loading ? Loading() : */Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          title:Text('Sign in - Cafe Order Chef'),
          actions: [],
        ),
        body: Container(
            padding : EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
              key:_formKey,
              child: Column(
                children: [
                  SizedBox(height: 20.0,),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Email'),
                    validator: (val) => val.isEmpty? 'Enter an email' : null,
                    onChanged: (val){
                      setState(() => email = val);
                    },
                  ),
                  SizedBox(height: 20.0,),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Password'),
                    validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                    obscureText: true,
                    onChanged: (val){
                      setState(() => password = val);
                    },
                  ),
                  SizedBox(height: 20.0,),
                  RaisedButton(
                      color: Colors.pink[400],
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                      onPressed: () async {
                        if(_formKey.currentState.validate()){
                          dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                          if(result == null){
                            setState(() {
                              error = 'could not sign in with those credentials';
                            });
                          }else{
                            print('loggedin');
                          }
                        }
                      }
                  ),
                  SizedBox(height: 12.0,),
                  Text(
                    '$error',
                    style: TextStyle(
                      color:Colors.red,
                      fontSize: 14.0,
                    ),
                  )
                ],
              ),
            )
        )
    );
  }
}