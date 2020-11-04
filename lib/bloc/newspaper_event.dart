part of 'newspaper_bloc.dart';

@immutable
abstract class NewspaperEvent extends Equatable {
  const NewspaperEvent();
  @override
  List<Object> get props => [];
}

class GetAllNewspaperEvent extends NewspaperEvent{

}

class GetSubNewspaperEvent extends NewspaperEvent{

}
