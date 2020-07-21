import 'package:cafeorderadmin/models/custom-order.dart';
import 'package:cafeorderadmin/models/order.dart';
import 'package:cafeorderadmin/models/user.dart';
import 'package:flutter/material.dart';
import 'package:cafeorderadmin/services/auth.dart';
import 'package:cafeorderadmin/services/database.dart';
/*
class OrdersList extends StatefulWidget {
  @override
  _OrdersListState createState() => _OrdersListState();
}

class _OrdersListState extends State<OrdersList> {

  final AuthService _auth = AuthService();
  final DatabaseService _db = DatabaseService();

  //final _ordersList = List<String>.generate(20, (i) => "Item ${i + 1}");
  List<CustomOrder> _customOrdersList;


  void _getOrders () {
    Future<List<Order>> futureOrders = _db.getOrders(); //first make the query
    futureOrders.then((data){
      List<CustomOrder> customorders = new List<CustomOrder>();
      for(int i = 0; i < data.length; i++) {
        //print(data[i].name);
        //orders.add(data[i]);
        /*Additional for custom order */
        Future futureData = _db.getUserData(data[i].cart.uid);
        futureData.then((doc){
          _customOrdersList.add(CustomOrder(order:data[i],userName: doc.name));
        });
      }
      setState(() {
        _customOrdersList = customorders; //then setState and rebuild the widget
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

    if(_customOrdersList == null){
      _getOrders();
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
        body:
        ListView.builder(
          itemCount: _customOrdersList.length,
          itemBuilder: (context, index) {
            final customOrder = _customOrdersList[index];

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
                  _customOrdersList.removeAt(index);
                });

                // Show a snackbar. This snackbar could also contain "Undo" actions.
                Scaffold
                    .of(context)
                    .showSnackBar(SnackBar(content: Text("${customOrder} dismissed")));
              },
              background: Container(color: Colors.red),
              child: ListTile(title: Text('${customOrder.order.cart.cartItemList[0].item.name}',),
                subtitle: Text('${customOrder.userName}'),),
              //child: ListTile(title: Text('${order.toString()}')),
            );
          },
        ));
  }
}
*/