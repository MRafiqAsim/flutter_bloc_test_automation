import 'package:bloc_test/bloc_test.dart';
import 'package:blocexample/cubit/counter_cubit.dart';
import 'package:blocexample/cubit/counter_sate.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main (){
  group("CounterCubit",(){
    CounterCubit counterCubit=CounterCubit();
    setUp((){
      counterCubit=CounterCubit();
    });
    tearDown((){
      counterCubit.close();
    });
    test('initial state of the CounterCubit is 0 and isIncremented set to false.', (){
      expect(counterCubit.state,  const CounterState(counterVal: 0, isIncrement: false));
    });

    blocTest('The cubit shout emit the a CounterState with values of CounterVal: 1 and isIncremented: true when increment() function is called. ',
      build: () => counterCubit,
      act: (CounterCubit cu)=> cu.increment(),
      expect: ()=> [const CounterState(counterVal: 1, isIncrement: true)],);

    blocTest('The cubit shout emit the a CounterState with values of CounterVal: -1 and isIncremented: false when decrement() function is called. ',
      build: () => counterCubit,
      act: (CounterCubit cu)=> cu.decrement(),
      expect: ()=> [const CounterState(counterVal: -1, isIncrement: false)],);

  } );

}