// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
Entry _$EntryFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'food':
          return FoodEntry.fromJson(
            json
          );
                case 'water':
          return WaterEntry.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'Entry',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$Entry {



  /// Serializes this Entry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Entry);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Entry()';
}


}

/// @nodoc
class $EntryCopyWith<$Res>  {
$EntryCopyWith(Entry _, $Res Function(Entry) __);
}


/// Adds pattern-matching-related methods to [Entry].
extension EntryPatterns on Entry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FoodEntry value)?  food,TResult Function( WaterEntry value)?  water,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FoodEntry() when food != null:
return food(_that);case WaterEntry() when water != null:
return water(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FoodEntry value)  food,required TResult Function( WaterEntry value)  water,}){
final _that = this;
switch (_that) {
case FoodEntry():
return food(_that);case WaterEntry():
return water(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FoodEntry value)?  food,TResult? Function( WaterEntry value)?  water,}){
final _that = this;
switch (_that) {
case FoodEntry() when food != null:
return food(_that);case WaterEntry() when water != null:
return water(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( FoodRecord foodRecord)?  food,TResult Function( WaterRecord waterRecord)?  water,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FoodEntry() when food != null:
return food(_that.foodRecord);case WaterEntry() when water != null:
return water(_that.waterRecord);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( FoodRecord foodRecord)  food,required TResult Function( WaterRecord waterRecord)  water,}) {final _that = this;
switch (_that) {
case FoodEntry():
return food(_that.foodRecord);case WaterEntry():
return water(_that.waterRecord);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( FoodRecord foodRecord)?  food,TResult? Function( WaterRecord waterRecord)?  water,}) {final _that = this;
switch (_that) {
case FoodEntry() when food != null:
return food(_that.foodRecord);case WaterEntry() when water != null:
return water(_that.waterRecord);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class FoodEntry extends Entry {
  const FoodEntry(this.foodRecord, {final  String? $type}): $type = $type ?? 'food',super._();
  factory FoodEntry.fromJson(Map<String, dynamic> json) => _$FoodEntryFromJson(json);

 final  FoodRecord foodRecord;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of Entry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FoodEntryCopyWith<FoodEntry> get copyWith => _$FoodEntryCopyWithImpl<FoodEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FoodEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FoodEntry&&(identical(other.foodRecord, foodRecord) || other.foodRecord == foodRecord));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,foodRecord);

@override
String toString() {
  return 'Entry.food(foodRecord: $foodRecord)';
}


}

/// @nodoc
abstract mixin class $FoodEntryCopyWith<$Res> implements $EntryCopyWith<$Res> {
  factory $FoodEntryCopyWith(FoodEntry value, $Res Function(FoodEntry) _then) = _$FoodEntryCopyWithImpl;
@useResult
$Res call({
 FoodRecord foodRecord
});


$FoodRecordCopyWith<$Res> get foodRecord;

}
/// @nodoc
class _$FoodEntryCopyWithImpl<$Res>
    implements $FoodEntryCopyWith<$Res> {
  _$FoodEntryCopyWithImpl(this._self, this._then);

  final FoodEntry _self;
  final $Res Function(FoodEntry) _then;

/// Create a copy of Entry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? foodRecord = null,}) {
  return _then(FoodEntry(
null == foodRecord ? _self.foodRecord : foodRecord // ignore: cast_nullable_to_non_nullable
as FoodRecord,
  ));
}

/// Create a copy of Entry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FoodRecordCopyWith<$Res> get foodRecord {
  
  return $FoodRecordCopyWith<$Res>(_self.foodRecord, (value) {
    return _then(_self.copyWith(foodRecord: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class WaterEntry extends Entry {
  const WaterEntry(this.waterRecord, {final  String? $type}): $type = $type ?? 'water',super._();
  factory WaterEntry.fromJson(Map<String, dynamic> json) => _$WaterEntryFromJson(json);

 final  WaterRecord waterRecord;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of Entry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WaterEntryCopyWith<WaterEntry> get copyWith => _$WaterEntryCopyWithImpl<WaterEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WaterEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WaterEntry&&(identical(other.waterRecord, waterRecord) || other.waterRecord == waterRecord));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,waterRecord);

@override
String toString() {
  return 'Entry.water(waterRecord: $waterRecord)';
}


}

/// @nodoc
abstract mixin class $WaterEntryCopyWith<$Res> implements $EntryCopyWith<$Res> {
  factory $WaterEntryCopyWith(WaterEntry value, $Res Function(WaterEntry) _then) = _$WaterEntryCopyWithImpl;
@useResult
$Res call({
 WaterRecord waterRecord
});


$WaterRecordCopyWith<$Res> get waterRecord;

}
/// @nodoc
class _$WaterEntryCopyWithImpl<$Res>
    implements $WaterEntryCopyWith<$Res> {
  _$WaterEntryCopyWithImpl(this._self, this._then);

  final WaterEntry _self;
  final $Res Function(WaterEntry) _then;

/// Create a copy of Entry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? waterRecord = null,}) {
  return _then(WaterEntry(
null == waterRecord ? _self.waterRecord : waterRecord // ignore: cast_nullable_to_non_nullable
as WaterRecord,
  ));
}

/// Create a copy of Entry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WaterRecordCopyWith<$Res> get waterRecord {
  
  return $WaterRecordCopyWith<$Res>(_self.waterRecord, (value) {
    return _then(_self.copyWith(waterRecord: value));
  });
}
}

// dart format on
