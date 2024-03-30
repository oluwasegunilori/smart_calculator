import 'package:smart_calculator/domain/model/input_model.dart';
import 'package:smart_calculator/domain/usecase/validate_input_usecase.dart';

class CalculateAnswerUseCase {
  final ValidateInputUseCase validateInputUseCase;
  CalculateAnswerUseCase({required this.validateInputUseCase});
  double? call(InputModel data) {
    if (validateInputUseCase(data)) {
      return 0.0;
    } else {
      return null;
    }
  }
}
