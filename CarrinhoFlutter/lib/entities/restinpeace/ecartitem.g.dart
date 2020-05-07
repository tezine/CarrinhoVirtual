// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ecartitem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ECartItem _$ECartItemFromJson(Map<String, dynamic> json) {
  return ECartItem(
    id: json['id'] as String,
    name: json['name'] as String,
    amount: (json['amount'] as num)?.toDouble(),
    unitPrice: (json['unitPrice'] as num)?.toDouble(),
    totalPrice: (json['totalPrice'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$ECartItemToJson(ECartItem instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'amount': instance.amount,
      'unitPrice': instance.unitPrice,
      'totalPrice': instance.totalPrice,
    };
