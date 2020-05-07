// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eusercompany.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EUserCompany _$EUserCompanyFromJson(Map<String, dynamic> json) {
  return EUserCompany(
    id: json['id'] as String,
    userId: json['userId'] as String,
    companyId: json['companyId'] as String,
    companyName: json['companyName'] as String,
    creationDateUTC: json['creationDateUTC'] == null
        ? null
        : DateTime.parse(json['creationDateUTC'] as String),
    modificationDateUTC: json['modificationDateUTC'] == null
        ? null
        : DateTime.parse(json['modificationDateUTC'] as String),
  );
}

Map<String, dynamic> _$EUserCompanyToJson(EUserCompany instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'companyId': instance.companyId,
      'companyName': instance.companyName,
      'creationDateUTC': instance.creationDateUTC?.toIso8601String(),
      'modificationDateUTC': instance.modificationDateUTC?.toIso8601String(),
    };
