import 'package:get_it/get_it.dart';
import 'package:smart_calculator/domain/usecase/calculate_answer_usecase.dart';
import 'package:smart_calculator/domain/usecase/validate_input_usecase.dart';
import 'package:smart_calculator/presentation/calculator/input_calculator_bloc.dart';

final di = GetIt.instance;

Future<void> init() async {
  //blocs
  di.registerFactory<InputCalculatorBloc>(() => InputCalculatorBloc(di.call()));

  //Usecase
  di.registerFactory<CalculateAnswerUseCase>(
      () => CalculateAnswerUseCase(validateInputUseCase: di.call()));
  di.registerFactory<ValidateInputUseCase>(() => ValidateInputUseCase());
}
