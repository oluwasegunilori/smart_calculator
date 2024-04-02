import 'package:equatable/equatable.dart';
import 'package:smart_calculator/domain/model/input_model.dart';

sealed class InputCalculatorState extends Equatable {
  final data = const InputModel();
}

class InitialState extends InputCalculatorState {
  final InputModel data;
  InitialState(this.data);
  factory InitialState.clean() {
    return InitialState(const InputModel());
  }
  @override
  List<Object> get props => [data];
}

class FirstNumberState extends InputCalculatorState {
  final InputModel data;
  FirstNumberState(this.data);
  @override
  List<Object> get props => [data];
}

class SecondNumberState extends InputCalculatorState {
  final InputModel data;
  SecondNumberState(this.data);
  @override
  List<Object> get props => [data];
}

class AnswerState extends InputCalculatorState {
  final InputModel data;
  final String answer;

  AnswerState(this.answer, this.data);

  @override
  List<Object> get props => [answer, data];
}
