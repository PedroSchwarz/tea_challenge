// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FoodProgress {

 double get calories; double get carbs; double get protein; double get fat;
/// Create a copy of FoodProgress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FoodProgressCopyWith<FoodProgress> get copyWith => _$FoodProgressCopyWithImpl<FoodProgress>(this as FoodProgress, _$identity);

  /// Serializes this FoodProgress to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FoodProgress&&(identical(other.calories, calories) || other.calories == calories)&&(identical(other.carbs, carbs) || other.carbs == carbs)&&(identical(other.protein, protein) || other.protein == protein)&&(identical(other.fat, fat) || other.fat == fat));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,calories,carbs,protein,fat);

@override
String toString() {
  return 'FoodProgress(calories: $calories, carbs: $carbs, protein: $protein, fat: $fat)';
}


}

/// @nodoc
abstract mixin class $FoodProgressCopyWith<$Res>  {
  factory $FoodProgressCopyWith(FoodProgress value, $Res Function(FoodProgress) _then) = _$FoodProgressCopyWithImpl;
@useResult
$Res call({
 double calories, double carbs, double protein, double fat
});




}
/// @nodoc
class _$FoodProgressCopyWithImpl<$Res>
    implements $FoodProgressCopyWith<$Res> {
  _$FoodProgressCopyWithImpl(this._self, this._then);

  final FoodProgress _self;
  final $Res Function(FoodProgress) _then;

/// Create a copy of FoodProgress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? calories = null,Object? carbs = null,Object? protein = null,Object? fat = null,}) {
  return _then(_self.copyWith(
calories: null == calories ? _self.calories : calories // ignore: cast_nullable_to_non_nullable
as double,carbs: null == carbs ? _self.carbs : carbs // ignore: cast_nullable_to_non_nullable
as double,protein: null == protein ? _self.protein : protein // ignore: cast_nullable_to_non_nullable
as double,fat: null == fat ? _self.fat : fat // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [FoodProgress].
extension FoodProgressPatterns on FoodProgress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FoodProgress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FoodProgress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FoodProgress value)  $default,){
final _that = this;
switch (_that) {
case _FoodProgress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FoodProgress value)?  $default,){
final _that = this;
switch (_that) {
case _FoodProgress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double calories,  double carbs,  double protein,  double fat)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FoodProgress() when $default != null:
return $default(_that.calories,_that.carbs,_that.protein,_that.fat);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double calories,  double carbs,  double protein,  double fat)  $default,) {final _that = this;
switch (_that) {
case _FoodProgress():
return $default(_that.calories,_that.carbs,_that.protein,_that.fat);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double calories,  double carbs,  double protein,  double fat)?  $default,) {final _that = this;
switch (_that) {
case _FoodProgress() when $default != null:
return $default(_that.calories,_that.carbs,_that.protein,_that.fat);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FoodProgress implements FoodProgress {
  const _FoodProgress({required this.calories, required this.carbs, required this.protein, required this.fat});
  factory _FoodProgress.fromJson(Map<String, dynamic> json) => _$FoodProgressFromJson(json);

@override final  double calories;
@override final  double carbs;
@override final  double protein;
@override final  double fat;

/// Create a copy of FoodProgress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FoodProgressCopyWith<_FoodProgress> get copyWith => __$FoodProgressCopyWithImpl<_FoodProgress>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FoodProgressToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FoodProgress&&(identical(other.calories, calories) || other.calories == calories)&&(identical(other.carbs, carbs) || other.carbs == carbs)&&(identical(other.protein, protein) || other.protein == protein)&&(identical(other.fat, fat) || other.fat == fat));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,calories,carbs,protein,fat);

@override
String toString() {
  return 'FoodProgress(calories: $calories, carbs: $carbs, protein: $protein, fat: $fat)';
}


}

/// @nodoc
abstract mixin class _$FoodProgressCopyWith<$Res> implements $FoodProgressCopyWith<$Res> {
  factory _$FoodProgressCopyWith(_FoodProgress value, $Res Function(_FoodProgress) _then) = __$FoodProgressCopyWithImpl;
@override @useResult
$Res call({
 double calories, double carbs, double protein, double fat
});




}
/// @nodoc
class __$FoodProgressCopyWithImpl<$Res>
    implements _$FoodProgressCopyWith<$Res> {
  __$FoodProgressCopyWithImpl(this._self, this._then);

  final _FoodProgress _self;
  final $Res Function(_FoodProgress) _then;

/// Create a copy of FoodProgress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? calories = null,Object? carbs = null,Object? protein = null,Object? fat = null,}) {
  return _then(_FoodProgress(
calories: null == calories ? _self.calories : calories // ignore: cast_nullable_to_non_nullable
as double,carbs: null == carbs ? _self.carbs : carbs // ignore: cast_nullable_to_non_nullable
as double,protein: null == protein ? _self.protein : protein // ignore: cast_nullable_to_non_nullable
as double,fat: null == fat ? _self.fat : fat // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
