part of 'newspaper_bloc.dart';

@immutable
abstract class NewspaperState extends Equatable {
  const NewspaperState();

  @override
  List<Object> get props => [];
}

class NewspaperInitial extends NewspaperState {
  @override
  String toString() {
    return "NewspaperInitial";
  }
}

class AllNewsPaperLoaded extends NewspaperState {
  final List<NewsPaperData> newsPaperList;

  AllNewsPaperLoaded({this.newsPaperList});
  @override
  String toString() {
    return "AllNewsPaperLoaded";
  }
}

class SubNewsPaperLoaded extends NewspaperState {
  final List<NewsPaperData> newsPaperList;
  SubNewsPaperLoaded({this.newsPaperList});
  @override
  String toString() {
    return "SubNewsPaperLoaded";
  }
}

class LoadingNewsPaper extends NewspaperState {
  const LoadingNewsPaper();
  @override
  String toString() {
    return "LoadingCarList";
  }
}

class FailedFetchData extends NewspaperState {
  final String errorMessage;

  FailedFetchData({this.errorMessage});

  @override
  String toString() {
    return "FailedFetchData";
  }
}
