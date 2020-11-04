import 'package:bloc/bloc.dart';

class NewsPaperBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    print('NewsPaperBlocObserver onEvent：$bloc, $event');
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('NewsPaperBlocObserver onTransition：$bloc, $transition');
    super.onTransition(bloc, transition);
  }
}
