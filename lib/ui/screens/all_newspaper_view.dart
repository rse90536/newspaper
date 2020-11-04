import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_newspaper/shared_data.dart';
import 'package:flutter_newspaper/ui/widget/newspaper_card.dart';

class AllNewsPaperView extends StatefulWidget {
  AllNewsPaperView({
    Key key,
  }) : super(key: key);

  @override
  _AllNewsPaperViewState createState() => _AllNewsPaperViewState();
}

class _AllNewsPaperViewState extends State<AllNewsPaperView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
          itemCount: SharedData.newsPaperList.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(3),
              child: NewsPaperCard(index),
            );
          }),
    );
  }
}
