import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_newspaper/bloc/newspaper_bloc.dart';
import 'package:flutter_newspaper/model/newspaper.dart';
import 'package:flutter_newspaper/shared_data.dart';

import '../../newspaper_bloc_observer.dart';
import 'all_newspaper_view.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Bloc.observer = NewsPaperBlocObserver();
    SharedData.newsPaperList = [
      NewsPaperData(id: 0, newsPaperName: "聯合報", isSubscribed: false, money: "8"),
      NewsPaperData(id: 1, newsPaperName: "中國時報", isSubscribed: false, money: "10"),
      NewsPaperData(id: 2, newsPaperName: "蘋果日報", isSubscribed: false, money: "12"),
      NewsPaperData(id: 3, newsPaperName: "自由時報", isSubscribed: false, money: "14"),
      NewsPaperData(id: 4, newsPaperName: "中央日報", isSubscribed: false, money: "16"),
      NewsPaperData(id: 5, newsPaperName: "經濟日報", isSubscribed: false, money: "18"),
      NewsPaperData(id: 6, newsPaperName: "聯合晚報", isSubscribed: false, money: "20"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "訂閱報紙 Demo",
          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
      body: BlocProvider<NewspaperBloc>(
        create: (context) => NewspaperBloc(NewspaperInitial()),
        child: AllNewsPaperView(),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
