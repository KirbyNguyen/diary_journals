// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: non_constant_identifier_names
_$_Entry _$$_EntryFromJson(Map<String, dynamic> json) => _$_Entry(
      id: json['id'] as String,
      journalId: json['journalId'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      dateTime: DateTime.parse(json['dateTime'] as String),
    );

// ignore: non_constant_identifier_names
Map<String, dynamic> _$$_EntryToJson(_$_Entry instance) => <String, dynamic>{
      'id': instance.id,
      'journalId': instance.journalId,
      'title': instance.title,
      'content': instance.content,
      'dateTime': instance.dateTime.toIso8601String(),
    };
