import 'package:flutter/material.dart';
import 'package:sortedmap/sortedmap.dart';
import "tab_verdade.dart";
import "mapa_karnaugh.dart";
import 'simplifier.dart';

final operadores = ["+", "*", "!"];

void calculo(String equacao) {
  var eqList = equacao.split("");

  Map<String, int> inputs = SortedMap(const Ordering.byKey());
  eqList.forEach((element) {
    if (!operadores.contains(element) && element != "(" && element != ")") {
      inputs[element] =
          !inputs.containsKey(element) ? (1) : (inputs[element]! + 1);
    }
  });

  List<String> inps = inputs.keys.toList();
  print(inps.length);

  Map tabVerdade = tabelaVerdade(equacao, inputs);
  print(tabVerdade);

  List mapaKPack = kMap(tabVerdade, inputs);
  List mapaK = mapaKPack[0];
  List rowInputs = mapaKPack[1];
  List colInputs = mapaKPack[2];

  print(mapaK);
  print(simplifier(mapaK, inps, rowInputs, colInputs));
}
