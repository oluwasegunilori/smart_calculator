import 'package:flutter_test/flutter_test.dart';
import 'package:smart_calculator/domain/model/input_model.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:smart_calculator/presentation/calculator/input_calculator_bloc.dart';
import 'package:smart_calculator/presentation/calculator/input_calculator_event.dart';
import 'package:smart_calculator/presentation/calculator/input_calculator_state.dart';

void main() {
  group('Test state changes', () {
    InputCalculatorBloc inputBloc = InputCalculatorBloc(InitialState.clean());
    setUp(() {
      inputBloc = InputCalculatorBloc(InitialState.clean());
    });

    tearDown(() {
      inputBloc.close();
    });

    test('should emit initialstate as first state', () {
      expect(InitialState.clean(), inputBloc.state);
    });

    blocTest(
      'should emit firstinputstate when input event is called on initial state',
      build: () => inputBloc = InputCalculatorBloc(InitialState.clean()),
      act: (bloc) => bloc.add(InputNumberEvent("2")),
      expect: () => [FirstNumberState(const InputModel(first: "2"))],
    );

    blocTest(
      'should append number to firstinput state when input event is called on first input state',
      build: () => inputBloc,
      act: (bloc) {
        bloc.emit(FirstNumberState(const InputModel(first: "2")));
        bloc.add(InputNumberEvent("2"));
      },
      expect: () => [
        FirstNumberState(const InputModel(first: "2")),
        FirstNumberState(const InputModel(first: "22"))
      ],
    );
    blocTest(
      'should append operator when operator event is called',
      build: () {
        return inputBloc;
      },
      act: (bloc) {
        bloc.emit(FirstNumberState(const InputModel(first: "23")));
        bloc.add(InputOperatorEvent("-"));
      },
      expect: () => [
        FirstNumberState(const InputModel(first: "23")),
        FirstNumberState(const InputModel(first: "23", operator: "-"))
      ],
    );

    blocTest(
      'should replace operator when subsequent operators are sent before first number',
      build: () {
        return inputBloc;
      },
      act: (bloc) {
        bloc.add(InputOperatorEvent("-"));
        bloc.add(InputOperatorEvent("-"));
        bloc.add(InputOperatorEvent("+"));
      },
      expect: () => [
        InitialState(const InputModel(firstNoSign: "-")),
        InitialState(const InputModel(firstNoSign: "+")),
      ],
    );

    blocTest(
      'should add second number after operator',
      build: () => inputBloc,
      act: (bloc) {
        bloc.emit(
            FirstNumberState(const InputModel(first: "2", operator: "*")));
        bloc.add(InputNumberEvent("2"));
        bloc.add(InputNumberEvent("2"));
      },
      expect: () => [
        FirstNumberState(const InputModel(first: "2", operator: "*")),
        SecondNumberState(
            const InputModel(first: "2", operator: "*", second: "2")),
        SecondNumberState(
            const InputModel(first: "2", operator: "*", second: "22"))
      ],
    );
  });
}
