import 'package:smart_calculator/domain/model/input_model.dart';

import '../core/utils/operator_utils.dart';

class ValidateInputUseCase {
  bool call(InputModel params) {
    bool validFirst = _isNumber(params.first);
    bool validSecond = _isNumber(params.second);
    bool validOperator = isArithmeticOperator(params.operator);

    return validFirst && validSecond && validOperator;
  }

  bool _isNumber(String input) {
    try {
      double.parse(input);
      return true;
    } catch (e) {
      return false;
    }
  }
}
