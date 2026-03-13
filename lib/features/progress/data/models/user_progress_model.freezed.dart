// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_progress_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserProgressModel {

 int get totalXp; int get currentLevel; int get currentStreak; int get longestStreak; int get questionsAnswered; int get correctAnswers; List<int> get completedLevels; String? get lastActiveDate;
/// Create a copy of UserProgressModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProgressModelCopyWith<UserProgressModel> get copyWith => _$UserProgressModelCopyWithImpl<UserProgressModel>(this as UserProgressModel, _$identity);

  /// Serializes this UserProgressModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProgressModel&&(identical(other.totalXp, totalXp) || other.totalXp == totalXp)&&(identical(other.currentLevel, currentLevel) || other.currentLevel == currentLevel)&&(identical(other.currentStreak, currentStreak) || other.currentStreak == currentStreak)&&(identical(other.longestStreak, longestStreak) || other.longestStreak == longestStreak)&&(identical(other.questionsAnswered, questionsAnswered) || other.questionsAnswered == questionsAnswered)&&(identical(other.correctAnswers, correctAnswers) || other.correctAnswers == correctAnswers)&&const DeepCollectionEquality().equals(other.completedLevels, completedLevels)&&(identical(other.lastActiveDate, lastActiveDate) || other.lastActiveDate == lastActiveDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalXp,currentLevel,currentStreak,longestStreak,questionsAnswered,correctAnswers,const DeepCollectionEquality().hash(completedLevels),lastActiveDate);

@override
String toString() {
  return 'UserProgressModel(totalXp: $totalXp, currentLevel: $currentLevel, currentStreak: $currentStreak, longestStreak: $longestStreak, questionsAnswered: $questionsAnswered, correctAnswers: $correctAnswers, completedLevels: $completedLevels, lastActiveDate: $lastActiveDate)';
}


}

