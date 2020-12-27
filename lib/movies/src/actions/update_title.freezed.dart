// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of update_title;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$UpdateTitleTearOff {
  const _$UpdateTitleTearOff();

// ignore: unused_element
  _UpdateTitle call(String title) {
    return _UpdateTitle(
      title,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $UpdateTitle = _$UpdateTitleTearOff();

/// @nodoc
mixin _$UpdateTitle {
  String get title;

  $UpdateTitleCopyWith<UpdateTitle> get copyWith;
}

/// @nodoc
abstract class $UpdateTitleCopyWith<$Res> {
  factory $UpdateTitleCopyWith(
          UpdateTitle value, $Res Function(UpdateTitle) then) =
      _$UpdateTitleCopyWithImpl<$Res>;
  $Res call({String title});
}

/// @nodoc
class _$UpdateTitleCopyWithImpl<$Res> implements $UpdateTitleCopyWith<$Res> {
  _$UpdateTitleCopyWithImpl(this._value, this._then);

  final UpdateTitle _value;
  // ignore: unused_field
  final $Res Function(UpdateTitle) _then;

  @override
  $Res call({
    Object title = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed ? _value.title : title as String,
    ));
  }
}

/// @nodoc
abstract class _$UpdateTitleCopyWith<$Res>
    implements $UpdateTitleCopyWith<$Res> {
  factory _$UpdateTitleCopyWith(
          _UpdateTitle value, $Res Function(_UpdateTitle) then) =
      __$UpdateTitleCopyWithImpl<$Res>;
  @override
  $Res call({String title});
}

/// @nodoc
class __$UpdateTitleCopyWithImpl<$Res> extends _$UpdateTitleCopyWithImpl<$Res>
    implements _$UpdateTitleCopyWith<$Res> {
  __$UpdateTitleCopyWithImpl(
      _UpdateTitle _value, $Res Function(_UpdateTitle) _then)
      : super(_value, (v) => _then(v as _UpdateTitle));

  @override
  _UpdateTitle get _value => super._value as _UpdateTitle;

  @override
  $Res call({
    Object title = freezed,
  }) {
    return _then(_UpdateTitle(
      title == freezed ? _value.title : title as String,
    ));
  }
}

/// @nodoc
class _$_UpdateTitle implements _UpdateTitle {
  const _$_UpdateTitle(this.title) : assert(title != null);

  @override
  final String title;

  @override
  String toString() {
    return 'UpdateTitle(title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UpdateTitle &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(title);

  @override
  _$UpdateTitleCopyWith<_UpdateTitle> get copyWith =>
      __$UpdateTitleCopyWithImpl<_UpdateTitle>(this, _$identity);
}

abstract class _UpdateTitle implements UpdateTitle {
  const factory _UpdateTitle(String title) = _$_UpdateTitle;

  @override
  String get title;
  @override
  _$UpdateTitleCopyWith<_UpdateTitle> get copyWith;
}
