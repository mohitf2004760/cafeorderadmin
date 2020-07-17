import 'package:cafeorderadmin/screens/authenticate/sign-in.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cafeorderadmin/models/user.dart';


import 'home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    if(user == null) {
      return SignIn();
    } else{
      return Home();
    }
  }
}
