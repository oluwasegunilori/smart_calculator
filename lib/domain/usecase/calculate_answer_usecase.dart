import 'package:smart_calculator/domain/model/input_model.dart';
import 'package:smart_calculator/domain/usecase/validate_input_usecase.dart';

const nan = "Nan";

class CalculateAnswerUseCase {
  final ValidateInputUseCase validateInputUseCase;
  CalculateAnswerUseCase({required this.validateInputUseCase});
  String? call(InputModel data) {
    if (validateInputUseCase(data)) {
      return _calculateAnswer(data);
    } else {
      return null;
    }
  }

  String? _calculateAnswer(InputModel data) {
    var secondNumber = num.parse(data.second);
    if (secondNumber == 0) {
      if (data.operator == "/" && secondNumber.toInt() == 0) {
        return nan;
      }
    }
    var firstNumber = num.parse(data.first);
    if (data.firstNoSign == "-") {
      firstNumber = 0 - firstNumber;
    }
    num answer = (firstNumber / secondNumber);
    if (_isDecimal(answer)) {
      return answer.toString();
    } else {
      return answer.toInt().toString();
    }
  }

  bool _isDecimal(num number) {
    // Check if the number is not an integer
    return number % 1 != 0;
  }
}
