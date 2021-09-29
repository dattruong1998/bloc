import 'package:flutter/material.dart';

import 'bloc_event.dart';
import 'bloc_state.dart';
import 'counter_bloc.dart';

class BlocApp extends StatelessWidget {

  CounterBloc counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            counterBloc.eventController.add(IncrementEvent());
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(),
        body: Center(
          child: StreamBuilder<BlocState>(
            stream: counterBloc.stateController.stream,
            initialData: counterBloc.state,
            builder: (context,AsyncSnapshot<BlocState> state){
              return Text("${counterBloc.state.count}");
            },
          ),
        ) ,
      ),
    );
  }
}
