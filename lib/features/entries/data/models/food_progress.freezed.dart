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

 double get totalCalories; double get totalCarbs; double get totalProtein; double get totalFat; double get caloriesGoal; double get carbsGoal; double get proteinGoal; double get fatGoal;
/// Create a copy of FoodProgress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FoodProgressCopyWith<FoodProgress> get copyWith => _$FoodProgressCopyWithImpl<FoodProgress>(this as FoodProgress, _$identity);

  /// Serializes this FoodProgress to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FoodProgress&&(identical(other.totalCalories, totalCalories) || other.totalCalories == totalCalories)&&(identical(other.totalCarbs, totalCarbs) || other.totalCarbs == totalCarbs)&&(identical(other.totalProtein, totalProtein) || other.totalProtein == totalProtein)&&(identical(other.totalFat, totalFat) || other.totalFat == totalFat)&&(identical(other.caloriesGoal, caloriesGoal) || other.caloriesGoal == caloriesGoal)&&(identical(other.carbsGoal, carbsGoal) || other.carbsGoal == carbsGoal)&&(identical(other.proteinGoal, proteinGoal) || other.proteinGoal == proteinGoal)&&(identical(other.fatGoal, fatGoal) || other.fatGoal == fatGoal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalCalories,totalCarbs,totalProtein,totalFat,caloriesGoal,carbsGoal,proteinGoal,fatGoal);

@override
String toString() {
  return 'FoodProgress(totalCalories: $totalCalories, totalCarbs: $totalCarbs, totalProtein: $totalProtein, totalFat: $totalFat, caloriesGoal: $caloriesGoal, carbsGoal: $carbsGoal, proteinGoal: $proteinGoal, fatGoal: $fatGoal)';
}


}

