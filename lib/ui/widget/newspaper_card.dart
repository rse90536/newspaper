import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_newspaper/shared_data.dart';

class NewsPaperCard extends StatefulWidget {
  final int  index;
  NewsPaperCard(this.index,{
    Key key,
  }) : super(key: key);

  @override
  _NewsPaperCardState createState() => _NewsPaperCardState();
}

class _NewsPaperCardState extends State<NewsPaperCard> {
  int index;
  @override
  void initState() {
    super.initState();
    index = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            child:
                Icon(Icons.assignment_turned_in_rounded, color: Colors.white),
          ),
          title: Text(
            "${SharedData.newsPaperList[index].newsPaperName}",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          subtitle: Text("\$${SharedData.newsPaperList[index].money}/月", style: TextStyle(color: Colors.black)),
          trailing: IconButton(
            icon: (SharedData.newsPaperList[index].isSubscribed
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
      if (SharedData.newsPaperList[index].isSubscribed) {
        SharedData.newsPaperList[index].isSubscribed = false;
      } else {
        SharedData.newsPaperList[index].isSubscribed = true;
      }
    });
  }
}
