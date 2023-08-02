import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:crypto_wallet_app/application/wallet_notifier.dart';
import 'package:crypto_wallet_app/screen/history_page.dart';
import 'package:crypto_wallet_app/screen/send_page.dart';
import 'package:crypto_wallet_app/widget/asset_card.dart';
import 'package:crypto_wallet_app/widget/portfolio_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  List _currency = [];
  bool _showSending = false;
  bool _showHistory = false;

  void toggleSending() {
    setState(() {
      _showSending = !_showSending;
      _showHistory = false;
    });
  }

  void toggleHistory() {
    setState(() {
      _showSending = false;
      _showHistory = !_showHistory;
    });
  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/json/currency.json');
    final data = await json.decode(response);

    setState(() {
      _currency = data['currency'];
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();

    Future.delayed(const Duration(milliseconds: 500) * 5, () {
      if (!mounted) {
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final wallet = ref.watch(walletProvider).maybeWhen(
          orElse: () => const WalletModel(),
          data: (data) => data,
        );

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 80, right: 10, left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInDownBig(
                child: const Center(
                    child: Text(
              'Current Wallet Ballance',
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ))),
            const SizedBox(
              height: 5,
            ),
            FadeInDownBig(
                child: Center(
                    child: Text(
              '${wallet.balance} PTC',
              style:
                  TextStyle(color: Colors.yellowAccent[700], fontSize: 45, fontWeight: FontWeight.bold, fontFamily: ''),
            ))),
            const SizedBox(
              height: 10,
            ),
            FadeInDownBig(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: size.width * 0.5,
                  child: Text(
                    wallet.address,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey[300]),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: wallet.address));
                    },
                    icon: const Icon(Icons.copy))
              ],
            )),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeInLeft(
                    child: _sendReceive(context, title: 'Send', onTap: () {
                  toggleSending();
                }, icon: Icon(Icons.arrow_upward_rounded, size: size.width * 0.1, color: Colors.grey[400]))),
                const SizedBox(
                  width: 20,
                ),
                FadeInDown(
                    child: _sendReceive(context,
                        title: 'Deposit',
                        icon: Icon(Icons.arrow_downward_rounded, size: size.width * 0.1, color: Colors.grey[400]))),
                const SizedBox(
                  width: 20,
                ),
                FadeInUp(
                    child: _sendReceive(context,
                        title: 'Mine block',
                        onTap: ref.read(walletProvider.notifier).mineBlock,
                        icon: Icon(Icons.engineering_rounded, size: size.width * 0.1, color: Colors.grey[400]))),
                const SizedBox(
                  width: 20,
                ),
                FadeInRight(
                    child: _sendReceive(context,
                        title: 'History',
                        onTap: toggleHistory,
                        icon: Icon(Icons.swap_horizontal_circle, size: size.width * 0.1, color: Colors.grey[400]))),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            const Divider(
              height: 1,
              thickness: 0.5,
              color: Colors.grey,
            ),

            if (_showSending) const SendPage(),
            if (_showHistory) const HistoryPage(),
            const SizedBox(
              height: 16,
            ),
            // _viewAll(title: 'Portfolio'),
            // Row(
            //   children: [
            //     Expanded(
            //       child: SizedBox(
            //         height: 200,
            //         child: LiveGrid(
            //             padding: const EdgeInsets.only(top: 0, left: 0, bottom: 6),
            //             showItemInterval: const Duration(milliseconds: 50),
            //             showItemDuration: const Duration(milliseconds: 150),
            //             visibleFraction: 0.001,
            //             scrollDirection: Axis.horizontal,
            //             itemCount: _currency.length,
            //             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //               crossAxisCount: 1,
            //               crossAxisSpacing: 0,
            //               mainAxisSpacing: 0,
            //             ),
            //             itemBuilder: _buildAnimatedItemGrid),
            //       ),
            //     ),
            //   ],
            // ),
            // _viewAll(title: 'Your Assets'),
            // LiveList(
            //   showItemInterval: const Duration(milliseconds: 300),
            //   showItemDuration: const Duration(seconds: 1),
            //   padding: const EdgeInsets.only(top: 0, bottom: 16),
            //   physics: const BouncingScrollPhysics(),
            //   shrinkWrap: true,
            //   itemCount: _currency.length,
            //   itemBuilder: _buildAnimatedItem,
            // ),
          ],
        ),
      ),
      // bottomNavigationBar: const BottomNavigation(),
    );
  }

  Widget _buildAnimatedItemGrid(
    BuildContext context,
    int index,
    Animation<double> animation,
  ) =>
      FadeTransition(
        opacity: Tween<double>(
          begin: 0,
          end: 1,
        ).animate(animation),
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -0.1),
            end: Offset.zero,
          ).animate(animation),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: PortfolioCard(
                title: _currency[index]['name'], price: _currency[index]['price'], logo: _currency[index]['logo']),
          ),
        ),
      );

  Widget _buildAnimatedItem(
    BuildContext context,
    int index,
    Animation<double> animation,
  ) =>
      FadeTransition(
        opacity: Tween<double>(
          begin: 0,
          end: 1,
        ).animate(animation),
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -0.1),
            end: Offset.zero,
          ).animate(animation),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: AssetsCard(
              title: _currency[index]['name'] + ' ' + '(' + _currency[index]["symbol"] + ')',
              price: _currency[index]['symbol'],
              logo: _currency[index]['logo'],
              chart: 'chart',
              rise: '\$5,017',
              percent: '3.75%',
            ),
          ),
        ),
      );

  _viewAll({required String title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.grey[300], fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextButton(
            onPressed: () {},
            child: const Text(
              'See all',
              style: TextStyle(color: Colors.grey),
            ))
      ],
    );
  }

  _sendReceive(BuildContext context, {required Icon icon, required String title, Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.17,
            height: MediaQuery.of(context).size.width * 0.17,
            decoration:
                BoxDecoration(color: Colors.grey[900], borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: icon,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            title,
            style: TextStyle(color: Colors.grey[300], fontSize: 20),
          ),
        ],
      ),
    );
  }
}
