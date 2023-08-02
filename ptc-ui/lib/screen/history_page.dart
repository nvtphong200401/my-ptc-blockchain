import 'package:crypto_wallet_app/application/history_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryPage extends ConsumerWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyList = ref.watch(historyNotifierProvider).asData?.value ?? [];
    final size = MediaQuery.sizeOf(context);
    return ListView.builder(
      shrinkWrap: true,
      reverse: true,
      itemBuilder: (context, index) {
        final history = historyList[index];
        return ListTile(
          shape: const OutlineInputBorder(),
          leadingAndTrailingTextStyle: TextStyle(color: Colors.grey[300], fontSize: 16),
          titleTextStyle: TextStyle(color: Colors.grey[300], fontSize: 16),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                leadingAndTrailingTextStyle: TextStyle(color: Colors.grey[300], fontSize: 16),
                leading: SizedBox(
                  width: size.width * 0.6,
                  child: Text(
                    'From: ${history.from}',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                trailing: IconButton(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: history.from));
                    },
                    icon: const Icon(Icons.copy)),
              ),
              ListTile(
                leadingAndTrailingTextStyle: TextStyle(color: Colors.grey[300], fontSize: 16),
                leading: SizedBox(
                  width: size.width * 0.6,
                  child: Text(
                    'To: ${history.to}',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                trailing: IconButton(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: history.to));
                    },
                    icon: const Icon(Icons.copy)),
              ),
            ],
          ),
          trailing: Text(history.amount.toString()),
        );
      },
      itemCount: historyList.length,
    );
  }
}
