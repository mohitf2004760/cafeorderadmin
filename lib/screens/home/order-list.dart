import 'package:cafeorderadmin/models/custom-order.dart';
import 'package:cafeorderadmin/models/order.dart';
import 'package:cafeorderadmin/models/user.dart';
import 'package:flutter/material.dart';
import 'package:cafeorderadmin/services/auth.dart';
import 'package:cafeorderadmin/services/database.dart';

class OrdersList extends StatefulWidget {
  @override
  _OrdersListState createState() => _OrdersListState();
}

class _OrdersListState extends State<OrdersList> {

  final AuthService _auth = AuthService();
  final DatabaseService _db = DatabaseService();
  Future<List<Order>> _listFuture;

  Future<List<Order>> getList() async {
    return _db.getOrders(); //change this to update and get orders
  }

  String getStringForListOfCartItems(List list){

    String str = '';
    list.forEach((element) {
      str = str + element.qty.toString() + " " + element.item.name + "   |   ";
    });
    return str;

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listFuture = getList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _listFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final orders = snapshot.data;
            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context,index){
                final order = orders[index];
                 return Dismissible(
                     key: UniqueKey(),
                     child: Container(
                       decoration: BoxDecoration(
                         border: Border.all(
                           color: Colors.grey,
                           width: 2.0,
                         ),
                         borderRadius: BorderRadius.circular(12),
                         color:Colors.indigo[50],
                       ),
                       child: ListTile(
                         title:UserName(orderItem: order,),
                         subtitle: Text('${getStringForListOfCartItems(order.cart.cartItemList)}',
                         style: TextStyle(
                             fontWeight: FontWeight.bold,
                           fontSize: 20.0,
                         ),),
                       ),
                     ),);
              }
            );
          } else {
            return Center(
                child:CircularProgressIndicator()
            );
          }
        }
    );
  }
}

class UserName extends StatefulWidget {

  final Order orderItem;
  UserName({this.orderItem});

  @override
  _UserNameState createState() => _UserNameState();
}

class _UserNameState extends State<UserName> {
  final DatabaseService _db = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _db.getUserData(widget.orderItem.cart.uid),
        builder: (context,snapshot){
          if (snapshot.hasData) {
            return ListTile(
              title: Text('${snapshot.data.name}',
              style: TextStyle(
                fontSize: 30.0
              ),),
            );
          }
          else {
            return CircularProgressIndicator(
              strokeWidth: 1.0,
            );
          }
        },
      );
  }
}
