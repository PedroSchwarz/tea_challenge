// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserData {

 String get name; double get caloriesGoal; double get carbsGoal; double get proteinGoal; double get fatGoal; double get waterGoal;
/// Create a copy of UserData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDataCopyWith<UserData> get copyWith => _$UserDataCopyWithImpl<UserData>(this as UserData, _$identity);

  /// Serializes this UserData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserData&&(identical(other.name, name) || other.name == name)&&(identical(other.caloriesGoal, caloriesGoal) || other.caloriesGoal == caloriesGoal)&&(identical(other.carbsGoal, carbsGoal) || other.carbsGoal == carbsGoal)&&(identical(other.proteinGoal, proteinGoal) || other.proteinGoal == proteinGoal)&&(identical(other.fatGoal, fatGoal) || other.fatGoal == fatGoal)&&(identical(other.waterGoal, waterGoal) || other.waterGoal == waterGoal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,caloriesGoal,carbsGoal,proteinGoal,fatGoal,waterGoal);

@override
String toString() {
  return 'UserData(name: $name, caloriesGoal: $caloriesGoal, carbsGoal: $carbsGoal, proteinGoal: $proteinGoal, fatGoal: $fatGoal, waterGoal: $waterGoal)';
}


}

/// @nodoc
abstract mixin class $UserDataCopyWith<$Res>  {
  factory $UserDataCopyWith(UserData value, $Res Function(UserData) _then) = _$UserDataCopyWithImpl;
@useResult
$Res call({
 String name, double caloriesGoal, double carbsGoal, double proteinGoal, double fatGoal, double waterGoal
});




}
/// @nodoc
class _$UserDataCopyWithImpl<$Res>
    implements $UserDataCopyWith<$Res> {
  _$UserDataCopyWithImpl(this._self, this._then);

  final UserData _self;
  final $Res Function(UserData) _then;

/// Create a copy of UserData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? caloriesGoal = null,Object? carbsGoal = null,Object? proteinGoal = null,Object? fatGoal = null,Object? waterGoal = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,caloriesGoal: null == caloriesGoal ? _self.caloriesGoal : caloriesGoal // ignore: cast_nullable_to_non_nullable
as double,carbsGoal: null == carbsGoal ? _self.carbsGoal : carbsGoal // ignore: cast_nullable_to_non_nullable
as double,proteinGoal: null == proteinGoal ? _self.proteinGoal : proteinGoal // ignore: cast_nullable_to_non_nullable
as double,fatGoal: null == fatGoal ? _self.fatGoal : fatGoal // ignore: cast_nullable_to_non_nullable
as double,waterGoal: null == waterGoal ? _self.waterGoal : waterGoal // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [UserData].
extension UserDataPatterns on UserData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserData value)  $default,){
final _that = this;
switch (_that) {
case _UserData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserData value)?  $default,){
final _that = this;
switch (_that) {
case _UserData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  double caloriesGoal,  double carbsGoal,  double proteinGoal,  double fatGoal,  double waterGoal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserData() when $default != null:
return $default(_that.name,_that.caloriesGoal,_that.carbsGoal,_that.proteinGoal,_that.fatGoal,_that.waterGoal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  double caloriesGoal,  double carbsGoal,  double proteinGoal,  double fatGoal,  double waterGoal)  $default,) {final _that = this;
switch (_that) {
case _UserData():
return $default(_that.name,_that.caloriesGoal,_that.carbsGoal,_that.proteinGoal,_that.fatGoal,_that.waterGoal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  double caloriesGoal,  double carbsGoal,  double proteinGoal,  double fatGoal,  double waterGoal)?  $default,) {final _that = this;
switch (_that) {
case _UserData() when $default != null:
return $default(_that.name,_that.caloriesGoal,_that.carbsGoal,_that.proteinGoal,_that.fatGoal,_that.waterGoal);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserData implements UserData {
  const _UserData({required this.name, required this.caloriesGoal, required this.carbsGoal, required this.proteinGoal, required this.fatGoal, required this.waterGoal});
  factory _UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);

@override final  String name;
@override final  double caloriesGoal;
@override final  double carbsGoal;
@override final  double proteinGoal;
@override final  double fatGoal;
@override final  double waterGoal;

/// Create a copy of UserData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserDataCopyWith<_UserData> get copyWith => __$UserDataCopyWithImpl<_UserData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserData&&(identical(other.name, name) || other.name == name)&&(identical(other.caloriesGoal, caloriesGoal) || other.caloriesGoal == caloriesGoal)&&(identical(other.carbsGoal, carbsGoal) || other.carbsGoal == carbsGoal)&&(identical(other.proteinGoal, proteinGoal) || other.proteinGoal == proteinGoal)&&(identical(other.fatGoal, fatGoal) || other.fatGoal == fatGoal)&&(identical(other.waterGoal, waterGoal) || other.waterGoal == waterGoal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,caloriesGoal,carbsGoal,proteinGoal,fatGoal,waterGoal);

@override
String toString() {
  return 'UserData(name: $name, caloriesGoal: $caloriesGoal, carbsGoal: $carbsGoal, proteinGoal: $proteinGoal, fatGoal: $fatGoal, waterGoal: $waterGoal)';
}


}

/// @nodoc
abstract mixin class _$UserDataCopyWith<$Res> implements $UserDataCopyWith<$Res> {
  factory _$UserDataCopyWith(_UserData value, $Res Function(_UserData) _then) = __$UserDataCopyWithImpl;
@override @useResult
$Res call({
 String name, double caloriesGoal, double carbsGoal, double proteinGoal, double fatGoal, double waterGoal
});




}
/// @nodoc
class __$UserDataCopyWithImpl<$Res>
    implements _$UserDataCopyWith<$Res> {
  __$UserDataCopyWithImpl(this._self, this._then);

  final _UserData _self;
  final $Res Function(_UserData) _then;

/// Create a copy of UserData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? caloriesGoal = null,Object? carbsGoal = null,Object? proteinGoal = null,Object? fatGoal = null,Object? waterGoal = null,}) {
  return _then(_UserData(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,caloriesGoal: null == caloriesGoal ? _self.caloriesGoal : caloriesGoal // ignore: cast_nullable_to_non_nullable
as double,carbsGoal: null == carbsGoal ? _self.carbsGoal : carbsGoal // ignore: cast_nullable_to_non_nullable
as double,proteinGoal: null == proteinGoal ? _self.proteinGoal : proteinGoal // ignore: cast_nullable_to_non_nullable
as double,fatGoal: null == fatGoal ? _self.fatGoal : fatGoal // ignore: cast_nullable_to_non_nullable
as double,waterGoal: null == waterGoal ? _self.waterGoal : waterGoal // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
