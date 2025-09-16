// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'build_configuration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BuildConfiguration {

 Environment get environment;
/// Create a copy of BuildConfiguration
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BuildConfigurationCopyWith<BuildConfiguration> get copyWith => _$BuildConfigurationCopyWithImpl<BuildConfiguration>(this as BuildConfiguration, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BuildConfiguration&&(identical(other.environment, environment) || other.environment == environment));
}


@override
int get hashCode => Object.hash(runtimeType,environment);

@override
String toString() {
  return 'BuildConfiguration(environment: $environment)';
}


}

/// @nodoc
abstract mixin class $BuildConfigurationCopyWith<$Res>  {
  factory $BuildConfigurationCopyWith(BuildConfiguration value, $Res Function(BuildConfiguration) _then) = _$BuildConfigurationCopyWithImpl;
@useResult
$Res call({
 Environment environment
});




}
/// @nodoc
class _$BuildConfigurationCopyWithImpl<$Res>
    implements $BuildConfigurationCopyWith<$Res> {
  _$BuildConfigurationCopyWithImpl(this._self, this._then);

  final BuildConfiguration _self;
  final $Res Function(BuildConfiguration) _then;

/// Create a copy of BuildConfiguration
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? environment = null,}) {
  return _then(_self.copyWith(
environment: null == environment ? _self.environment : environment // ignore: cast_nullable_to_non_nullable
as Environment,
  ));
}

}


/// Adds pattern-matching-related methods to [BuildConfiguration].
extension BuildConfigurationPatterns on BuildConfiguration {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BuildConfiguration value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BuildConfiguration() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BuildConfiguration value)  $default,){
final _that = this;
switch (_that) {
case _BuildConfiguration():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BuildConfiguration value)?  $default,){
final _that = this;
switch (_that) {
case _BuildConfiguration() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Environment environment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BuildConfiguration() when $default != null:
return $default(_that.environment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Environment environment)  $default,) {final _that = this;
switch (_that) {
case _BuildConfiguration():
return $default(_that.environment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Environment environment)?  $default,) {final _that = this;
switch (_that) {
case _BuildConfiguration() when $default != null:
return $default(_that.environment);case _:
  return null;

}
}

}

/// @nodoc


class _BuildConfiguration implements BuildConfiguration {
  const _BuildConfiguration({required this.environment});
  

@override final  Environment environment;

/// Create a copy of BuildConfiguration
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BuildConfigurationCopyWith<_BuildConfiguration> get copyWith => __$BuildConfigurationCopyWithImpl<_BuildConfiguration>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BuildConfiguration&&(identical(other.environment, environment) || other.environment == environment));
}


@override
int get hashCode => Object.hash(runtimeType,environment);

@override
String toString() {
  return 'BuildConfiguration(environment: $environment)';
}


}

/// @nodoc
abstract mixin class _$BuildConfigurationCopyWith<$Res> implements $BuildConfigurationCopyWith<$Res> {
  factory _$BuildConfigurationCopyWith(_BuildConfiguration value, $Res Function(_BuildConfiguration) _then) = __$BuildConfigurationCopyWithImpl;
@override @useResult
$Res call({
 Environment environment
});




}
/// @nodoc
class __$BuildConfigurationCopyWithImpl<$Res>
    implements _$BuildConfigurationCopyWith<$Res> {
  __$BuildConfigurationCopyWithImpl(this._self, this._then);

  final _BuildConfiguration _self;
  final $Res Function(_BuildConfiguration) _then;

/// Create a copy of BuildConfiguration
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? environment = null,}) {
  return _then(_BuildConfiguration(
environment: null == environment ? _self.environment : environment // ignore: cast_nullable_to_non_nullable
as Environment,
  ));
}


}

// dart format on
