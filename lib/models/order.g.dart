// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) {
  return Order(
    cart: json['cart'] == null
        ? null
        : Cart.fromJson(json['cart'] as Map<String, dynamic>),
    logOfStatusChange: (json['logOfStatusChange'] as List)
        ?.map((e) =>
            e == null ? null : StatusChange.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    status: json['status'] as String,
    timestamp: json['timestamp'] as String,
    totalamount: json['totalamount'] as int,
  );
}

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'cart': instance.cart?.toJson(),
      'logOfStatusChange':
          instance.logOfStatusChange?.map((e) => e?.toJson())?.toList(),
      'status': instance.status,
      'timestamp': instance.timestamp,
      'totalamount': instance.totalamount,
    };
