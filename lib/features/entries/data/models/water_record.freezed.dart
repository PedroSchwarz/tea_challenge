// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'water_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WaterRecord {

 double get amountInMl; int? get id; DateTime? get createdAt;
/// Create a copy of WaterRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WaterRecordCopyWith<WaterRecord> get copyWith => _$WaterRecordCopyWithImpl<WaterRecord>(this as WaterRecord, _$identity);

  /// Serializes this WaterRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WaterRecord&&(identical(other.amountInMl, amountInMl) || other.amountInMl == amountInMl)&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,amountInMl,id,createdAt);

@override
String toString() {
  return 'WaterRecord(amountInMl: $amountInMl, id: $id, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $WaterRecordCopyWith<$Res>  {
  factory $WaterRecordCopyWith(WaterRecord value, $Res Function(WaterRecord) _then) = _$WaterRecordCopyWithImpl;
@useResult
$Res call({
 double amountInMl, int? id, DateTime? createdAt
});




}
/// @nodoc
class _$WaterRecordCopyWithImpl<$Res>
    implements $WaterRecordCopyWith<$Res> {
  _$WaterRecordCopyWithImpl(this._self, this._then);

  final WaterRecord _self;
  final $Res Function(WaterRecord) _then;

/// Create a copy of WaterRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? amountInMl = null,Object? id = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
amountInMl: null == amountInMl ? _self.amountInMl : amountInMl // ignore: cast_nullable_to_non_nullable
as double,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [WaterRecord].
extension WaterRecordPatterns on WaterRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WaterRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WaterRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WaterRecord value)  $default,){
final _that = this;
switch (_that) {
case _WaterRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WaterRecord value)?  $default,){
final _that = this;
switch (_that) {
case _WaterRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double amountInMl,  int? id,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WaterRecord() when $default != null:
return $default(_that.amountInMl,_that.id,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double amountInMl,  int? id,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _WaterRecord():
return $default(_that.amountInMl,_that.id,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double amountInMl,  int? id,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _WaterRecord() when $default != null:
return $default(_that.amountInMl,_that.id,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WaterRecord implements WaterRecord {
  const _WaterRecord({required this.amountInMl, this.id, this.createdAt});
  factory _WaterRecord.fromJson(Map<String, dynamic> json) => _$WaterRecordFromJson(json);

@override final  double amountInMl;
@override final  int? id;
@override final  DateTime? createdAt;

/// Create a copy of WaterRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WaterRecordCopyWith<_WaterRecord> get copyWith => __$WaterRecordCopyWithImpl<_WaterRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WaterRecordToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WaterRecord&&(identical(other.amountInMl, amountInMl) || other.amountInMl == amountInMl)&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,amountInMl,id,createdAt);

@override
String toString() {
  return 'WaterRecord(amountInMl: $amountInMl, id: $id, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$WaterRecordCopyWith<$Res> implements $WaterRecordCopyWith<$Res> {
  factory _$WaterRecordCopyWith(_WaterRecord value, $Res Function(_WaterRecord) _then) = __$WaterRecordCopyWithImpl;
@override @useResult
$Res call({
 double amountInMl, int? id, DateTime? createdAt
});




}
/// @nodoc
class __$WaterRecordCopyWithImpl<$Res>
    implements _$WaterRecordCopyWith<$Res> {
  __$WaterRecordCopyWithImpl(this._self, this._then);

  final _WaterRecord _self;
  final $Res Function(_WaterRecord) _then;

/// Create a copy of WaterRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? amountInMl = null,Object? id = freezed,Object? createdAt = freezed,}) {
  return _then(_WaterRecord(
amountInMl: null == amountInMl ? _self.amountInMl : amountInMl // ignore: cast_nullable_to_non_nullable
as double,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
