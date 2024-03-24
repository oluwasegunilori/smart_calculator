import 'dart:developer' as developer;

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:smart_calculator/domain/model/input_model.dart';

import 'input_calculator_event.dart';
import 'input_calculator_state.dart';

class InputCalculatorBloc
    extends Bloc<InputCalculatorEvent, InputCalculatorState> {
  InputCalculatorBloc(InputCalculatorState initialState)
      : super(InitialState.clean()) {
    on<InputNumberEvent>((event, emit) {
      if (state is InitialState) {
        emit(FirstNumberState(state.data.copyWith(first: event.no)));
      } else if (state is FirstNumberState) {
        if (state.data.operator.isNotEmpty) {
          emit(SecondNumberState(state.data.copyWith(second: event.no)));
        } else {
          emit(FirstNumberState(
              state.data.copyWith(first: state.data.first + event.no)));
        }
      } else if (state is SecondNumberState) {
        emit(SecondNumberState(
            state.data.copyWith(second: state.data.second + event.no)));
      }
    });

    on<InputOperatorEvent>((event, emit) {
      if (state is InitialState) {
        emit(InitialState(state.data.copyWith(firstNoSign: event.op)));
      } else if (state is FirstNumberState) {
        emit(FirstNumberState(state.data.copyWith(operator: event.op)));
      }
    });
  }
}
