// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HistoryData {

 DateTime get date; double get caloriesProgress; double get waterProgress;
/// Create a copy of HistoryData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryDataCopyWith<HistoryData> get copyWith => _$HistoryDataCopyWithImpl<HistoryData>(this as HistoryData, _$identity);

  /// Serializes this HistoryData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryData&&(identical(other.date, date) || other.date == date)&&(identical(other.caloriesProgress, caloriesProgress) || other.caloriesProgress == caloriesProgress)&&(identical(other.waterProgress, waterProgress) || other.waterProgress == waterProgress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,caloriesProgress,waterProgress);

@override
String toString() {
  return 'HistoryData(date: $date, caloriesProgress: $caloriesProgress, waterProgress: $waterProgress)';
}


}

/// @nodoc
abstract mixin class $HistoryDataCopyWith<$Res>  {
  factory $HistoryDataCopyWith(HistoryData value, $Res Function(HistoryData) _then) = _$HistoryDataCopyWithImpl;
@useResult
$Res call({
 DateTime date, double caloriesProgress, double waterProgress
});




}
/// @nodoc
class _$HistoryDataCopyWithImpl<$Res>
    implements $HistoryDataCopyWith<$Res> {
  _$HistoryDataCopyWithImpl(this._self, this._then);

  final HistoryData _self;
  final $Res Function(HistoryData) _then;

/// Create a copy of HistoryData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? caloriesProgress = null,Object? waterProgress = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,caloriesProgress: null == caloriesProgress ? _self.caloriesProgress : caloriesProgress // ignore: cast_nullable_to_non_nullable
as double,waterProgress: null == waterProgress ? _self.waterProgress : waterProgress // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [HistoryData].
extension HistoryDataPatterns on HistoryData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryData value)  $default,){
final _that = this;
switch (_that) {
case _HistoryData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryData value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  double caloriesProgress,  double waterProgress)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryData() when $default != null:
return $default(_that.date,_that.caloriesProgress,_that.waterProgress);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  double caloriesProgress,  double waterProgress)  $default,) {final _that = this;
switch (_that) {
case _HistoryData():
return $default(_that.date,_that.caloriesProgress,_that.waterProgress);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  double caloriesProgress,  double waterProgress)?  $default,) {final _that = this;
switch (_that) {
case _HistoryData() when $default != null:
return $default(_that.date,_that.caloriesProgress,_that.waterProgress);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HistoryData implements HistoryData {
  const _HistoryData({required this.date, required this.caloriesProgress, required this.waterProgress});
  factory _HistoryData.fromJson(Map<String, dynamic> json) => _$HistoryDataFromJson(json);

@override final  DateTime date;
@override final  double caloriesProgress;
@override final  double waterProgress;

/// Create a copy of HistoryData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryDataCopyWith<_HistoryData> get copyWith => __$HistoryDataCopyWithImpl<_HistoryData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HistoryDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryData&&(identical(other.date, date) || other.date == date)&&(identical(other.caloriesProgress, caloriesProgress) || other.caloriesProgress == caloriesProgress)&&(identical(other.waterProgress, waterProgress) || other.waterProgress == waterProgress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,caloriesProgress,waterProgress);

@override
String toString() {
  return 'HistoryData(date: $date, caloriesProgress: $caloriesProgress, waterProgress: $waterProgress)';
}


}

/// @nodoc
abstract mixin class _$HistoryDataCopyWith<$Res> implements $HistoryDataCopyWith<$Res> {
  factory _$HistoryDataCopyWith(_HistoryData value, $Res Function(_HistoryData) _then) = __$HistoryDataCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, double caloriesProgress, double waterProgress
});




}
/// @nodoc
class __$HistoryDataCopyWithImpl<$Res>
    implements _$HistoryDataCopyWith<$Res> {
  __$HistoryDataCopyWithImpl(this._self, this._then);

  final _HistoryData _self;
  final $Res Function(_HistoryData) _then;

/// Create a copy of HistoryData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? caloriesProgress = null,Object? waterProgress = null,}) {
  return _then(_HistoryData(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,caloriesProgress: null == caloriesProgress ? _self.caloriesProgress : caloriesProgress // ignore: cast_nullable_to_non_nullable
as double,waterProgress: null == waterProgress ? _self.waterProgress : waterProgress // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
