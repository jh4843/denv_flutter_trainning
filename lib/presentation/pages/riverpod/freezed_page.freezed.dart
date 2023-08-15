// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezed_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FreezedPage {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FreezedPageCopyWith<FreezedPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FreezedPageCopyWith<$Res> {
  factory $FreezedPageCopyWith(
          FreezedPage value, $Res Function(FreezedPage) then) =
      _$FreezedPageCopyWithImpl<$Res, FreezedPage>;
  @useResult
  $Res call({String title, String description});
}

/// @nodoc
class _$FreezedPageCopyWithImpl<$Res, $Val extends FreezedPage>
    implements $FreezedPageCopyWith<$Res> {
  _$FreezedPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FreezedPageCopyWith<$Res>
    implements $FreezedPageCopyWith<$Res> {
  factory _$$_FreezedPageCopyWith(
          _$_FreezedPage value, $Res Function(_$_FreezedPage) then) =
      __$$_FreezedPageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String description});
}

/// @nodoc
class __$$_FreezedPageCopyWithImpl<$Res>
    extends _$FreezedPageCopyWithImpl<$Res, _$_FreezedPage>
    implements _$$_FreezedPageCopyWith<$Res> {
  __$$_FreezedPageCopyWithImpl(
      _$_FreezedPage _value, $Res Function(_$_FreezedPage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
  }) {
    return _then(_$_FreezedPage(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FreezedPage implements _FreezedPage {
  const _$_FreezedPage({required this.title, required this.description});

  @override
  final String title;
  @override
  final String description;

  @override
  String toString() {
    return 'FreezedPage(title: $title, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FreezedPage &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FreezedPageCopyWith<_$_FreezedPage> get copyWith =>
      __$$_FreezedPageCopyWithImpl<_$_FreezedPage>(this, _$identity);
}

abstract class _FreezedPage implements FreezedPage {
  const factory _FreezedPage(
      {required final String title,
      required final String description}) = _$_FreezedPage;

  @override
  String get title;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$_FreezedPageCopyWith<_$_FreezedPage> get copyWith =>
      throw _privateConstructorUsedError;
}
