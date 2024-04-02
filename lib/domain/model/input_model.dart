import 'package:equatable/equatable.dart';

class InputModel extends Equatable {
  final String firstNoSign;
  final String first;
  final String operator;
  final String second;

  const InputModel(
      {this.firstNoSign = "",
      this.first = "",
      this.operator = "",
      this.second = ""});

  InputModel copyWith(
      {String? firstNoSign, String? first, String? operator, String? second}) {
    return InputModel(
        firstNoSign: firstNoSign ?? this.firstNoSign,
        first: first ?? this.first,
        operator: operator ?? this.operator,
        second: second ?? this.second);
  }

  @override
  String toString() {
    return "$firstNoSign$first $operator $second";
  }

  @override
  List<Object> get props => [firstNoSign, first, operator, second];
}
