import 'package:flutter_test/flutter_test.dart';
import 'package:smart_calculator/domain/model/input_model.dart';
import 'package:smart_calculator/domain/validate_input_usecase.dart';

void main() {
  group('Test validation, good input, bad input', () {
    test('Validation should be true for good input', () {
      final validateInput = ValidateInputUseCase();

      bool result =
          validateInput(InputModel(first: "4", operator: "*", second: "5"));

      expect(result, true);
    });

    test('Validation should be false for bad first input', () {
      final validateInput = ValidateInputUseCase();

      bool result =
          validateInput(InputModel(first: "#", operator: "-", second: "5"));

      expect(result, false);
    });

    test('Validation should be false for bad second input', () {
      final validateInput = ValidateInputUseCase();

      bool result =
          validateInput(InputModel(first: "4", operator: "-", second: "#"));

      expect(result, false);
    });

    test('Validation should be false for bad operator input', () {
      final validateInput = ValidateInputUseCase();

      bool result =
          validateInput(InputModel(first: "4", operator: "4", second: "9"));

      expect(result, false);
    });
  });
}
