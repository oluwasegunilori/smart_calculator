import 'package:equatable/equatable.dart';

abstract class InputCalculatorEvent extends Equatable {}

class InputNumberEvent extends InputCalculatorEvent {
  final String no;

  InputNumberEvent(this.no);

  @override
  List<Object> get props => [no];
}

class InputOperatorEvent extends InputCalculatorEvent {
  final String op;

  InputOperatorEvent(this.op);

  @override
  List<Object> get props => [op];
}
