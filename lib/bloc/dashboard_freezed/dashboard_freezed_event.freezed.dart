// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_freezed_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DashboardFreezedEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchUsers,
    required TResult Function(int userId) deleteUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchUsers,
    TResult? Function(int userId)? deleteUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchUsers,
    TResult Function(int userId)? deleteUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchUsersEvent value) fetchUsers,
    required TResult Function(DeleteUsersEvent value) deleteUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchUsersEvent value)? fetchUsers,
    TResult? Function(DeleteUsersEvent value)? deleteUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchUsersEvent value)? fetchUsers,
    TResult Function(DeleteUsersEvent value)? deleteUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardFreezedEventCopyWith<$Res> {
  factory $DashboardFreezedEventCopyWith(DashboardFreezedEvent value,
          $Res Function(DashboardFreezedEvent) then) =
      _$DashboardFreezedEventCopyWithImpl<$Res, DashboardFreezedEvent>;
}

/// @nodoc
class _$DashboardFreezedEventCopyWithImpl<$Res,
        $Val extends DashboardFreezedEvent>
    implements $DashboardFreezedEventCopyWith<$Res> {
  _$DashboardFreezedEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchUsersEventCopyWith<$Res> {
  factory _$$FetchUsersEventCopyWith(
          _$FetchUsersEvent value, $Res Function(_$FetchUsersEvent) then) =
      __$$FetchUsersEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchUsersEventCopyWithImpl<$Res>
    extends _$DashboardFreezedEventCopyWithImpl<$Res, _$FetchUsersEvent>
    implements _$$FetchUsersEventCopyWith<$Res> {
  __$$FetchUsersEventCopyWithImpl(
      _$FetchUsersEvent _value, $Res Function(_$FetchUsersEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchUsersEvent implements FetchUsersEvent {
  const _$FetchUsersEvent();

  @override
  String toString() {
    return 'DashboardFreezedEvent.fetchUsers()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchUsersEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchUsers,
    required TResult Function(int userId) deleteUser,
  }) {
    return fetchUsers();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchUsers,
    TResult? Function(int userId)? deleteUser,
  }) {
    return fetchUsers?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchUsers,
    TResult Function(int userId)? deleteUser,
    required TResult orElse(),
  }) {
    if (fetchUsers != null) {
      return fetchUsers();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchUsersEvent value) fetchUsers,
    required TResult Function(DeleteUsersEvent value) deleteUser,
  }) {
    return fetchUsers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchUsersEvent value)? fetchUsers,
    TResult? Function(DeleteUsersEvent value)? deleteUser,
  }) {
    return fetchUsers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchUsersEvent value)? fetchUsers,
    TResult Function(DeleteUsersEvent value)? deleteUser,
    required TResult orElse(),
  }) {
    if (fetchUsers != null) {
      return fetchUsers(this);
    }
    return orElse();
  }
}

abstract class FetchUsersEvent implements DashboardFreezedEvent {
  const factory FetchUsersEvent() = _$FetchUsersEvent;
}

/// @nodoc
abstract class _$$DeleteUsersEventCopyWith<$Res> {
  factory _$$DeleteUsersEventCopyWith(
          _$DeleteUsersEvent value, $Res Function(_$DeleteUsersEvent) then) =
      __$$DeleteUsersEventCopyWithImpl<$Res>;
  @useResult
  $Res call({int userId});
}

/// @nodoc
class __$$DeleteUsersEventCopyWithImpl<$Res>
    extends _$DashboardFreezedEventCopyWithImpl<$Res, _$DeleteUsersEvent>
    implements _$$DeleteUsersEventCopyWith<$Res> {
  __$$DeleteUsersEventCopyWithImpl(
      _$DeleteUsersEvent _value, $Res Function(_$DeleteUsersEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$DeleteUsersEvent(
      null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteUsersEvent implements DeleteUsersEvent {
  const _$DeleteUsersEvent(this.userId);

  @override
  final int userId;

  @override
  String toString() {
    return 'DashboardFreezedEvent.deleteUser(userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteUsersEvent &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteUsersEventCopyWith<_$DeleteUsersEvent> get copyWith =>
      __$$DeleteUsersEventCopyWithImpl<_$DeleteUsersEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchUsers,
    required TResult Function(int userId) deleteUser,
  }) {
    return deleteUser(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchUsers,
    TResult? Function(int userId)? deleteUser,
  }) {
    return deleteUser?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchUsers,
    TResult Function(int userId)? deleteUser,
    required TResult orElse(),
  }) {
    if (deleteUser != null) {
      return deleteUser(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchUsersEvent value) fetchUsers,
    required TResult Function(DeleteUsersEvent value) deleteUser,
  }) {
    return deleteUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchUsersEvent value)? fetchUsers,
    TResult? Function(DeleteUsersEvent value)? deleteUser,
  }) {
    return deleteUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchUsersEvent value)? fetchUsers,
    TResult Function(DeleteUsersEvent value)? deleteUser,
    required TResult orElse(),
  }) {
    if (deleteUser != null) {
      return deleteUser(this);
    }
    return orElse();
  }
}

abstract class DeleteUsersEvent implements DashboardFreezedEvent {
  const factory DeleteUsersEvent(final int userId) = _$DeleteUsersEvent;

  int get userId;
  @JsonKey(ignore: true)
  _$$DeleteUsersEventCopyWith<_$DeleteUsersEvent> get copyWith =>
      throw _privateConstructorUsedError;
}
