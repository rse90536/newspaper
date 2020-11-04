import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_newspaper/model/newspaper.dart';
import 'package:flutter_newspaper/shared_data.dart';

import 'all_newspaper_view.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: tabList.length);
    SharedData.newsPaperList = [
      NewsPaperData(newsPaperName: "聯合報", isSubscribed: false,money: "8"),
      NewsPaperData(newsPaperName: "中國時報", isSubscribed: false,money: "10"),
      NewsPaperData(newsPaperName: "蘋果日報", isSubscribed: false,money: "12"),
      NewsPaperData(newsPaperName: "自由時報", isSubscribed: false,money: "14"),
      NewsPaperData(newsPaperName: "中央日報", isSubscribed: false,money: "16"),
      NewsPaperData(newsPaperName: "經濟日報", isSubscribed: false,money: "18"),
      NewsPaperData(newsPaperName: "聯合晚報", isSubscribed: false,money: "20"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "訂閱報紙 Demo",
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700),
        ),
        bottom: TabBar(
          controller: tabController,
          indicatorColor: Colors.amber,
          tabs: tabList.map((choice) {
            return Tab(
              text: choice.title,
              icon: Icon(choice.icon),
            );
          }).toList(),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: <Widget>[
          AllNewsPaperView(),
          Center(
            child: Container(
              width: 100,
              height: 100,
              color: Colors.grey,
            ),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class TabChoice {
  final String title;
  final IconData icon;

  const TabChoice(this.title, this.icon);
}

const List<TabChoice> tabList = const <TabChoice>[
  TabChoice('報紙總覽', Icons.account_balance_wallet),
  TabChoice('已訂閱報紙', Icons.assignment_turned_in_rounded),
];
