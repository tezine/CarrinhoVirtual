// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eproduct.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EProduct _$EProductFromJson(Map<String, dynamic> json) {
  return EProduct(
    id: json['id'] as String,
    companyID: json['companyID'] as String,
    name: json['name'] as String,
    tags: json['tags'] as String,
    unitPrice: (json['unitPrice'] as num)?.toDouble(),
    description: json['description'] as String,
    creationDateUTC: json['creationDateUTC'] == null
        ? null
        : DateTime.parse(json['creationDateUTC'] as String),
    modificationDateUTC: json['modificationDateUTC'] == null
        ? null
        : DateTime.parse(json['modificationDateUTC'] as String),
    amount: (json['amount'] as num)?.toDouble(),
    totalPrice: (json['totalPrice'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$EProductToJson(EProduct instance) => <String, dynamic>{
      'id': instance.id,
      'companyID': instance.companyID,
      'name': instance.name,
      'tags': instance.tags,
      'unitPrice': instance.unitPrice,
      'description': instance.description,
      'creationDateUTC': instance.creationDateUTC?.toIso8601String(),
      'modificationDateUTC': instance.modificationDateUTC?.toIso8601String(),
      'amount': instance.amount,
      'totalPrice': instance.totalPrice,
    };
