import 'package:cafeorderadmin/dev-poc/swipe-poc.dart';
import 'package:cafeorderadmin/screens/wrapper.dart';
import 'package:cafeorderadmin/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return StreamProvider<User>.value(
        value:AuthService().user,
        child:MaterialApp(
          home: Wrapper(),
        )
    );

    /* Meant for  doing little POC etc
    return MaterialApp(
      home:ItemsList()
    );*/

  }


}
