// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cartItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItem _$CartItemFromJson(Map<String, dynamic> json) {
  return CartItem(
    item: json['item'] == null
        ? null
        : Item.fromJson(json['item'] as Map<String, dynamic>),
    qty: json['qty'] as int,
  );
}

Map<String, dynamic> _$CartItemToJson(CartItem instance) => <String, dynamic>{
      'item': instance.item?.toJson(),
      'qty': instance.qty,
    };
