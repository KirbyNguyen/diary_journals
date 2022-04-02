import 'package:freezed_annotation/freezed_annotation.dart';

part 'entry.freezed.dart';
part 'entry.g.dart';

@freezed
class Entry with _$Entry {
  const Entry._();

  factory Entry({
    required String id,
    required String journalId,
    required String title,
    required String content,
    required DateTime dateTime,
  }) = _Entry;

  factory Entry.fromJson(Map<String, dynamic> json) => _$EntryFromJson(json);
}
