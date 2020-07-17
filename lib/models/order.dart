import 'package:cafeorderadmin/models/cart.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cafeorderadmin/models/status-change.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
part 'order.g.dart';


@JsonSerializable(explicitToJson: true)
class Order{
  Cart cart;
  List<StatusChange> logOfStatusChange;
  String status;
  String timestamp;
  int totalamount;
  Order({this.cart, this.logOfStatusChange, this.status,this.timestamp, this.totalamount});

  /*
  Order.fromJson(Map<String, dynamic> json)
      : cart = json['cart'],
        logOfStatusChange = json['logOfStatusChange'],
        status = json['status'],
        timestamp = json['timestamp'],
        totalamount = json['totalamount'];

  Map toJson() => {
    'cart': cart,
    'logOfStatusChange': logOfStatusChange,
    'status':status,
    'timestamp':timestamp,
    'totalamount':totalamount,
  };
   */

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
  Map<String, dynamic> toJson() => _$OrderToJson(this);

}