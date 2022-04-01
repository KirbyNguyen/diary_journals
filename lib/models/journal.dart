import 'package:freezed_annotation/freezed_annotation.dart';

part 'journal.freezed.dart';
part 'journal.g.dart';

@freezed
abstract class Journal with _$Journal {
  const factory Journal({
    required String id,
    required String name,
    required bool isPrivate,
    required int colorValue,
    String? password,
  }) = _Journal;

  factory Journal.fromJson(Map<String, dynamic> json) =>
      _$JournalFromJson(json);
}
