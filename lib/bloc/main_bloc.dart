import 'dart:async';

import 'package:project/bloc/bloc_base.dart';

enum MainBlocEvent {
  incrementCounter
}

class MainBloc extends BlocBase {
  // data
  int counter = 0;

  final StreamController<int> counterController = StreamController<int>();
  final StreamController<MainBlocEvent> eventController =
  StreamController<MainBlocEvent>();

  Sink<int> get inCounter => counterController.sink;
  Stream<int> get outCounter => counterController.stream;

  Sink<MainBlocEvent> get inEvent => eventController.sink;
  Stream<MainBlocEvent> get outEvent => eventController.stream;

  MainBloc() {
    outEvent.listen(_handleEvent);
  }

  void onIncrementButton() {
    handleIncrementCounterEvent();
  }

  @override
  void dispose() {
    eventController.close();
    counterController.close();
  }

  void _handleEvent(MainBlocEvent event) {
    switch (event) {
      case MainBlocEvent.incrementCounter:
        handleIncrementCounterEvent();
        break;
      default:
        assert(false, "321 never reach");
        break;
    }
  }

  void handleIncrementCounterEvent() {
    inCounter.add(++counter);
  }
}