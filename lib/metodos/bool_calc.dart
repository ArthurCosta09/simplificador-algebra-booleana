import 'package:eval_ex/expression.dart';
import 'package:flutter/material.dart';
import 'package:eval_ex/eval_ex.dart';
import 'package:sortedmap/sortedmap.dart';
import 'package:dart_random_choice/dart_random_choice.dart';
import "dart:math";
import "tab_verdade.dart";
import "mapa_karnaugh.dart";
import 'simplifier.dart';

final operadores = ["+", "*", "!"];

void calculo(String equacao) {
  var eqList = equacao.split("");

  Map inputs = SortedMap(const Ordering.byKey());
  eqList.forEach((element) {
    if (!operadores.contains(element) && element != "(" && element != ")") {
      inputs[element] =
          !inputs.containsKey(element) ? (1) : (inputs[element] + 1);
    }
  });

  print(inputs);

  Map tabVerdade = tabelaVerdade(equacao, inputs);
  print(tabVerdade);

  List mapaK = kMap(tabVerdade, inputs);
  print(mapaK);
}
