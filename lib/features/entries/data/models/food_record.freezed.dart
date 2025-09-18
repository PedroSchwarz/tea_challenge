// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FoodRecord {

 String get name; double get calories; double get portionSize; double get carbs; double get protein; double get fat; int? get id; DateTime? get createdAt;
/// Create a copy of FoodRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FoodRecordCopyWith<FoodRecord> get copyWith => _$FoodRecordCopyWithImpl<FoodRecord>(this as FoodRecord, _$identity);

  /// Serializes this FoodRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FoodRecord&&(identical(other.name, name) || other.name == name)&&(identical(other.calories, calories) || other.calories == calories)&&(identical(other.portionSize, portionSize) || other.portionSize == portionSize)&&(identical(other.carbs, carbs) || other.carbs == carbs)&&(identical(other.protein, protein) || other.protein == protein)&&(identical(other.fat, fat) || other.fat == fat)&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,calories,portionSize,carbs,protein,fat,id,createdAt);

@override
String toString() {
  return 'FoodRecord(name: $name, calories: $calories, portionSize: $portionSize, carbs: $carbs, protein: $protein, fat: $fat, id: $id, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $FoodRecordCopyWith<$Res>  {
  factory $FoodRecordCopyWith(FoodRecord value, $Res Function(FoodRecord) _then) = _$FoodRecordCopyWithImpl;
@useResult
$Res call({
 String name, double calories, double portionSize, double carbs, double protein, double fat, int? id, DateTime? createdAt
});




}
/// @nodoc
class _$FoodRecordCopyWithImpl<$Res>
    implements $FoodRecordCopyWith<$Res> {
  _$FoodRecordCopyWithImpl(this._self, this._then);

  final FoodRecord _self;
  final $Res Function(FoodRecord) _then;

/// Create a copy of FoodRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? calories = null,Object? portionSize = null,Object? carbs = null,Object? protein = null,Object? fat = null,Object? id = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,calories: null == calories ? _self.calories : calories // ignore: cast_nullable_to_non_nullable
as double,portionSize: null == portionSize ? _self.portionSize : portionSize // ignore: cast_nullable_to_non_nullable
as double,carbs: null == carbs ? _self.carbs : carbs // ignore: cast_nullable_to_non_nullable
as double,protein: null == protein ? _self.protein : protein // ignore: cast_nullable_to_non_nullable
as double,fat: null == fat ? _self.fat : fat // ignore: cast_nullable_to_non_nullable
as double,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [FoodRecord].
extension FoodRecordPatterns on FoodRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FoodRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FoodRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FoodRecord value)  $default,){
final _that = this;
switch (_that) {
case _FoodRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FoodRecord value)?  $default,){
final _that = this;
switch (_that) {
case _FoodRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  double calories,  double portionSize,  double carbs,  double protein,  double fat,  int? id,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FoodRecord() when $default != null:
return $default(_that.name,_that.calories,_that.portionSize,_that.carbs,_that.protein,_that.fat,_that.id,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  double calories,  double portionSize,  double carbs,  double protein,  double fat,  int? id,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _FoodRecord():
return $default(_that.name,_that.calories,_that.portionSize,_that.carbs,_that.protein,_that.fat,_that.id,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  double calories,  double portionSize,  double carbs,  double protein,  double fat,  int? id,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _FoodRecord() when $default != null:
return $default(_that.name,_that.calories,_that.portionSize,_that.carbs,_that.protein,_that.fat,_that.id,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FoodRecord extends FoodRecord {
  const _FoodRecord({required this.name, required this.calories, required this.portionSize, required this.carbs, required this.protein, required this.fat, this.id, this.createdAt}): super._();
  factory _FoodRecord.fromJson(Map<String, dynamic> json) => _$FoodRecordFromJson(json);

@override final  String name;
@override final  double calories;
@override final  double portionSize;
@override final  double carbs;
@override final  double protein;
@override final  double fat;
@override final  int? id;
@override final  DateTime? createdAt;

/// Create a copy of FoodRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FoodRecordCopyWith<_FoodRecord> get copyWith => __$FoodRecordCopyWithImpl<_FoodRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FoodRecordToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FoodRecord&&(identical(other.name, name) || other.name == name)&&(identical(other.calories, calories) || other.calories == calories)&&(identical(other.portionSize, portionSize) || other.portionSize == portionSize)&&(identical(other.carbs, carbs) || other.carbs == carbs)&&(identical(other.protein, protein) || other.protein == protein)&&(identical(other.fat, fat) || other.fat == fat)&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,calories,portionSize,carbs,protein,fat,id,createdAt);

@override
String toString() {
  return 'FoodRecord(name: $name, calories: $calories, portionSize: $portionSize, carbs: $carbs, protein: $protein, fat: $fat, id: $id, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$FoodRecordCopyWith<$Res> implements $FoodRecordCopyWith<$Res> {
  factory _$FoodRecordCopyWith(_FoodRecord value, $Res Function(_FoodRecord) _then) = __$FoodRecordCopyWithImpl;
@override @useResult
$Res call({
 String name, double calories, double portionSize, double carbs, double protein, double fat, int? id, DateTime? createdAt
});




}
/// @nodoc
class __$FoodRecordCopyWithImpl<$Res>
    implements _$FoodRecordCopyWith<$Res> {
  __$FoodRecordCopyWithImpl(this._self, this._then);

  final _FoodRecord _self;
  final $Res Function(_FoodRecord) _then;

/// Create a copy of FoodRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? calories = null,Object? portionSize = null,Object? carbs = null,Object? protein = null,Object? fat = null,Object? id = freezed,Object? createdAt = freezed,}) {
  return _then(_FoodRecord(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,calories: null == calories ? _self.calories : calories // ignore: cast_nullable_to_non_nullable
as double,portionSize: null == portionSize ? _self.portionSize : portionSize // ignore: cast_nullable_to_non_nullable
as double,carbs: null == carbs ? _self.carbs : carbs // ignore: cast_nullable_to_non_nullable
as double,protein: null == protein ? _self.protein : protein // ignore: cast_nullable_to_non_nullable
as double,fat: null == fat ? _self.fat : fat // ignore: cast_nullable_to_non_nullable
as double,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
