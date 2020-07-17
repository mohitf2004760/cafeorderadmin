import 'dart:convert';
import 'package:cafeorderadmin/models/order.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cafeorderadmin/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:cafeorderadmin/models/cartItem.dart';
import 'package:cafeorderadmin/models/item.dart';
import 'package:cafeorderadmin/models/status-change.dart';



class DatabaseService {

  final String uid;

  DatabaseService ({this.uid});
  //collection reference
  final CollectionReference usersProfileCollection = Firestore.instance.collection('usersProfile');
  final CollectionReference ordersCollection = Firestore.instance.collection('orders');




  Future<List<Order>> getOrders() async {
    List<Order> ordersList = [];
    QuerySnapshot querySnapshot = await ordersCollection.getDocuments();
    for (int i = 0; i < querySnapshot.documents.length; i++) {
      var a = querySnapshot.documents[i];
      Map m1 = a.data['cart'];
      Cart cart = Cart.fromJson(m1);
      print(cart.toJson());

//      print('${a.data['cart']}');
//      print('${a.documentID}');
/* Do not delete bahut mehnat se likha tha, haalanki kisi use ka nahin hai  -
      Map m1 = a.data['cart'];
      String uid = m1['uid'];
      List <dynamic> ci_list_dynamic = m1['cartItemList'];
      List<CartItem> ci_list = List<CartItem>();
      ci_list_dynamic.map((element){
        Map m = element['item'];
        Item item = Item(name:m['name'],price: m['price'],item_id: m['item_id']);
        int qty = element['qty'];
        ci_list.add(CartItem(item: item,qty: qty));
      });

      Cart cart = Cart(
        uid:uid,
        cartItemList: ci_list
      );

      print('-----------------------');
      print(cart.cartItemList);
      print('-----------------------');

*/
      ordersList.add(Order(
        cart:cart,
        totalamount: a.data['totalamount'],
        status:a.data['status'],
        timestamp: a.data['timestamp'].toString(),
      ));
    }
    return ordersList;
  }
}