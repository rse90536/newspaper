import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_newspaper/model/newspaper.dart';
import 'package:meta/meta.dart';

import '../shared_data.dart';

part 'newspaper_event.dart';

part 'newspaper_state.dart';

class NewspaperBloc extends Bloc<NewspaperEvent, NewspaperState> {
  NewspaperBloc() : super(NewspaperInitial());

  @override
  Stream<NewspaperState> mapEventToState(
    NewspaperEvent event,
  ) async* {
    if (event is GetAllNewspaperEvent) {
      yield LoadingNewsPaper();
      try {
        await Future.delayed(Duration(seconds: 2), () async* {
          yield AllNewsPaperLoaded(newsPaperList: SharedData.newsPaperList);
        });
      } catch (e) {
        yield FailedFetchData(errorMessage: e.toString());
      }
    }else if(event is GetSubNewspaperEvent){
      try {
        await Future.delayed(Duration(seconds: 2), () async* {
          yield SubNewsPaperLoaded(newsPaperList: SharedData.newsPaperList.where((element) =>element.isSubscribed).toList());
        });
      } catch (e) {
        yield FailedFetchData(errorMessage: e.toString());
      }
    }
  }
}
