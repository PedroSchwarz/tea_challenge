// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'water_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WaterProgress {

 double get totalAmountInMl; double get goalInLiters;
/// Create a copy of WaterProgress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WaterProgressCopyWith<WaterProgress> get copyWith => _$WaterProgressCopyWithImpl<WaterProgress>(this as WaterProgress, _$identity);

  /// Serializes this WaterProgress to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WaterProgress&&(identical(other.totalAmountInMl, totalAmountInMl) || other.totalAmountInMl == totalAmountInMl)&&(identical(other.goalInLiters, goalInLiters) || other.goalInLiters == goalInLiters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalAmountInMl,goalInLiters);

@override
String toString() {
  return 'WaterProgress(totalAmountInMl: $totalAmountInMl, goalInLiters: $goalInLiters)';
}


}

/// @nodoc
abstract mixin class $WaterProgressCopyWith<$Res>  {
  factory $WaterProgressCopyWith(WaterProgress value, $Res Function(WaterProgress) _then) = _$WaterProgressCopyWithImpl;
@useResult
$Res call({
 double totalAmountInMl, double goalInLiters
});




}
/// @nodoc
class _$WaterProgressCopyWithImpl<$Res>
    implements $WaterProgressCopyWith<$Res> {
  _$WaterProgressCopyWithImpl(this._self, this._then);

  final WaterProgress _self;
  final $Res Function(WaterProgress) _then;

/// Create a copy of WaterProgress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalAmountInMl = null,Object? goalInLiters = null,}) {
  return _then(_self.copyWith(
totalAmountInMl: null == totalAmountInMl ? _self.totalAmountInMl : totalAmountInMl // ignore: cast_nullable_to_non_nullable
as double,goalInLiters: null == goalInLiters ? _self.goalInLiters : goalInLiters // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [WaterProgress].
extension WaterProgressPatterns on WaterProgress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WaterProgress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WaterProgress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WaterProgress value)  $default,){
final _that = this;
switch (_that) {
case _WaterProgress():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WaterProgress value)?  $default,){
final _that = this;
switch (_that) {
case _WaterProgress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double totalAmountInMl,  double goalInLiters)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WaterProgress() when $default != null:
return $default(_that.totalAmountInMl,_that.goalInLiters);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double totalAmountInMl,  double goalInLiters)  $default,) {final _that = this;
switch (_that) {
case _WaterProgress():
return $default(_that.totalAmountInMl,_that.goalInLiters);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double totalAmountInMl,  double goalInLiters)?  $default,) {final _that = this;
switch (_that) {
case _WaterProgress() when $default != null:
return $default(_that.totalAmountInMl,_that.goalInLiters);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WaterProgress extends WaterProgress {
  const _WaterProgress({required this.totalAmountInMl, required this.goalInLiters}): super._();
  factory _WaterProgress.fromJson(Map<String, dynamic> json) => _$WaterProgressFromJson(json);

@override final  double totalAmountInMl;
@override final  double goalInLiters;

/// Create a copy of WaterProgress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WaterProgressCopyWith<_WaterProgress> get copyWith => __$WaterProgressCopyWithImpl<_WaterProgress>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WaterProgressToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WaterProgress&&(identical(other.totalAmountInMl, totalAmountInMl) || other.totalAmountInMl == totalAmountInMl)&&(identical(other.goalInLiters, goalInLiters) || other.goalInLiters == goalInLiters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalAmountInMl,goalInLiters);

@override
String toString() {
  return 'WaterProgress(totalAmountInMl: $totalAmountInMl, goalInLiters: $goalInLiters)';
}


}

/// @nodoc
abstract mixin class _$WaterProgressCopyWith<$Res> implements $WaterProgressCopyWith<$Res> {
  factory _$WaterProgressCopyWith(_WaterProgress value, $Res Function(_WaterProgress) _then) = __$WaterProgressCopyWithImpl;
@override @useResult
$Res call({
 double totalAmountInMl, double goalInLiters
});




}
/// @nodoc
class __$WaterProgressCopyWithImpl<$Res>
    implements _$WaterProgressCopyWith<$Res> {
  __$WaterProgressCopyWithImpl(this._self, this._then);

  final _WaterProgress _self;
  final $Res Function(_WaterProgress) _then;

/// Create a copy of WaterProgress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalAmountInMl = null,Object? goalInLiters = null,}) {
  return _then(_WaterProgress(
totalAmountInMl: null == totalAmountInMl ? _self.totalAmountInMl : totalAmountInMl // ignore: cast_nullable_to_non_nullable
as double,goalInLiters: null == goalInLiters ? _self.goalInLiters : goalInLiters // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
