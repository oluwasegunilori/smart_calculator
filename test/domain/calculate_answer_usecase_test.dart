import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smart_calculator/domain/model/input_model.dart';
import 'package:smart_calculator/domain/usecase/calculate_answer_usecase.dart';
import 'package:smart_calculator/domain/usecase/validate_input_usecase.dart';

import 'calculate_answer_usecase_test.mocks.dart';

@GenerateMocks([ValidateInputUseCase])
void main() {
  final mockValidateInputUseCase = MockValidateInputUseCase();
  CalculateAnswerUseCase testSubject;

  group("Answer calculator test", () {
    setUp(() {
      when(mockValidateInputUseCase.call(any))
          .thenAnswer((realInvocation) => false);
    });
    testSubject =
        CalculateAnswerUseCase(validateInputUseCase: mockValidateInputUseCase);
    test("should return null with invalid input", () {
      var result = testSubject.call(const InputModel(firstNoSign: ""));
      expect(null, result);
    });
  });
}
