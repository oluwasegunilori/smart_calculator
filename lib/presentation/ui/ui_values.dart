import 'package:equatable/equatable.dart';
import 'package:smart_calculator/presentation/calculator/input_calculator_event.dart';

class InputValues extends Equatable {
  final String value;
  InputCalculatorEvent? event;
  InputValues({required this.value, this.event});

  @override
  List<Object?> get props => [value, event];
}

List<InputValues> uiList = [
  InputValues(
    value: "AC",
    event: ClearScreenEvent(),
  ),
  InputValues(value: "+/-"),
  InputValues(value: "%"),
  InputValues(value: "/", event: InputOperatorEvent("/")),
  InputValues(value: "7", event: InputNumberEvent("7")),
  InputValues(value: "8", event: InputNumberEvent("8")),
  InputValues(value: "9", event: InputNumberEvent("9")),
  InputValues(value: "X", event: InputOperatorEvent("*")),
  InputValues(value: "4", event: InputNumberEvent("4")),
  InputValues(value: "5", event: InputNumberEvent("5")),
  InputValues(value: "6", event: InputNumberEvent("6")),
  InputValues(value: "-", event: InputOperatorEvent("-")),
  InputValues(value: "1", event: InputNumberEvent("1")),
  InputValues(value: "2", event: InputNumberEvent("2")),
  InputValues(value: "3", event: InputNumberEvent("3")),
  InputValues(value: "+", event: InputOperatorEvent("+")),
  InputValues(value: "0", event: InputNumberEvent("0")),
  InputValues(value: "00", event: InputNumberEvent("00")),
  InputValues(value: ".", event: InputNumberEvent(".")),
  InputValues(
    value: "=",
    event: CalculateEvent(),
  ),
];
