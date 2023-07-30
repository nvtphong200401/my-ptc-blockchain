import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'history_notifier.freezed.dart';
part 'history_notifier.g.dart';

@freezed
class TransactionHistory with _$TransactionHistory {
  const TransactionHistory._();
  const factory TransactionHistory({required String from, required String to, required double amount}) =
      _TransactionHistory;
  factory TransactionHistory.fromJson(Map<String, dynamic> json) => _$TransactionHistoryFromJson(json);
}

@riverpod
class HistoryNotifier extends AutoDisposeAsyncNotifier<List<TransactionHistory>> {
  final _dio = Dio();
  @override
  FutureOr<List<TransactionHistory>> build() {
    return getHistory();
  }

  Future<List<TransactionHistory>> getHistory() async {
    final response = await _dio.get('http://localhost:3001/history');
    final data = response.data as List;
    return data.map((e) => TransactionHistory.fromJson(e)).toList();
  }
}
