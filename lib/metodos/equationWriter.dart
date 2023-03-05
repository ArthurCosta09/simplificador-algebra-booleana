import 'package:flutter/material.dart';

TextStyle notStyle = const TextStyle(
    fontSize: 18,
    color: Colors.white,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.overline);

Padding resultEquation(String answer) {
  List<Text> output = [];

  if (answer.contains("+")) {
    List subEquations = answer.split("+");
    for (var equation in subEquations) {
      equation = equation.split("");

      if (equation.contains("'")) {
        for (int i = 0; i < equation.length; i++) {
          if (i != equation.length - 1) {
            if (equation[i] == "'") {
              continue;
            } else {
              if (equation[i + 1] == "'") {
                output.add(addText(equation[i], notStyle));
              } else {
                output.add(addText(equation[i]));
              }
            }
          } else if (equation[i] != "'") {
            output.add(addText(equation[i]));
          }
        }
      } else {
        output.add(addText(equation.join("")));
      }
      if (subEquations.last != equation.join("")) {
        output.add(addText(" + "));
      }
    }
  } else if (answer.contains("'")) {
    List subEquations = answer.split("");
    for (int i = 0; i < answer.length; i++) {
      if (i != answer.length - 1) {
        if (answer[i] == "'") continue;
        if (answer[i + 1] == "'") {
          output.add(addText(answer[i], notStyle));
        } else {
          output.add(addText(answer[i]));
        }
      } else if (answer[i] != "'") {
        output.add(addText(answer[i]));
      }
    }
  } else {
    output.add(addText(answer));
  }

  return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 105),
      child: Row(children: output));
}

Text addText(var variable,
    [TextStyle textStyle = const TextStyle(
      fontSize: 22,
      color: Colors.white,
      fontWeight: FontWeight.w400,
    )]) {
  return Text(variable, style: textStyle);
}
