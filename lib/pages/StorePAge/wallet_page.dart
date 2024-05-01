
import 'package:flutter/material.dart';
import 'package:sneakers_app/pages/Crypto/common/common_color.dart';
import 'package:sneakers_app/pages/Crypto/common/common_textstyle.dart';
import 'package:sneakers_app/pages/StorePAge/card_tab.dart';

class Stripe_page extends StatefulWidget {
  const Stripe_page ({Key? key}) : super(key: key); // Correction ici


  @override
  State<Stripe_page> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<Stripe_page>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColor().backgorund1,
      body: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
            actions: [
              const SizedBox(
                width: 10,
              ),
             
            ],
            backgroundColor: CommonColor().backgorund1,
            // pinned: true,
            snap: true,
            floating: true,
            expandedHeight: 130.0,
            bottom: TabBar(
              indicatorColor: CommonColor().shine,
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: CommonTextStyle().style1,
              tabs: [
                Tab(text: 'Cards'),
              ],
              controller: controller,
            )),
        SliverFillRemaining(
          child: TabBarView(
            controller: controller,
            children: <Widget>[CardTab(), ],
          ),
        ),
      ]),
    );
  }
}
