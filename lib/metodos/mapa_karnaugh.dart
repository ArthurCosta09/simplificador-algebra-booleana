import 'package:flutter/material.dart';
import "dart:math";
import "kMap_pos.dart";
import "simplifier.dart";

List kMap(Map truthTable, Map inputs) {
  List inputLetter = inputs.keys.toList();
  var keyList = truthTable.keys.toList();
  int inpSize = keyList.length.toInt();
  int keySize = keyList[0].toString().length;
  int delimeter =
      (keySize % 2 == 0) ? (keySize ~/ 2) : ((keySize ~/ 2).round());

  List<String> rowInputs = [];
  List<String> colInputs = [];

  int colSize =
      pow(2, keyList[0].toString().substring(0, delimeter).length).toInt();
  colSize = (keySize % 2 == 0) ? colSize : 2 * colSize;
  for (int i = 0; i < inpSize; i = i + colSize) {
    var col = truthTable.keys.toList()[i].toString().substring(0, delimeter);
    colInputs.add(col);
  }

  int rowSize =
      pow(2, keyList[0].toString().substring(delimeter, keySize).length)
          .toInt();
  for (int i = 0; i < colSize; i++) {
    var row =
        truthTable.keys.toList()[i].toString().substring(delimeter, keySize);
    rowInputs.add(row);
  }

  rowInputs = kMapPos(rowInputs);
  colInputs = kMapPos(colInputs);

  print(rowInputs);
  print(colInputs);

  List<List> kMap = [];
  for (int i = 0; i < rowInputs.length; i++) {
    List row = [];
    for (int j = 0; j < colInputs.length; j++) {
      var key = rowInputs[i] + colInputs[j];
      row.add(truthTable[key]);
    }
    kMap.add(row);
  }

  List<List> inps = [];
  inps.add(inputLetter.sublist(0, delimeter));
  inps.add(inputLetter.sublist(delimeter));

  String answer = simplifier(kMap, rowInputs, colInputs, inps);

  return kMap;
}
