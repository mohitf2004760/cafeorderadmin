import 'package:cafeorderadmin/screens/home/order-list.dart';
import 'package:cafeorderadmin/services/database.dart';
import 'package:flutter/material.dart';
import 'package:cafeorderadmin/services/auth.dart';


class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final AuthService _auth = AuthService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Cafe Order Admin'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: [
            FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon:Icon(Icons.person),
              label:Text('logout'),
            ),
            ]
      ),
      body:OrdersList(),
    );
  }
}