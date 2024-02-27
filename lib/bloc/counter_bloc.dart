import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/counter_event.dart';
import 'package:learn_bloc/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterIncrementEvent, CounterState> {
  // Initializing counterState
  CounterBloc() : super(CounterState(count: 0)) {
// Defining the event , when there is only one event
   on<CounterIncrementEvent>((event, emit) => emit(CounterState(count: state.count+1)));
    {
      // emit generates the updated state

      

    }
  
  }
}
