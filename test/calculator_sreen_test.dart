// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:smart_calculator/domain/model/input_model.dart';
import 'package:smart_calculator/domain/usecase/calculate_answer_usecase.dart';
import 'package:smart_calculator/domain/usecase/validate_input_usecase.dart';

import 'package:smart_calculator/main.dart';
import 'package:smart_calculator/presentation/calculator/input_calculator_bloc.dart';
import 'package:smart_calculator/presentation/calculator/input_calculator_event.dart';
import 'package:smart_calculator/presentation/calculator/input_calculator_state.dart';
import 'package:smart_calculator/presentation/ui/calculator_screen_screen.dart';
import 'package:smart_calculator/presentation/ui/ui_values.dart';
import 'package:mocktail/mocktail.dart';

import 'presentation/calculator/input_calculator_bloc_test.mocks.dart';

class MockInputCalculatorBloc
    extends MockBloc<InputCalculatorEvent, InputCalculatorState>
    implements InputCalculatorBloc {}

void registerFallbackValues() {
  registerFallbackValue(InitialState.clean());
  registerFallbackValue(InputNumberEvent(""));
}

void main() {
  final mockInputCalculatorBloc = MockInputCalculatorBloc();
  final mockCalculateAnswerUseCase = MockCalculateAnswerUseCase();
  setUp(() {
    registerFallbackValues();
  });
  testWidgets('Should display all calculator input on ui',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // final mockInputCalculatorBloc = InputBlockMock();
    when(() => mockInputCalculatorBloc.state)
        .thenAnswer((realInvocation) => InitialState.clean());
    await tester.pumpWidget(
      MaterialApp(
          home: BlocProvider.value(
              value: InputCalculatorBloc(mockCalculateAnswerUseCase),
              child: CalculatorScreen())),
    );

    uiList.take(12).forEach((element) {
      expect(find.text(element.value, skipOffstage: false), findsOneWidget);
    });
  });
}