/// @nodoc
abstract mixin class $UserProgressModelCopyWith<$Res>  {
  factory $UserProgressModelCopyWith(UserProgressModel value, $Res Function(UserProgressModel) _then) = _$UserProgressModelCopyWithImpl;
@useResult
$Res call({
 int totalXp, int currentLevel, int currentStreak, int longestStreak, int questionsAnswered, int correctAnswers, List<int> completedLevels, String? lastActiveDate
});




}
/// @nodoc
class _$UserProgressModelCopyWithImpl<$Res>
    implements $UserProgressModelCopyWith<$Res> {
  _$UserProgressModelCopyWithImpl(this._self, this._then);

  final UserProgressModel _self;
  final $Res Function(UserProgressModel) _then;

/// Create a copy of UserProgressModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalXp = null,Object? currentLevel = null,Object? currentStreak = null,Object? longestStreak = null,Object? questionsAnswered = null,Object? correctAnswers = null,Object? completedLevels = null,Object? lastActiveDate = freezed,}) {
  return _then(_self.copyWith(
totalXp: null == totalXp ? _self.totalXp : totalXp // ignore: cast_nullable_to_non_nullable
as int,currentLevel: null == currentLevel ? _self.currentLevel : currentLevel // ignore: cast_nullable_to_non_nullable
as int,currentStreak: null == currentStreak ? _self.currentStreak : currentStreak // ignore: cast_nullable_to_non_nullable
as int,longestStreak: null == longestStreak ? _self.longestStreak : longestStreak // ignore: cast_nullable_to_non_nullable
as int,questionsAnswered: null == questionsAnswered ? _self.questionsAnswered : questionsAnswered // ignore: cast_nullable_to_non_nullable
as int,correctAnswers: null == correctAnswers ? _self.correctAnswers : correctAnswers // ignore: cast_nullable_to_non_nullable
as int,completedLevels: null == completedLevels ? _self.completedLevels : completedLevels // ignore: cast_nullable_to_non_nullable
as List<int>,lastActiveDate: freezed == lastActiveDate ? _self.lastActiveDate : lastActiveDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserProgressModel].
extension UserProgressModelPatterns on UserProgressModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProgressModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProgressModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProgressModel value)  $default,){
final _that = this;
switch (_that) {
case _UserProgressModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProgressModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserProgressModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalXp,  int currentLevel,  int currentStreak,  int longestStreak,  int questionsAnswered,  int correctAnswers,  List<int> completedLevels,  String? lastActiveDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProgressModel() when $default != null:
return $default(_that.totalXp,_that.currentLevel,_that.currentStreak,_that.longestStreak,_that.questionsAnswered,_that.correctAnswers,_that.completedLevels,_that.lastActiveDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalXp,  int currentLevel,  int currentStreak,  int longestStreak,  int questionsAnswered,  int correctAnswers,  List<int> completedLevels,  String? lastActiveDate)  $default,) {final _that = this;
switch (_that) {
case _UserProgressModel():
return $default(_that.totalXp,_that.currentLevel,_that.currentStreak,_that.longestStreak,_that.questionsAnswered,_that.correctAnswers,_that.completedLevels,_that.lastActiveDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalXp,  int currentLevel,  int currentStreak,  int longestStreak,  int questionsAnswered,  int correctAnswers,  List<int> completedLevels,  String? lastActiveDate)?  $default,) {final _that = this;
switch (_that) {
case _UserProgressModel() when $default != null:
return $default(_that.totalXp,_that.currentLevel,_that.currentStreak,_that.longestStreak,_that.questionsAnswered,_that.correctAnswers,_that.completedLevels,_that.lastActiveDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserProgressModel implements UserProgressModel {
  const _UserProgressModel({this.totalXp = 0, this.currentLevel = 1, this.currentStreak = 0, this.longestStreak = 0, this.questionsAnswered = 0, this.correctAnswers = 0, final  List<int> completedLevels = const [], this.lastActiveDate}): _completedLevels = completedLevels;
  factory _UserProgressModel.fromJson(Map<String, dynamic> json) => _$UserProgressModelFromJson(json);

@override@JsonKey() final  int totalXp;
@override@JsonKey() final  int currentLevel;
@override@JsonKey() final  int currentStreak;
@override@JsonKey() final  int longestStreak;
@override@JsonKey() final  int questionsAnswered;
@override@JsonKey() final  int correctAnswers;
 final  List<int> _completedLevels;
@override@JsonKey() List<int> get completedLevels {
  if (_completedLevels is EqualUnmodifiableListView) return _completedLevels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_completedLevels);
}

@override final  String? lastActiveDate;

/// Create a copy of UserProgressModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProgressModelCopyWith<_UserProgressModel> get copyWith => __$UserProgressModelCopyWithImpl<_UserProgressModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserProgressModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProgressModel&&(identical(other.totalXp, totalXp) || other.totalXp == totalXp)&&(identical(other.currentLevel, currentLevel) || other.currentLevel == currentLevel)&&(identical(other.currentStreak, currentStreak) || other.currentStreak == currentStreak)&&(identical(other.longestStreak, longestStreak) || other.longestStreak == longestStreak)&&(identical(other.questionsAnswered, questionsAnswered) || other.questionsAnswered == questionsAnswered)&&(identical(other.correctAnswers, correctAnswers) || other.correctAnswers == correctAnswers)&&const DeepCollectionEquality().equals(other._completedLevels, _completedLevels)&&(identical(other.lastActiveDate, lastActiveDate) || other.lastActiveDate == lastActiveDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalXp,currentLevel,currentStreak,longestStreak,questionsAnswered,correctAnswers,const DeepCollectionEquality().hash(_completedLevels),lastActiveDate);

@override
String toString() {
  return 'UserProgressModel(totalXp: $totalXp, currentLevel: $currentLevel, currentStreak: $currentStreak, longestStreak: $longestStreak, questionsAnswered: $questionsAnswered, correctAnswers: $correctAnswers, completedLevels: $completedLevels, lastActiveDate: $lastActiveDate)';
}


}

/// @nodoc
abstract mixin class _$UserProgressModelCopyWith<$Res> implements $UserProgressModelCopyWith<$Res> {
  factory _$UserProgressModelCopyWith(_UserProgressModel value, $Res Function(_UserProgressModel) _then) = __$UserProgressModelCopyWithImpl;
@override @useResult
$Res call({
 int totalXp, int currentLevel, int currentStreak, int longestStreak, int questionsAnswered, int correctAnswers, List<int> completedLevels, String? lastActiveDate
});




}
/// @nodoc
class __$UserProgressModelCopyWithImpl<$Res>
    implements _$UserProgressModelCopyWith<$Res> {
  __$UserProgressModelCopyWithImpl(this._self, this._then);

  final _UserProgressModel _self;
  final $Res Function(_UserProgressModel) _then;

/// Create a copy of UserProgressModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalXp = null,Object? currentLevel = null,Object? currentStreak = null,Object? longestStreak = null,Object? questionsAnswered = null,Object? correctAnswers = null,Object? completedLevels = null,Object? lastActiveDate = freezed,}) {
  return _then(_UserProgressModel(
totalXp: null == totalXp ? _self.totalXp : totalXp // ignore: cast_nullable_to_non_nullable
as int,currentLevel: null == currentLevel ? _self.currentLevel : currentLevel // ignore: cast_nullable_to_non_nullable
as int,currentStreak: null == currentStreak ? _self.currentStreak : currentStreak // ignore: cast_nullable_to_non_nullable
as int,longestStreak: null == longestStreak ? _self.longestStreak : longestStreak // ignore: cast_nullable_to_non_nullable
as int,questionsAnswered: null == questionsAnswered ? _self.questionsAnswered : questionsAnswered // ignore: cast_nullable_to_non_nullable
as int,correctAnswers: null == correctAnswers ? _self.correctAnswers : correctAnswers // ignore: cast_nullable_to_non_nullable
as int,completedLevels: null == completedLevels ? _self._completedLevels : completedLevels // ignore: cast_nullable_to_non_nullable
as List<int>,lastActiveDate: freezed == lastActiveDate ? _self.lastActiveDate : lastActiveDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
