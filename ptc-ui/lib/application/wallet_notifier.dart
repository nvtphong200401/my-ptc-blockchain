import 'dart:async';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'wallet_notifier.freezed.dart';

@freezed
class WalletModel with _$WalletModel {
  const WalletModel._();
  const factory WalletModel({
    @Default('') String address,
    @Default(0) double balance,
  }) = _WalletModel;
}

@riverpod
class WalletNotifier extends AsyncNotifier<WalletModel> {
  final _dio = Dio();

  @override
  FutureOr<WalletModel> build() async {
    print('here');
    final balance = await getBalance();
    final address = await getAddress();
    return WalletModel(address: address, balance: balance);
  }

  Future getBalance() async {
    try {
      final response = await _dio.get('http://localhost:3001/balance');

      return response.data['balance'];
    } catch (err) {
      return 0;
    }
  }

  Future getAddress() async {
    final response = await _dio.get('http://localhost:3001/address');
    return response.data['address'];
  }

  Future mineBlock() async {
    await _dio.post('http://localhost:3001/mineBlock');
    reload();
  }

  Future reload() async {
    final newBalance = await getBalance();
    state = AsyncData(state.asData?.value.copyWith(balance: newBalance) ??
        WalletModel(balance: newBalance));
  }

  Future send({required String receiver, required double amount}) async {
    await _dio.post('http://localhost:3001/sendTransaction', data: {
      'amount': amount,
      'address': receiver,
    });
    reload();
  }
}

final walletProvider =
    AsyncNotifierProvider<WalletNotifier, WalletModel>(WalletNotifier.new);
