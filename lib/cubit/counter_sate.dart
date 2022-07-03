import 'package:equatable/equatable.dart';

class CounterState extends Equatable
{
   final int counterVal;
   final bool isIncrement;

  const CounterState({
    required this.counterVal,required this.isIncrement,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [counterVal, isIncrement];
}