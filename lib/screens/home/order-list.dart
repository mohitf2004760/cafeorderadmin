import 'package:cafeorderadmin/models/order.dart';
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
  //final _ordersList = List<String>.generate(20, (i) => "Item ${i + 1}");
  List<Order> _ordersList;

  void _getOrders () async{
    Future<List<Order>> futureOrders = _db.getOrders(); //first make the query
    futureOrders.then((data){
      List<Order> orders = new List<Order>();
      for(int i = 0; i < data.length; i++) {
        //print(data[i].name);
        orders.add(data[i]);
      }
      setState(() {
        _ordersList = orders; //then setState and rebuild the widget
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    if(_ordersList == null){
      _getOrders();
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
    body:
      ListView.builder(
        itemCount: _ordersList.length,
        itemBuilder: (context, index) {
          final order = _ordersList[index];
          //return ListTile(title: Text('${items[index]}'));
          return Dismissible(
            // Each Dismissible must contain a Key. Keys allow Flutter to
            // uniquely identify widgets.
            key: UniqueKey(),
            // Provide a function that tells the app
            // what to do after an item has been swiped away.
            onDismissed: (direction) {
              // Remove the item from the data source.
              setState(() {
                _ordersList.removeAt(index);
              });

              // Show a snackbar. This snackbar could also contain "Undo" actions.
              Scaffold
                  .of(context)
                  .showSnackBar(SnackBar(content: Text("${order} dismissed")));
            },
            background: Container(color: Colors.red),
            child: ListTile(title: Text('${order.cart.cartItemList[1].item.name}')),
            //child: ListTile(title: Text('${order.toString()}')),
          );
        },
      ));
  }
}
