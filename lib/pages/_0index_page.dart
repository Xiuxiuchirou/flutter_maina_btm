import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mai_na/config/const_config.dart';
import 'package:flutter_mai_na/pages/_1news_page.dart';
import 'package:flutter_mai_na/pages/_2price_page.dart';
import 'package:flutter_mai_na/pages/_3level_page.dart';
import 'package:flutter_mai_na/pages/_4member_page.dart';

import '_5login_page.dart';

class MaiNaAPP extends StatefulWidget {
  @override
  _MaiNaAPPState createState() => _MaiNaAPPState();
}

class _MaiNaAPPState extends State<MaiNaAPP> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.news), title: Text(menu_newsTitle)),
    BottomNavigationBarItem(
        icon: Icon(
          IconData(0xe644, fontFamily: "Myicons"),
        ),
        title: Text(menu_priceTitle)),
    BottomNavigationBarItem(
        icon: Icon(Icons.account_balance_wallet), title: Text(menu_levelTitle)),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.person), title: Text(menu_memberTitle)),
  ];

  final List tabBodies = [
    // LoginPage(),
    NewsPage(),
    PricePage(),
    LevelPage(),
    MemberPage(),
  ];
  int currentIndex = 0;
  var currentPage;

  @override
  void initState() {
    currentPage = tabBodies[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTabs,
        onTap: (index) {
          if (mounted) {
            setState(() {
              currentIndex = index;
              currentPage = tabBodies[index];
            });
          }
        },
      ),
      body: currentPage,
    );
  }
}
