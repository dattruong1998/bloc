import 'dart:async';
import 'bloc_event.dart';
import 'bloc_state.dart';

class CounterBloc {
  var state = BlocState(0);

  final eventController = StreamController<CounterEvent>();

  final stateController = StreamController<BlocState>();

  CounterBloc(){
    eventController.stream.listen((CounterEvent event) {
      if (event is IncrementEvent) {
        state.count++;
        state = BlocState(state.count);
      }
      stateController.sink.add(state);
    });
  }

  void dispose() {
    stateController.close();
    eventController.close();
  }
}