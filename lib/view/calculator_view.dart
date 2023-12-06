import 'package:calculator/common/button_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<Calculator> {
  var userQuestion = '';
  var result = '';

  final List<String> buttons = [
    'C',
    '*',
    '/',
    '<-',
    '1',
    '2',
    '3',
    '+',
    '4',
    '5',
    '6',
    '-',
    '7',
    '8',
    '9',
    '*',
    '%',
    '0',
    '.',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculator App',
          style: GoogleFonts.getFont('Josefin Sans'),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2.0,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.only(right: 20),
                      child: Text(
                        userQuestion,
                        style: GoogleFonts.blackOpsOne(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.only(right: 20),
                      child: Text(
                        result,
                        style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
              ),
              itemCount: buttons.length,
              itemBuilder: (BuildContext context, int index) {
                // clear button
                if (index == 0) {
                  return ButtonsView(
                    buttonText: buttons[index],
                    buttonColor: Colors.amber,
                    buttonTapped: () {
                      setState(() {
                        userQuestion = '';
                        result = '';
                      });
                    },
                  );
                }
                // delete button
                else if (index == 3) {
                  return ButtonsView(
                    buttonText: buttons[index],
                    buttonColor: Colors.blue,
                    buttonTapped: () {
                      setState(() {
                        userQuestion =
                            userQuestion.substring(0, userQuestion.length - 1);
                      });
                    },
                  );
                }
                // equal button
                else if (index == buttons.length - 1) {
                  return ButtonsView(
                    buttonColor: Colors.brown,
                    buttonText: buttons[index],
                    buttonTapped: () {
                      setState(() {
                        result = calculate();
                      });
                    },
                  );
                }
                // number or decimal point button
                else if (index >= 4 && index <= 18) {
                  return ButtonsView(
                    buttonColor: Colors.cyan,
                    buttonText: buttons[index],
                    buttonTapped: () {
                      setState(() {
                        // If the result is not empty, clear both userQuestion and result
                        if (result.isNotEmpty) {
                          userQuestion = '';
                          result = '';
                        }
                        userQuestion += buttons[index];
                      });
                    },
                  );
                }
                // rest of the buttons
                return ButtonsView(
                  buttonText: buttons[index],
                  buttonColor: Colors.deepPurple,
                  buttonTapped: () {
                    setState(() {
                      userQuestion += buttons[index];
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String calculate() {
    try {
      var exp = Parser().parse(userQuestion);
      var evaluation = exp.evaluate(EvaluationType.REAL, ContextModel());
      if (evaluation % 1 == 0) {
        return evaluation.toInt().toString();
      }
      return evaluation.toString();
    } catch (e) {
      return "Error";
    }
  }
}
