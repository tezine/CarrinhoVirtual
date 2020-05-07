// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'esearch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ESearch _$ESearchFromJson(Map<String, dynamic> json) {
  return ESearch(
    id: json['id'] as String,
    text: json['text'] as String,
    creationDateUTC: json['creationDateUTC'] == null
        ? null
        : DateTime.parse(json['creationDateUTC'] as String),
  );
}

Map<String, dynamic> _$ESearchToJson(ESearch instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'creationDateUTC': instance.creationDateUTC?.toIso8601String(),
    };
