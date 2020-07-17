import 'package:cafeorderadmin/models/cartItem.dart';
import 'package:json_annotation/json_annotation.dart';
part 'cart.g.dart';

@JsonSerializable(explicitToJson: true)
class Cart{
  String uid;
  List<CartItem> cartItemList;
  Cart({this.uid,this.cartItemList});
/*
  Cart.fromJson(Map<String, dynamic> json)
      : uid = json['uid'],
        cartItemList = json['cartItemList'];

  Map toJson() => {
    'uid': uid,
    'cartItemList': cartItemList,
  };
 */
  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
  Map<String, dynamic> toJson() => _$CartToJson(this);

}