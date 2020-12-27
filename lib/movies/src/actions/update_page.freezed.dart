// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of update_page;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$UpdatePageTearOff {
  const _$UpdatePageTearOff();

// ignore: unused_element
  _UpdatePage call(int page) {
    return _UpdatePage(
      page,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $UpdatePage = _$UpdatePageTearOff();

/// @nodoc
mixin _$UpdatePage {
  int get page;

  $UpdatePageCopyWith<UpdatePage> get copyWith;
}

/// @nodoc
abstract class $UpdatePageCopyWith<$Res> {
  factory $UpdatePageCopyWith(
          UpdatePage value, $Res Function(UpdatePage) then) =
      _$UpdatePageCopyWithImpl<$Res>;
  $Res call({int page});
}

/// @nodoc
class _$UpdatePageCopyWithImpl<$Res> implements $UpdatePageCopyWith<$Res> {
  _$UpdatePageCopyWithImpl(this._value, this._then);

  final UpdatePage _value;
  // ignore: unused_field
  final $Res Function(UpdatePage) _then;

  @override
  $Res call({
    Object page = freezed,
  }) {
    return _then(_value.copyWith(
      page: page == freezed ? _value.page : page as int,
    ));
  }
}

/// @nodoc
abstract class _$UpdatePageCopyWith<$Res> implements $UpdatePageCopyWith<$Res> {
  factory _$UpdatePageCopyWith(
          _UpdatePage value, $Res Function(_UpdatePage) then) =
      __$UpdatePageCopyWithImpl<$Res>;
  @override
  $Res call({int page});
}

/// @nodoc
class __$UpdatePageCopyWithImpl<$Res> extends _$UpdatePageCopyWithImpl<$Res>
    implements _$UpdatePageCopyWith<$Res> {
  __$UpdatePageCopyWithImpl(
      _UpdatePage _value, $Res Function(_UpdatePage) _then)
      : super(_value, (v) => _then(v as _UpdatePage));

  @override
  _UpdatePage get _value => super._value as _UpdatePage;

  @override
  $Res call({
    Object page = freezed,
  }) {
    return _then(_UpdatePage(
      page == freezed ? _value.page : page as int,
    ));
  }
}

/// @nodoc
class _$_UpdatePage implements _UpdatePage {
  const _$_UpdatePage(this.page) : assert(page != null);

  @override
  final int page;

  @override
  String toString() {
    return 'UpdatePage(page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UpdatePage &&
            (identical(other.page, page) ||
                const DeepCollectionEquality().equals(other.page, page)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(page);

  @override
  _$UpdatePageCopyWith<_UpdatePage> get copyWith =>
      __$UpdatePageCopyWithImpl<_UpdatePage>(this, _$identity);
}

abstract class _UpdatePage implements UpdatePage {
  const factory _UpdatePage(int page) = _$_UpdatePage;

  @override
  int get page;
  @override
  _$UpdatePageCopyWith<_UpdatePage> get copyWith;
}
