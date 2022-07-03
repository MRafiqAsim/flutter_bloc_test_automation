import 'package:bloc/bloc.dart';
import 'counter_sate.dart';

class CounterCubit extends Cubit<CounterState>
{
  CounterCubit() : super( const CounterState( counterVal: 0,isIncrement: false));
  void increment(){
    emit(CounterState(counterVal: state.counterVal+1, isIncrement: true));
  }
  void decrement(){
    emit(CounterState(counterVal: state.counterVal-1, isIncrement: false));
  }
}