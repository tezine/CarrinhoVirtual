// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ecompany.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ECompany _$ECompanyFromJson(Map<String, dynamic> json) {
  return ECompany(
    id: json['id'] as String,
    name: json['name'] as String,
    email: json['email'] as String,
    password: json['password'] as String,
    phone: json['phone'] as String,
    mobile: json['mobile'] as String,
    creationDateUTC: json['creationDateUTC'] == null
        ? null
        : DateTime.parse(json['creationDateUTC'] as String),
    modificationDateUTC: json['modificationDateUTC'] == null
        ? null
        : DateTime.parse(json['modificationDateUTC'] as String),
  );
}

Map<String, dynamic> _$ECompanyToJson(ECompany instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'phone': instance.phone,
      'mobile': instance.mobile,
      'creationDateUTC': instance.creationDateUTC?.toIso8601String(),
      'modificationDateUTC': instance.modificationDateUTC?.toIso8601String(),
    };
