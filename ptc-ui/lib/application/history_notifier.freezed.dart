// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionHistory _$TransactionHistoryFromJson(Map<String, dynamic> json) {
  return _TransactionHistory.fromJson(json);
}

/// @nodoc
mixin _$TransactionHistory {
  String get from => throw _privateConstructorUsedError;
  String get to => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionHistoryCopyWith<TransactionHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionHistoryCopyWith<$Res> {
  factory $TransactionHistoryCopyWith(
          TransactionHistory value, $Res Function(TransactionHistory) then) =
      _$TransactionHistoryCopyWithImpl<$Res, TransactionHistory>;
  @useResult
  $Res call({String from, String to, double amount});
}

/// @nodoc
class _$TransactionHistoryCopyWithImpl<$Res, $Val extends TransactionHistory>
    implements $TransactionHistoryCopyWith<$Res> {
  _$TransactionHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? to = null,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransactionHistoryCopyWith<$Res>
    implements $TransactionHistoryCopyWith<$Res> {
  factory _$$_TransactionHistoryCopyWith(_$_TransactionHistory value,
          $Res Function(_$_TransactionHistory) then) =
      __$$_TransactionHistoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String from, String to, double amount});
}

/// @nodoc
class __$$_TransactionHistoryCopyWithImpl<$Res>
    extends _$TransactionHistoryCopyWithImpl<$Res, _$_TransactionHistory>
    implements _$$_TransactionHistoryCopyWith<$Res> {
  __$$_TransactionHistoryCopyWithImpl(
      _$_TransactionHistory _value, $Res Function(_$_TransactionHistory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? to = null,
    Object? amount = null,
  }) {
    return _then(_$_TransactionHistory(
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionHistory extends _TransactionHistory {
  const _$_TransactionHistory(
      {required this.from, required this.to, required this.amount})
      : super._();

  factory _$_TransactionHistory.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionHistoryFromJson(json);

  @override
  final String from;
  @override
  final String to;
  @override
  final double amount;

  @override
  String toString() {
    return 'TransactionHistory(from: $from, to: $to, amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionHistory &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, from, to, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionHistoryCopyWith<_$_TransactionHistory> get copyWith =>
      __$$_TransactionHistoryCopyWithImpl<_$_TransactionHistory>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionHistoryToJson(
      this,
    );
  }
}

abstract class _TransactionHistory extends TransactionHistory {
  const factory _TransactionHistory(
      {required final String from,
      required final String to,
      required final double amount}) = _$_TransactionHistory;
  const _TransactionHistory._() : super._();

  factory _TransactionHistory.fromJson(Map<String, dynamic> json) =
      _$_TransactionHistory.fromJson;

  @override
  String get from;
  @override
  String get to;
  @override
  double get amount;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionHistoryCopyWith<_$_TransactionHistory> get copyWith =>
      throw _privateConstructorUsedError;
}
