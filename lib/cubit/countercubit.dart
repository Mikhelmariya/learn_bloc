import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/cubit/countercubit_state.dart';

class CounterCubit extends Cubit<CounterCubitState>{
  CounterCubit() : super(CounterCubitState(count: 0));
  void increment() => emit(CounterCubitState(count: state.count + 3));
  void decrement() => emit(CounterCubitState(count: state.count - 3));
 
}