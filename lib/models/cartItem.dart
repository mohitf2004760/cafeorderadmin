import 'package:cafeorderadmin/models/item.dart';
import 'package:json_annotation/json_annotation.dart';
part 'cartItem.g.dart';

@JsonSerializable(explicitToJson: true)
class CartItem{
  Item item;
  int qty;
  CartItem({this.item,this.qty});
/*
  CartItem.fromJson(Map<String, dynamic> json)
      : item = json['item'],
        qty = json['qty'];

  Map toJson() => {
    'item': item,
    'qty': qty,
  };
 */

  factory CartItem.fromJson(Map<String, dynamic> json) => _$CartItemFromJson(json);
  Map<String, dynamic> toJson() => _$CartItemToJson(this);

}

