import 'package:flutter/material.dart';
import 'package:sortedmap/sortedmap.dart';
import 'tabVerdade.dart';
import 'mapaKarnaugh.dart';
import 'simplifier.dart';
import 'equationWriter.dart';

final operadores = ["+", "*", "!"];

Padding calculo(String equacao) {
  var eqList = equacao.split("");

  Map<String, int> inputs = SortedMap(const Ordering.byKey());
  eqList.forEach((element) {
    if (!operadores.contains(element) && element != "(" && element != ")") {
      inputs[element] =
          !inputs.containsKey(element) ? (1) : (inputs[element]! + 1);
    }
  });

  List<String> inps = inputs.keys.toList();

  Map tabVerdade = tabelaVerdade(equacao, inputs);

  List mapaKPack = kMap(tabVerdade, inputs);
  List mapaK = mapaKPack[0];
  List<String> rowInputs = mapaKPack[1];
  List<String> colInputs = mapaKPack[2];

  return resultEquation(simplifier(mapaK, inps, rowInputs, colInputs));
}
