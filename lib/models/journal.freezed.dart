// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'journal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Journal _$JournalFromJson(Map<String, dynamic> json) {
  return _Journal.fromJson(json);
}

/// @nodoc
class _$JournalTearOff {
  const _$JournalTearOff();

  _Journal call(
      {required String id,
      required String name,
      required bool isPrivate,
      required int colorValue,
      String? password}) {
    return _Journal(
      id: id,
      name: name,
      isPrivate: isPrivate,
      colorValue: colorValue,
      password: password,
    );
  }

  Journal fromJson(Map<String, Object?> json) {
    return Journal.fromJson(json);
  }
}

/// @nodoc
const $Journal = _$JournalTearOff();

/// @nodoc
mixin _$Journal {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get isPrivate => throw _privateConstructorUsedError;
  int get colorValue => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JournalCopyWith<Journal> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JournalCopyWith<$Res> {
  factory $JournalCopyWith(Journal value, $Res Function(Journal) then) =
      _$JournalCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      bool isPrivate,
      int colorValue,
      String? password});
}

/// @nodoc
class _$JournalCopyWithImpl<$Res> implements $JournalCopyWith<$Res> {
  _$JournalCopyWithImpl(this._value, this._then);

  final Journal _value;
  // ignore: unused_field
  final $Res Function(Journal) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? isPrivate = freezed,
    Object? colorValue = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isPrivate: isPrivate == freezed
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as bool,
      colorValue: colorValue == freezed
          ? _value.colorValue
          : colorValue // ignore: cast_nullable_to_non_nullable
              as int,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$JournalCopyWith<$Res> implements $JournalCopyWith<$Res> {
  factory _$JournalCopyWith(_Journal value, $Res Function(_Journal) then) =
      __$JournalCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      bool isPrivate,
      int colorValue,
      String? password});
}

/// @nodoc
class __$JournalCopyWithImpl<$Res> extends _$JournalCopyWithImpl<$Res>
    implements _$JournalCopyWith<$Res> {
  __$JournalCopyWithImpl(_Journal _value, $Res Function(_Journal) _then)
      : super(_value, (v) => _then(v as _Journal));

  @override
  _Journal get _value => super._value as _Journal;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? isPrivate = freezed,
    Object? colorValue = freezed,
    Object? password = freezed,
  }) {
    return _then(_Journal(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isPrivate: isPrivate == freezed
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as bool,
      colorValue: colorValue == freezed
          ? _value.colorValue
          : colorValue // ignore: cast_nullable_to_non_nullable
              as int,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Journal implements _Journal {
  const _$_Journal(
      {required this.id,
      required this.name,
      required this.isPrivate,
      required this.colorValue,
      this.password});

  factory _$_Journal.fromJson(Map<String, dynamic> json) =>
      _$$_JournalFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final bool isPrivate;
  @override
  final int colorValue;
  @override
  final String? password;

  @override
  String toString() {
    return 'Journal(id: $id, name: $name, isPrivate: $isPrivate, colorValue: $colorValue, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Journal &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.isPrivate, isPrivate) &&
            const DeepCollectionEquality()
                .equals(other.colorValue, colorValue) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(isPrivate),
      const DeepCollectionEquality().hash(colorValue),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$JournalCopyWith<_Journal> get copyWith =>
      __$JournalCopyWithImpl<_Journal>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_JournalToJson(this);
  }
}

abstract class _Journal implements Journal {
  const factory _Journal(
      {required String id,
      required String name,
      required bool isPrivate,
      required int colorValue,
      String? password}) = _$_Journal;

  factory _Journal.fromJson(Map<String, dynamic> json) = _$_Journal.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  bool get isPrivate;
  @override
  int get colorValue;
  @override
  String? get password;
  @override
  @JsonKey(ignore: true)
  _$JournalCopyWith<_Journal> get copyWith =>
      throw _privateConstructorUsedError;
}
