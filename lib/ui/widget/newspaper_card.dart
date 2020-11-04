import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_newspaper/bloc/newspaper_bloc.dart';
import 'package:flutter_newspaper/model/newspaper.dart';
import 'package:flutter_newspaper/shared_data.dart';

class NewsPaperCard extends StatefulWidget {
  final NewsPaperData data;

  NewsPaperCard(
    this.data, {
    Key key,
  }) : super(key: key);

  @override
  _NewsPaperCardState createState() => _NewsPaperCardState();
}

class _NewsPaperCardState extends State<NewsPaperCard> {
  NewsPaperData data;

  @override
  void initState() {
    super.initState();
    data = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            child: Icon(Icons.assignment_turned_in_rounded, color: Colors.white),
          ),
          title: Text(
            "${data.newsPaperName}",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          subtitle: Text("\$${data.money}/月", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          trailing: IconButton(
            icon: (data.isSubscribed
                ? Icon(
                    Icons.star,
                    size: 30,
                  )
                : Icon(
                    Icons.star_border,
                    size: 30,
                  )),
            color: Colors.red[500],
            onPressed: _clickSubscribed,
          ),
        ),
      ),
    );
  }

  void _clickSubscribed() {
    setState(() {
      if (data.isSubscribed) {
        data.isSubscribed = false;
        SharedData.newsPaperList.firstWhere((element) => element.id == data.id).isSubscribed = false;
        _showToast(context, "已取消訂閱 ${data.newsPaperName}");
      } else {
        data.isSubscribed = true;
        SharedData.newsPaperList.firstWhere((element) => element.id == data.id).isSubscribed = true;
        _showToast(context, "已訂閱 ${data.newsPaperName}");
      }
    });
  }

  void _showToast(BuildContext context, String str) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        content: Text('$str', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
