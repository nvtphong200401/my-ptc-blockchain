import 'package:crypto_wallet_app/application/wallet_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SendPage extends HookConsumerWidget {
  const SendPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addressController = useTextEditingController();
    final amountController = useTextEditingController();
    return Column(
      children: [
        TextField(
          controller: addressController,
          decoration: InputDecoration(
            hintText: 'To address',
            fillColor: Colors.grey[300],
            filled: true,
            border: const OutlineInputBorder(),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          controller: amountController,
          decoration: InputDecoration(
            hintText: 'Amount',
            fillColor: Colors.grey[300],
            filled: true,
            border: const OutlineInputBorder(),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {
              ref
                  .read(walletProvider.notifier)
                  .send(receiver: addressController.text, amount: double.parse(amountController.text));

              amountController.clear();
              addressController.clear();
            },
            child: const Text('Send'))
      ],
    );
  }
}
