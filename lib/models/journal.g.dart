// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: non_constant_identifier_names
_$_Journal _$$_JournalFromJson(Map<String, dynamic> json) => _$_Journal(
      id: json['id'] as String,
      name: json['name'] as String,
      isPrivate: json['isPrivate'] as bool,
      colorValue: json['colorValue'] as int,
      password: json['password'] as String?,
    );

// ignore: non_constant_identifier_names
Map<String, dynamic> _$$_JournalToJson(_$_Journal instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isPrivate': instance.isPrivate,
      'colorValue': instance.colorValue,
      'password': instance.password,
    };
