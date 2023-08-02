// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_notifier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionHistory _$$_TransactionHistoryFromJson(
        Map<String, dynamic> json) =>
    _$_TransactionHistory(
      from: json['from'] as String,
      to: json['to'] as String,
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$$_TransactionHistoryToJson(
        _$_TransactionHistory instance) =>
    <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'amount': instance.amount,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$historyNotifierHash() => r'8c9bc7544a2007e038db5c143920f665292bb55e';

/// See also [HistoryNotifier].
@ProviderFor(HistoryNotifier)
final historyNotifierProvider = AutoDisposeAsyncNotifierProvider<
    HistoryNotifier, List<TransactionHistory>>.internal(
  HistoryNotifier.new,
  name: r'historyNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$historyNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HistoryNotifier = AutoDisposeAsyncNotifier<List<TransactionHistory>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
