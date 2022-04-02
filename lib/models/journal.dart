import 'package:freezed_annotation/freezed_annotation.dart';

part 'journal.freezed.dart';
part 'journal.g.dart';

@freezed
class Journal with _$Journal {
  const Journal._();

  factory Journal({
    required String id,
    required String userId,
    required String name,
    required bool isPrivate,
    required int colorValue,
    String? password,
  }) = _Journal;

  factory Journal.fromJson(Map<String, dynamic> json) =>
      _$JournalFromJson(json);
}
