import 'package:eval_ex/expression.dart';
import 'package:flutter/material.dart';
import 'package:eval_ex/eval_ex.dart';
import 'package:sortedmap/sortedmap.dart';
import 'package:dart_random_choice/dart_random_choice.dart';
import "dart:math";

Map tabelaVerdade(String equacao, Map inputs) {
  Map bins = {"0": "false", "1": "true"};
  var numBin = ["0", "1"];
  int numVars = pow(2, inputs.keys.length).toInt();
  var newEq = equacao
      .replaceAll("+", " || ")
      .replaceAll("*", " && ")
      .replaceAll("!", "NOT");
  Map newInputs = Map.of(inputs);

  Map truthTable = SortedMap(const Ordering.byKey());
  while (numVars > 0) {
    var inp = "";
    inputs.keys.toList().forEach((key) {
      newInputs[key] = randomChoice(numBin);
      inp = inp + newInputs[key];
    });

    if (!truthTable.containsKey(inp)) {
      Expression exp = Expression(newEq);
      inputs.keys.toList().forEach((key) {
        exp.setStringVariable(key, bins[newInputs[key]]);
      });

      truthTable[inp] = exp.eval().toString();
      numVars--;
    }
  }

  return truthTable;
}
