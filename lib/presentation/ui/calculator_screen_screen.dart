import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_calculator/presentation/calculator/input_calculator_bloc.dart';
import 'package:smart_calculator/presentation/ui/ui_values.dart';

import '../calculator/input_calculator_state.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Smart Calculator",
              style: Theme.of(context).textTheme.headlineMedium),
          elevation: 30,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.only(bottom: 12),
                  child: BlocBuilder<InputCalculatorBloc, InputCalculatorState>(
                    builder: (context, state) {
                      if (state is AnswerState) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "${state.data.firstNoSign}${state.data.first} ${state.data.operator} ${state.data.second}",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              state.answer,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        );
                      } else {
                        return Text(
                          "${state.data.firstNoSign}${state.data.first} ${state.data.operator} ${state.data.second}",
                          style: Theme.of(context).textTheme.titleSmall,
                        );
                      }
                    },
                  ),
                ),
              ),
              Expanded(
                  flex: 5,
                  child: Container(
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, // number of columns
                        mainAxisSpacing: 12.0, // spacing between rows
                        crossAxisSpacing: 12.0, // spacing between columns
                      ),
                      itemCount: 20,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.purple.shade300,
                            borderRadius: BorderRadius.circular(
                                10), // Adjust the radius as needed
                          ),
                          child: Center(
                              child: TextButton(
                            onPressed: () {
                              var event = uiList[index].event;
                              if (event != null) {
                                BlocProvider.of<InputCalculatorBloc>(context)
                                    .add(event);
                              }
                            },
                            child: Text(
                              uiList[index].value,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 22),
                            ),
                          )),
                        );
                      },
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
