// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'details_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DetailsState {

 bool get isLoading; int get value;
/// Create a copy of DetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetailsStateCopyWith<DetailsState> get copyWith => _$DetailsStateCopyWithImpl<DetailsState>(this as DetailsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetailsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,value);

@override
String toString() {
  return 'DetailsState(isLoading: $isLoading, value: $value)';
}


}

/// @nodoc
abstract mixin class $DetailsStateCopyWith<$Res>  {
  factory $DetailsStateCopyWith(DetailsState value, $Res Function(DetailsState) _then) = _$DetailsStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, int value
});




}
/// @nodoc
class _$DetailsStateCopyWithImpl<$Res>
    implements $DetailsStateCopyWith<$Res> {
  _$DetailsStateCopyWithImpl(this._self, this._then);

  final DetailsState _self;
  final $Res Function(DetailsState) _then;

/// Create a copy of DetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? value = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DetailsState].
extension DetailsStatePatterns on DetailsState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DetailsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DetailsState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DetailsState value)  $default,){
final _that = this;
switch (_that) {
case _DetailsState():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DetailsState value)?  $default,){
final _that = this;
switch (_that) {
case _DetailsState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  int value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DetailsState() when $default != null:
return $default(_that.isLoading,_that.value);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  int value)  $default,) {final _that = this;
switch (_that) {
case _DetailsState():
return $default(_that.isLoading,_that.value);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  int value)?  $default,) {final _that = this;
switch (_that) {
case _DetailsState() when $default != null:
return $default(_that.isLoading,_that.value);case _:
  return null;

}
}

}

/// @nodoc


class _DetailsState implements DetailsState {
  const _DetailsState({required this.isLoading, required this.value});
  

@override final  bool isLoading;
@override final  int value;

/// Create a copy of DetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetailsStateCopyWith<_DetailsState> get copyWith => __$DetailsStateCopyWithImpl<_DetailsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetailsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,value);

@override
String toString() {
  return 'DetailsState(isLoading: $isLoading, value: $value)';
}


}

/// @nodoc
abstract mixin class _$DetailsStateCopyWith<$Res> implements $DetailsStateCopyWith<$Res> {
  factory _$DetailsStateCopyWith(_DetailsState value, $Res Function(_DetailsState) _then) = __$DetailsStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, int value
});




}
/// @nodoc
class __$DetailsStateCopyWithImpl<$Res>
    implements _$DetailsStateCopyWith<$Res> {
  __$DetailsStateCopyWithImpl(this._self, this._then);

  final _DetailsState _self;
  final $Res Function(_DetailsState) _then;

/// Create a copy of DetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? value = null,}) {
  return _then(_DetailsState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
