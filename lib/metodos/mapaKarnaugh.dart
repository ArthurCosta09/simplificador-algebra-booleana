import 'package:flutter/material.dart';
import "dart:math";
import 'kMapPos.dart';

List kMap(Map truthTable, Map inputs) {
  List kMap = [];
  int fillOneCounter = 0;
  List tableKeys = truthTable.keys.toList();
  List inps = inputs.keys.toList();
  int keySize = tableKeys[0].length;
  int delimeter = keySize ~/ 2;

  List<String> rowInputs = [];
  List<String> colInputs = [];

  for (String key in tableKeys) {
    colInputs.add(key.substring(0, delimeter));
    rowInputs.add(key.substring(delimeter, keySize));
  }

  rowInputs = rowInputs.toSet().toList();
  colInputs = colInputs.toSet().toList();
  rowInputs = kMapPos(rowInputs);
  colInputs = kMapPos(colInputs);

  print(rowInputs);
  print(colInputs);

  for (int i = 0; i < rowInputs.length; i++) {
    List row = [];
    for (int j = 0; j < colInputs.length; j++) {
      var tableKey = rowInputs[i] + colInputs[j];
      row.add(int.parse(truthTable[tableKey]));
    }
    if (row.every((number) => number == 1)) {
      fillOneCounter++;
    }
    kMap.add(row);
  }

  if (fillOneCounter >= rowInputs.length) kMap.clear();

  return [kMap, rowInputs, colInputs];
}
