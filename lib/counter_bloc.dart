

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_listerner_and_builder/counter_event.dart';
import 'package:flutter_bloc_listerner_and_builder/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent,CounterState>{

  CounterBloc():super(CounterInitialState(count: 0)){

    on<CounterIncrementEvent>((event,emit){
        emit(CounterIncrementState(incCount: event.incCount + 1));
    });

    on<CounterDecrementEvent>((event,emit){
      emit(CounterDecrementState(decCount: event.decCount - 1));
    });
  }
}