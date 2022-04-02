// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Entry _$EntryFromJson(Map<String, dynamic> json) {
  return _Entry.fromJson(json);
}

/// @nodoc
class _$EntryTearOff {
  const _$EntryTearOff();

  _Entry call(
      {required String id,
      required String journalId,
      required String title,
      required String content,
      required DateTime dateTime}) {
    return _Entry(
      id: id,
      journalId: journalId,
      title: title,
      content: content,
      dateTime: dateTime,
    );
  }

  Entry fromJson(Map<String, Object?> json) {
    return Entry.fromJson(json);
  }
}

/// @nodoc
const $Entry = _$EntryTearOff();

/// @nodoc
mixin _$Entry {
  String get id => throw _privateConstructorUsedError;
  String get journalId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get dateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EntryCopyWith<Entry> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntryCopyWith<$Res> {
  factory $EntryCopyWith(Entry value, $Res Function(Entry) then) =
      _$EntryCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String journalId,
      String title,
      String content,
      DateTime dateTime});
}

/// @nodoc
class _$EntryCopyWithImpl<$Res> implements $EntryCopyWith<$Res> {
  _$EntryCopyWithImpl(this._value, this._then);

  final Entry _value;
  // ignore: unused_field
  final $Res Function(Entry) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? journalId = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? dateTime = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      journalId: journalId == freezed
          ? _value.journalId
          : journalId // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$EntryCopyWith<$Res> implements $EntryCopyWith<$Res> {
  factory _$EntryCopyWith(_Entry value, $Res Function(_Entry) then) =
      __$EntryCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String journalId,
      String title,
      String content,
      DateTime dateTime});
}

/// @nodoc
class __$EntryCopyWithImpl<$Res> extends _$EntryCopyWithImpl<$Res>
    implements _$EntryCopyWith<$Res> {
  __$EntryCopyWithImpl(_Entry _value, $Res Function(_Entry) _then)
      : super(_value, (v) => _then(v as _Entry));

  @override
  _Entry get _value => super._value as _Entry;

  @override
  $Res call({
    Object? id = freezed,
    Object? journalId = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? dateTime = freezed,
  }) {
    return _then(_Entry(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      journalId: journalId == freezed
          ? _value.journalId
          : journalId // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Entry extends _Entry {
  _$_Entry(
      {required this.id,
      required this.journalId,
      required this.title,
      required this.content,
      required this.dateTime})
      : super._();

  factory _$_Entry.fromJson(Map<String, dynamic> json) =>
      _$$_EntryFromJson(json);

  @override
  final String id;
  @override
  final String journalId;
  @override
  final String title;
  @override
  final String content;
  @override
  final DateTime dateTime;

  @override
  String toString() {
    return 'Entry(id: $id, journalId: $journalId, title: $title, content: $content, dateTime: $dateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Entry &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.journalId, journalId) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality().equals(other.dateTime, dateTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(journalId),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(dateTime));

  @JsonKey(ignore: true)
  @override
  _$EntryCopyWith<_Entry> get copyWith =>
      __$EntryCopyWithImpl<_Entry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EntryToJson(this);
  }
}

abstract class _Entry extends Entry {
  factory _Entry(
      {required String id,
      required String journalId,
      required String title,
      required String content,
      required DateTime dateTime}) = _$_Entry;
  _Entry._() : super._();

  factory _Entry.fromJson(Map<String, dynamic> json) = _$_Entry.fromJson;

  @override
  String get id;
  @override
  String get journalId;
  @override
  String get title;
  @override
  String get content;
  @override
  DateTime get dateTime;
  @override
  @JsonKey(ignore: true)
  _$EntryCopyWith<_Entry> get copyWith => throw _privateConstructorUsedError;
}
