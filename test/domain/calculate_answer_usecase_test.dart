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
  testSubject =
      CalculateAnswerUseCase(validateInputUseCase: mockValidateInputUseCase);

  group("Answer calculator test invalid inpur", () {
    setUp(() {
      when(mockValidateInputUseCase.call(any))
          .thenAnswer((realInvocation) => false);
    });

    test("should return null with invalid input", () {
      var result = testSubject.call(const InputModel(firstNoSign: ""));
      expect(null, result);
    });
  });
  group("Answer calculator test valid input", () {
    setUp(() {
      when(mockValidateInputUseCase.call(any))
          .thenAnswer((realInvocation) => true);
    });
    test("should return Nan if second number is zero and operation is division",
        () {
      var result = testSubject.call(const InputModel(
          firstNoSign: "-", first: "2", second: "0", operator: "/"));
      expect(nan, result);
    });

    test("should return correct integer answer when operation is division", () {
      var result = testSubject
          .call(const InputModel(first: "100", second: "25", operator: "/"));
      expect("4", result);
    });

    test("should return correct decimal answer when operation is division", () {
      var result = testSubject.call(const InputModel(
          firstNoSign: "-", first: "4", second: "8", operator: "/"));
      expect("-0.5", result);
    });

    test("should return correct  answer when operation is division", () {
      var result = testSubject.call(const InputModel(
          firstNoSign: "-", first: "0", second: "8", operator: "/"));
      expect("0", result);
    });

    test("should return correct  answer when operation is subtraction", () {
      var result = testSubject.call(const InputModel(
          firstNoSign: "-", first: "0", second: "-8", operator: "-"));
      expect("8", result);
    });
  });
}
