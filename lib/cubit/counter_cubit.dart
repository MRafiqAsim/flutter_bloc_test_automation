import 'package:bloc/bloc.dart';
import 'package:blocexample/cubit/counter_sate.dart';

class CounterCubit extends Cubit<CounterState>
{
  CounterCubit() : super(CounterState( counterVal: 0,isIncrement: false));
  void increment(){
    emit(CounterState(counterVal: state.counterVal+1, isIncrement: true));
  }
  void decrement(){
    emit(CounterState(counterVal: state.counterVal-1, isIncrement: false));
  }
}