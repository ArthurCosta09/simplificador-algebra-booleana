import 'package:flutter/material.dart';

List<String> kMapPos(List<String> vars) {
  List<String> newPos = List.of(vars);
  int lower = 2;
  int upper = vars.length;
  if (upper != 2 && upper <= 4) {
    var lowVar = newPos[lower];
    newPos[lower] = newPos[upper - 1];
    newPos[upper - 1] = lowVar;
  } else if (upper > 4) {
    List subLists = [];
    int numSubList = upper ~/ 8;
    print(numSubList);
    int low = 0;
    int up = 8;
    for (int i = 0; i < numSubList; i++) {
      List sub = [];
      for (int j = low; j < up; j++) {
        sub.add(vars[j]);
      }
      subLists.add(sub);
      low += 8;
      up += 8;
    }

    for (int i = 0; i < subLists.length; i++) {
      var lowVar = subLists[i][2];
      subLists[i][2] = subLists[i][3];
      subLists[i][3] = lowVar;

      var var1 = subLists[i][4];
      var var2 = subLists[i][5];
      var var3 = subLists[i][6];
      var var4 = subLists[i][7];

      subLists[i][4] = var3;
      subLists[i][5] = var4;
      subLists[i][6] = var2;
      subLists[i][7] = var1;
    }

    newPos = [];
    subLists.forEach((sub) {
      newPos.addAll(sub);
    });
  }

  return newPos;
}