/// @nodoc
abstract mixin class $FoodProgressCopyWith<$Res>  {
  factory $FoodProgressCopyWith(FoodProgress value, $Res Function(FoodProgress) _then) = _$FoodProgressCopyWithImpl;
@useResult
$Res call({
 double totalCalories, double totalCarbs, double totalProtein, double totalFat, double caloriesGoal, double carbsGoal, double proteinGoal, double fatGoal
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
@pragma('vm:prefer-inline') @override $Res call({Object? totalCalories = null,Object? totalCarbs = null,Object? totalProtein = null,Object? totalFat = null,Object? caloriesGoal = null,Object? carbsGoal = null,Object? proteinGoal = null,Object? fatGoal = null,}) {
  return _then(_self.copyWith(
totalCalories: null == totalCalories ? _self.totalCalories : totalCalories // ignore: cast_nullable_to_non_nullable
as double,totalCarbs: null == totalCarbs ? _self.totalCarbs : totalCarbs // ignore: cast_nullable_to_non_nullable
as double,totalProtein: null == totalProtein ? _self.totalProtein : totalProtein // ignore: cast_nullable_to_non_nullable
as double,totalFat: null == totalFat ? _self.totalFat : totalFat // ignore: cast_nullable_to_non_nullable
as double,caloriesGoal: null == caloriesGoal ? _self.caloriesGoal : caloriesGoal // ignore: cast_nullable_to_non_nullable
as double,carbsGoal: null == carbsGoal ? _self.carbsGoal : carbsGoal // ignore: cast_nullable_to_non_nullable
as double,proteinGoal: null == proteinGoal ? _self.proteinGoal : proteinGoal // ignore: cast_nullable_to_non_nullable
as double,fatGoal: null == fatGoal ? _self.fatGoal : fatGoal // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double totalCalories,  double totalCarbs,  double totalProtein,  double totalFat,  double caloriesGoal,  double carbsGoal,  double proteinGoal,  double fatGoal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FoodProgress() when $default != null:
return $default(_that.totalCalories,_that.totalCarbs,_that.totalProtein,_that.totalFat,_that.caloriesGoal,_that.carbsGoal,_that.proteinGoal,_that.fatGoal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double totalCalories,  double totalCarbs,  double totalProtein,  double totalFat,  double caloriesGoal,  double carbsGoal,  double proteinGoal,  double fatGoal)  $default,) {final _that = this;
switch (_that) {
case _FoodProgress():
return $default(_that.totalCalories,_that.totalCarbs,_that.totalProtein,_that.totalFat,_that.caloriesGoal,_that.carbsGoal,_that.proteinGoal,_that.fatGoal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double totalCalories,  double totalCarbs,  double totalProtein,  double totalFat,  double caloriesGoal,  double carbsGoal,  double proteinGoal,  double fatGoal)?  $default,) {final _that = this;
switch (_that) {
case _FoodProgress() when $default != null:
return $default(_that.totalCalories,_that.totalCarbs,_that.totalProtein,_that.totalFat,_that.caloriesGoal,_that.carbsGoal,_that.proteinGoal,_that.fatGoal);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FoodProgress extends FoodProgress {
  const _FoodProgress({required this.totalCalories, required this.totalCarbs, required this.totalProtein, required this.totalFat, required this.caloriesGoal, required this.carbsGoal, required this.proteinGoal, required this.fatGoal}): super._();
  factory _FoodProgress.fromJson(Map<String, dynamic> json) => _$FoodProgressFromJson(json);

@override final  double totalCalories;
@override final  double totalCarbs;
@override final  double totalProtein;
@override final  double totalFat;
@override final  double caloriesGoal;
@override final  double carbsGoal;
@override final  double proteinGoal;
@override final  double fatGoal;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FoodProgress&&(identical(other.totalCalories, totalCalories) || other.totalCalories == totalCalories)&&(identical(other.totalCarbs, totalCarbs) || other.totalCarbs == totalCarbs)&&(identical(other.totalProtein, totalProtein) || other.totalProtein == totalProtein)&&(identical(other.totalFat, totalFat) || other.totalFat == totalFat)&&(identical(other.caloriesGoal, caloriesGoal) || other.caloriesGoal == caloriesGoal)&&(identical(other.carbsGoal, carbsGoal) || other.carbsGoal == carbsGoal)&&(identical(other.proteinGoal, proteinGoal) || other.proteinGoal == proteinGoal)&&(identical(other.fatGoal, fatGoal) || other.fatGoal == fatGoal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalCalories,totalCarbs,totalProtein,totalFat,caloriesGoal,carbsGoal,proteinGoal,fatGoal);

@override
String toString() {
  return 'FoodProgress(totalCalories: $totalCalories, totalCarbs: $totalCarbs, totalProtein: $totalProtein, totalFat: $totalFat, caloriesGoal: $caloriesGoal, carbsGoal: $carbsGoal, proteinGoal: $proteinGoal, fatGoal: $fatGoal)';
}


}

/// @nodoc
abstract mixin class _$FoodProgressCopyWith<$Res> implements $FoodProgressCopyWith<$Res> {
  factory _$FoodProgressCopyWith(_FoodProgress value, $Res Function(_FoodProgress) _then) = __$FoodProgressCopyWithImpl;
@override @useResult
$Res call({
 double totalCalories, double totalCarbs, double totalProtein, double totalFat, double caloriesGoal, double carbsGoal, double proteinGoal, double fatGoal
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
@override @pragma('vm:prefer-inline') $Res call({Object? totalCalories = null,Object? totalCarbs = null,Object? totalProtein = null,Object? totalFat = null,Object? caloriesGoal = null,Object? carbsGoal = null,Object? proteinGoal = null,Object? fatGoal = null,}) {
  return _then(_FoodProgress(
totalCalories: null == totalCalories ? _self.totalCalories : totalCalories // ignore: cast_nullable_to_non_nullable
as double,totalCarbs: null == totalCarbs ? _self.totalCarbs : totalCarbs // ignore: cast_nullable_to_non_nullable
as double,totalProtein: null == totalProtein ? _self.totalProtein : totalProtein // ignore: cast_nullable_to_non_nullable
as double,totalFat: null == totalFat ? _self.totalFat : totalFat // ignore: cast_nullable_to_non_nullable
as double,caloriesGoal: null == caloriesGoal ? _self.caloriesGoal : caloriesGoal // ignore: cast_nullable_to_non_nullable
as double,carbsGoal: null == carbsGoal ? _self.carbsGoal : carbsGoal // ignore: cast_nullable_to_non_nullable
as double,proteinGoal: null == proteinGoal ? _self.proteinGoal : proteinGoal // ignore: cast_nullable_to_non_nullable
as double,fatGoal: null == fatGoal ? _self.fatGoal : fatGoal // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
