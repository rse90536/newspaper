import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_newspaper/bloc/newspaper_bloc.dart';
import 'package:flutter_newspaper/shared_data.dart';
import 'package:flutter_newspaper/ui/widget/newspaper_card.dart';

class AllNewsPaperView extends StatefulWidget {

  AllNewsPaperView({
    Key key,
  }) : super(key: key);

  @override
  _AllNewsPaperViewState createState() => _AllNewsPaperViewState();
}

//with AutomaticKeepAliveClientMixin
class _AllNewsPaperViewState extends State<AllNewsPaperView> {
  NewspaperBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<NewspaperBloc>(context);
    bloc.add(GetAllNewspaperEvent());
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
//    super.build(context);
    return Center(
      child: BlocBuilder<NewspaperBloc, NewspaperState>(
        builder: (context, state) {
          if (state is NewspaperInitial) {
            return CircularProgressIndicator();
          } else if (state is LoadingNewsPaper) {
            return CircularProgressIndicator();
          } else if (state is AllNewsPaperLoaded) {
            return ListView.builder(
                itemCount: state.newsPaperList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(3),
                    child: NewsPaperCard(state.newsPaperList[index]),
                  );
                });
          } else {
            return Container();
          }
        },
      ),
    );
  }


}
