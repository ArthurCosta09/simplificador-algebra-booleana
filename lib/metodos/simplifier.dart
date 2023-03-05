import 'package:flutter/material.dart';
import 'simpleEq.dart';

String simplifier(List kMap, List<String> inputs, List<String> rowInputs,
    List<String> colInputs) {
  if (kMap.isEmpty) {
    return "1";
  }

  List output = [];
  if (inputs.length == 2) {
    List inpRow = inputs.sublist(0, 1);
    List inpCol = inputs.sublist(1);
    for (int i = 0; i < 2; i++) {
      List row = kMap[i];
      if (!row.any((element) => element == 1)) continue;
      for (int j = 0; j < 2; j++) {
        if (row.every((element) => element == 1) && j == 0) {
          output.add(simpleEq(
              inputs: [inpRow, inpCol],
              columns: [colInputs[0], colInputs[1]],
              rows: [rowInputs[i]]));
        }
        if (i == 0) {
          if (row[j] == 1 && kMap[1][j] == 1) {
            output.add(simpleEq(
                inputs: [inpRow, inpCol],
                rows: [rowInputs[0], rowInputs[1]],
                columns: [colInputs[j]]));
          }
          if (row[j] == 1 &&
              kMap[1][j] != 1 &&
              !row.every((element) => element == 1)) {
            output.add(simpleEq(
                inputs: [inpRow, inpCol],
                rows: [rowInputs[i]],
                columns: [colInputs[j]]));
          }
        } else if (i == 1 && !row.every((element) => element == 1)) {
          if (row[j] == 1 && kMap[0][j] != 1) {
            output.add(simpleEq(
                inputs: [inpRow, inpCol],
                rows: [rowInputs[i]],
                columns: [colInputs[j]]));
          }
        }
      }
    }
  } else if (inputs.length == 3) {
    bool verticalChecker = false;
    List inpRow = inputs.sublist(0, 2);
    List inpCol = inputs.sublist(2);

    for (int i = 0; i < rowInputs.length; i++) {
      List row = kMap[i];
      if (!row.any((element) => element == 1)) {
        continue;
      }
      for (int j = 0; j < colInputs.length; j++) {
        if (i == 0) {
          if (row.every((element) => element == 1) && j == 0) {
            if (kMap[3].every((element) => element == 1)) {
              output.add(simpleEq(
                  inputs: [inpRow, inpCol],
                  rows: [rowInputs[0], rowInputs[3]],
                  columns: [colInputs[0], colInputs[1]]));
            }
            if (kMap[1].every((element) => element == 1)) {
              output.add(simpleEq(
                  inputs: [inpRow, inpCol],
                  rows: [rowInputs[0], rowInputs[1]],
                  columns: [colInputs[0], colInputs[1]]));
            } else if (!kMap[1].every((element) => element == 1) &&
                !kMap[3].every((element) => element == 1)) {
              output.add(simpleEq(
                  inputs: [inpRow, inpCol],
                  rows: [rowInputs[0]],
                  columns: [colInputs[0], colInputs[1]]));
            }
          }
          if (row[j] == 1) {
            if (kMap[0][j] == 1 &&
                kMap[1][j] == 1 &&
                (kMap[2][j] != 1 || kMap[3][j] != 1) &&
                (!kMap[1].every((element) => element == 1) ||
                    !kMap[0].every((element) => element == 1))) {
              output.add(simpleEq(
                  inputs: [inpRow, inpCol],
                  columns: [colInputs[j]],
                  rows: [rowInputs[0], rowInputs[1]]));
            } else if (kMap[0][j] == 1 &&
                kMap[1][j] == 1 &&
                kMap[2][j] == 1 &&
                kMap[3][j] == 1) {
              verticalChecker = true;
              output.add(simpleEq(inputs: inpCol, columns: [colInputs[j]]));
            } else if (kMap[0][j] == 1 &&
                kMap[1][j] != 1 &&
                kMap[2][j] != 1 &&
                kMap[3][j] == 1 &&
                (!kMap[3].every((element) => element == 1) ||
                    !row.every((element) => element == 1))) {
              output.add(simpleEq(
                  inputs: [inpRow, inpCol],
                  columns: [colInputs[j]],
                  rows: [rowInputs[0], rowInputs[3]]));
            }
          }
        } else if (i == 1 || i == 2) {
          bool isFull = row.every((element) => element == 1);
          if (isFull && j == 0) {
            if (kMap[i + 1].every((element) => element == 1)) {
              output.add(simpleEq(
                  inputs: [inpRow, inpCol],
                  columns: [colInputs[0], colInputs[1]],
                  rows: [rowInputs[i], rowInputs[i + 1]]));
            } else if (!kMap[i - 1].every((element) => element == 1) &&
                !kMap[i + 1].every((element) => element == 1)) {
              output.add(simpleEq(
                  inputs: [inpRow, inpCol],
                  columns: [colInputs[0], colInputs[1]],
                  rows: [rowInputs[i]]));
            }
          }
          bool checker = kMap[i + 1].every((element) => element == 1);
          if (row[j] == 1) {
            if (kMap[i + 1][j] == 1 &&
                (!checker || !isFull) &&
                !verticalChecker) {
              output.add(simpleEq(
                  inputs: [inpRow, inpCol],
                  columns: [colInputs[j]],
                  rows: [rowInputs[i], rowInputs[i + 1]]));
            }
          }
        } else {
          if (row.every((element) => element == 1) && j == 0) {
            if (!kMap[2].every((element) => element == 1) &&
                !kMap[0].every((element) => element == 1)) {
              output.add(simpleEq(
                  inputs: [inpRow, inpCol],
                  columns: [colInputs[0], colInputs[1]],
                  rows: [rowInputs[3]]));
            }
          }
        }
      }
    }
  } else {
    List vertChecker = [];
    List horChecker = [];
    kMap.forEach((row) {
      if (row.every((element) => element == 1)) {
        horChecker.add(true);
      } else {
        horChecker.add(false);
      }
    });
    kMap[0].asMap().forEach((index, element) {
      if (kMap[0][index] == 1 &&
          kMap[1][index] == 1 &&
          kMap[2][index] == 1 &&
          kMap[3][index] == 1) {
        vertChecker.add(true);
      } else {
        vertChecker.add(false);
      }
    });

    List<String> inpRow = inputs.sublist(0, 2);
    List<String> inpCol = inputs.sublist(2);
    for (int i = 0; i < rowInputs.length; i++) {
      List row = kMap[i];
      if (!row.any((element) => element == 1)) continue;
      for (int j = 0; j < colInputs.length; j++) {
        if (i == 0) {
          if (horChecker[i] && j == 0) {
            if (horChecker[3]) {
              output.add(
                  simpleEq(inputs: inpRow, rows: [rowInputs[0], rowInputs[3]]));
            }
            if (horChecker[1]) {
              output.add(
                  simpleEq(inputs: inpRow, rows: [rowInputs[0], rowInputs[1]]));
            }
            if (!horChecker[1] && !horChecker[3]) {
              output.add(simpleEq(inputs: inpRow, rows: [rowInputs[0]]));
            }
          }
          if (row[j] == 1) {
            if (j == 0) {
              if (vertChecker[j]) {
                if (vertChecker[3]) {
                  output.add(simpleEq(
                      inputs: inpCol, columns: [colInputs[0], colInputs[3]]));
                }
                if (vertChecker[1]) {
                  output.add(simpleEq(
                      inputs: inpCol, columns: [colInputs[0], colInputs[1]]));
                }
                if (!vertChecker[1] && !vertChecker[3]) {
                  output.add(simpleEq(inputs: inpCol, columns: [colInputs[0]]));
                }
              }
              if (kMap[1][j] == 1 && (kMap[2][j] != 1 || kMap[3][j] != 1)) {
                if (kMap[0][3] == 1 &&
                    kMap[1][3] == 1 &&
                    (kMap[2][3] != 1 || kMap[3][3] != 1) &&
                    (!horChecker[0] || !horChecker[1]) &&
                    (!vertChecker[0] || !vertChecker[3])) {
                  output.add(simpleEq(
                      inputs: [inpRow, inpCol],
                      columns: [colInputs[0], colInputs[3]],
                      rows: [rowInputs[0], rowInputs[1]]));
                }
                if ((!horChecker[0] || !horChecker[1]) &&
                    (kMap[0][3] != 1 || kMap[1][3] != 1) &&
                    (kMap[0][1] != 1 || kMap[1][1] != 1) &&
                    (!vertChecker[0] || !vertChecker[1] || !vertChecker[3])) {
                  output.add(simpleEq(
                      inputs: [inpRow, inpCol],
                      columns: [colInputs[0]],
                      rows: [rowInputs[0], rowInputs[1]]));
                }
              }
              if (kMap[0][0] == 1 &&
                  kMap[0][1] == 1 &&
                  kMap[1][0] == 1 &&
                  kMap[1][1] == 1 &&
                  (!horChecker[0] || !horChecker[1]) &&
                  (!vertChecker[0] || !vertChecker[1])) {
                output.add(simpleEq(
                    inputs: [inpRow, inpCol],
                    columns: [colInputs[0], colInputs[1]],
                    rows: [rowInputs[0], rowInputs[1]]));
              }
              if (kMap[0][0] == 1 &&
                  kMap[3][0] == 1 &&
                  !vertChecker[0] &&
                  (!horChecker[0] || !horChecker[3]) &&
                  (kMap[0][1] != 1 || kMap[3][1] != 1)) {
                output.add(simpleEq(
                    inputs: [inpRow, inpCol],
                    columns: [colInputs[0]],
                    rows: [rowInputs[0], rowInputs[3]]));
              }
              if (kMap[0][0] == 1 &&
                  kMap[0][1] == 1 &&
                  kMap[3][0] == 1 &&
                  kMap[3][1] == 1 &&
                  (!vertChecker[0] || !vertChecker[1]) &&
                  (!horChecker[0] || !horChecker[3])) {
                output.add(simpleEq(
                    inputs: [inpRow, inpCol],
                    columns: [colInputs[0], colInputs[1]],
                    rows: [rowInputs[0], rowInputs[3]]));
              }
              if (kMap[0][0] == 1 &&
                  kMap[0][3] == 1 &&
                  (kMap[1][0] != 1 || kMap[1][3] != 1) &&
                  !horChecker[0] &&
                  (!vertChecker[0] || !vertChecker[3])) {
                output.add(simpleEq(
                    inputs: [inpRow, inpCol],
                    columns: [colInputs[0], colInputs[3]],
                    rows: [rowInputs[0]]));
              }
              if (kMap[0][0] == 1 &&
                  kMap[1][0] == 1 &&
                  kMap[0][3] == 1 &&
                  kMap[1][3] == 1 &&
                  (!horChecker[0] || !horChecker[1]) &&
                  (!vertChecker[0] || !vertChecker[3])) {
                output.add(simpleEq(
                    inputs: [inpRow, inpCol],
                    columns: [colInputs[0], colInputs[3]],
                    rows: [rowInputs[0], rowInputs[1]]));
              }
            } else if (j == 1 || j == 2) {
              if (vertChecker[j]) {
                if (vertChecker[j + 1]) {
                  output.add(simpleEq(
                      inputs: inpCol,
                      columns: [colInputs[j], colInputs[j + 1]]));
                }
                if (!vertChecker[j - 1] && !vertChecker[j + 1]) {
                  output.add(simpleEq(inputs: inpCol, columns: [colInputs[j]]));
                }
              }
              if (kMap[0][j] == 1 &&
                  kMap[0][j + 1] == 1 &&
                  kMap[3][j] == 1 &&
                  kMap[3][j + 1] == 1 &&
                  (!horChecker[0] || !horChecker[3]) &&
                  (!vertChecker[j] || !vertChecker[j + 1])) {
                output.add(simpleEq(
                    inputs: [inpRow, inpCol],
                    rows: [rowInputs[0], rowInputs[3]],
                    columns: [colInputs[j], colInputs[j + 1]]));
              }
              if (kMap[0][j] == 1 &&
                  kMap[0][j + 1] == 1 &&
                  kMap[1][j] == 1 &&
                  kMap[1][j + 1] == 1 &&
                  (!horChecker[0] || !horChecker[1]) &&
                  (!vertChecker[j] || !vertChecker[j + 1])) {
                output.add(simpleEq(
                    inputs: [inpRow, inpCol],
                    rows: [rowInputs[0], rowInputs[1]],
                    columns: [colInputs[j], colInputs[j + 1]]));
              }
              if (kMap[0][j] == 1 &&
                  kMap[0][j + 1] == 1 &&
                  (kMap[1][j] != 1 ||
                      kMap[1][j + 1] != 1 ||
                      kMap[3][j] != 1 ||
                      kMap[3][j + 1] != 1) &&
                  !horChecker[0] &&
                  (!vertChecker[j] || !vertChecker[j + 1])) {
                output.add(simpleEq(
                    inputs: [inpRow, inpCol],
                    rows: [rowInputs[0]],
                    columns: [colInputs[j], colInputs[j + 1]]));
              }
              if (kMap[0][j] == 1 &&
                  kMap[1][j] == 1 &&
                  (kMap[0][j + 1] != 1 || kMap[1][j + 1] != 1) &&
                  (kMap[0][j - 1] != 1 || kMap[1][j - 1] != 1) &&
                  (!horChecker[0] || !horChecker[1])) {
                output.add(simpleEq(
                    inputs: [inpRow, inpCol],
                    rows: [rowInputs[0], rowInputs[1]],
                    columns: [colInputs[j]]));
              }
              if (kMap[0][j] == 1 &&
                  kMap[3][j] == 1 &&
                  !vertChecker[j] &&
                  (!horChecker[0] || !horChecker[3])) {
                output.add(simpleEq(
                    inputs: [inpRow, inpCol],
                    rows: [rowInputs[0], rowInputs[3]],
                    columns: [colInputs[j]]));
              }
            } else {
              if (kMap[0][3] == 1 &&
                  kMap[1][3] == 1 &&
                  kMap[2][3] == 1 &&
                  kMap[3][3] == 1 &&
                  !vertChecker[0] &&
                  !vertChecker[2]) {
                vertChecker[3] = true;
                output.add(simpleEq(inputs: inpCol, columns: [colInputs[3]]));
              }
              if (kMap[0][3] == 1 &&
                  kMap[1][3] == 1 &&
                  !vertChecker[3] &&
                  (kMap[0][2] != 1 || kMap[1][2] != 1) &&
                  (kMap[0][0] != 1 || kMap[1][0] != 1) &&
                  (!horChecker[0] || !horChecker[1])) {
                output.add(simpleEq(
                    inputs: [inpRow, inpCol],
                    rows: [rowInputs[0], rowInputs[1]],
                    columns: [colInputs[3]]));
              }
              if (kMap[0][3] == 1 &&
                  kMap[3][3] == 1 &&
                  (!horChecker[0] || !horChecker[3]) &&
                  !vertChecker[3]) {
                output.add(simpleEq(
                    inputs: [inpRow, inpCol],
                    columns: [colInputs[3]],
                    rows: [rowInputs[0], rowInputs[3]]));
              }
            }
          }
        } else if (i == 1 || i == 2) {
          if (horChecker[i] && j == 0) {
            if (horChecker[i + 1]) {
              output.add(simpleEq(
                  inputs: inpRow, rows: [rowInputs[i], rowInputs[i + 1]]));
            }
            if (!horChecker[i - 1] && !horChecker[i + 1]) {
              output.add(simpleEq(inputs: inpRow, rows: [rowInputs[i]]));
            }
          }
          if (row[j] == 1) {
            if (j == 0) {
              if (kMap[i][0] == 1 &&
                  kMap[i][1] == 1 &&
                  kMap[i + 1][0] == 1 &&
                  kMap[i + 1][1] == 1 &&
                  (!vertChecker[0] || !vertChecker[1]) &&
                  (!horChecker[i] || !horChecker[i + 1])) {
                output.add(simpleEq(
                    inputs: [inpRow, inpCol],
                    columns: [colInputs[0], colInputs[1]],
                    rows: [rowInputs[i], rowInputs[i + 1]]));
              }
              if (kMap[i][0] == 1 &&
                  kMap[i][1] == 1 &&
                  (kMap[i + 1][0] != 1 || kMap[i + 1][1] != 1) &&
                  (kMap[i - 1][0] != 1 || kMap[i - 1][1] != 1) &&
                  !horChecker[i]) {
                output.add(simpleEq(
                    inputs: [inpRow, inpCol],
                    rows: [rowInputs[i]],
                    columns: [colInputs[0], colInputs[1]]));
              }
              if (kMap[i][0] == 1 &&
                  kMap[i + 1][0] == 1 &&
                  kMap[i][3] == 1 &&
                  kMap[i + 1][3] == 1 &&
                  (!vertChecker[0] || !vertChecker[3]) &&
                  (!horChecker[i] || !horChecker[i + 1])) {
                output.add(simpleEq(
                    inputs: [inpRow, inpCol],
                    rows: [rowInputs[i], rowInputs[i + 1]],
                    columns: [colInputs[0], colInputs[3]]));
              }
              if (kMap[i][0] == 1 &&
                  kMap[i + 1][0] == 1 &&
                  (kMap[i][1] != 1 || kMap[i + 1][1] != 1) &&
                  (!vertChecker[0] || !vertChecker[3]) &&
                  (kMap[i][3] != 1 || kMap[i + 1][3] != 1) &&
                  (!horChecker[i] || !horChecker[i + 1])) {
                output.add(simpleEq(
                    inputs: [inpRow, inpCol],
                    rows: [rowInputs[i], rowInputs[i + 1]],
                    columns: [colInputs[0]]));
              }
              if (kMap[i][0] == 1 &&
                  kMap[i][3] == 1 &&
                  (!horChecker[i] ||
                      !horChecker[i + 1] ||
                      !horChecker[i - 1]) &&
                  (kMap[i + 1][0] != 1 || kMap[i + 1][3] != 1) &&
                  (kMap[i - 1][0] != 1 || kMap[i - 1][3] != 1) &&
                  (!vertChecker[0] || !vertChecker[3])) {
                output.add(simpleEq(
                    inputs: [inpRow, inpCol],
                    rows: [rowInputs[i]],
                    columns: [colInputs[0], colInputs[3]]));
              }
            } else if (j == 1 || j == 2) {
              if (kMap[i][j] == 1 &&
                  kMap[i][j + 1] == 1 &&
                  kMap[i + 1][j] == 1 &&
                  kMap[i + 1][j + 1] == 1 &&
                  (!horChecker[i] || !horChecker[i + 1]) &&
                  (!vertChecker[j] || !vertChecker[j + 1])) {
                output.add(simpleEq(
                    inputs: [inpRow, inpCol],
                    columns: [colInputs[j], colInputs[j + 1]],
                    rows: [rowInputs[i], rowInputs[i + 1]]));
              }
              if (kMap[i][j] == 1 &&
                  kMap[i][j + 1] == 1 &&
                  (kMap[i + 1][j] != 1 || kMap[i + 1][j + 1] != 1) &&
                  !horChecker[i] &&
                  (!vertChecker[j] || !vertChecker[j + 1]) &&
                  (kMap[i - 1][j] != 1 || kMap[i - 1][j + 1] != 1)) {
                output.add(simpleEq(
                    inputs: [inpRow, inpCol],
                    rows: [rowInputs[i]],
                    columns: [colInputs[j], colInputs[j + 1]]));
              }
              if (kMap[i][j] == 1 &&
                  kMap[i + 1][j] == 1 &&
                  !vertChecker[j] &&
                  (kMap[i][j + 1] != 1 || kMap[i + 1][j + 1] != 1) &&
                  (kMap[i][j - 1] != 1 || kMap[i + 1][j - 1] != 1)) {
                output.add(simpleEq(
                    inputs: [inpRow, inpCol],
                    rows: [rowInputs[i], rowInputs[i + 1]],
                    columns: [colInputs[j]]));
              }
            } else {
              if (kMap[i][3] == 1 &&
                  kMap[i + 1][3] == 1 &&
                  !vertChecker[3] &&
                  (!horChecker[i] || !horChecker[i + 1]) &&
                  (kMap[i][2] != 1 || kMap[i + 1][2] != 1) &&
                  (kMap[i][0] != 1 || kMap[i + 1][0] != 1)) {
                output.add(simpleEq(
                    inputs: [inpRow, inpCol],
                    rows: [rowInputs[i], rowInputs[i + 1]],
                    columns: [colInputs[3]]));
              }
            }
          }
        } else {
          bool isFull = row.every((element) => element == 1);
          if (isFull &&
              !kMap[2].every((element) => element == 1) &&
              !kMap[0].every((element) => element == 1) &&
              j == 0) {
            output.add(simpleEq(inputs: inpRow, rows: [rowInputs[3]]));
          } else if (!isFull && row[j] == 1 && j != 3) {
            if (row[j + 1] == 1 &&
                (kMap[2][j] != 1 || kMap[2][j + 1] != 1) &&
                (kMap[0][j] != 1 || kMap[0][j + 1] != 1)) {
              output.add(simpleEq(
                  inputs: [inpRow, inpCol],
                  rows: [rowInputs[3]],
                  columns: [colInputs[j], colInputs[j + 1]]));
            }
          }
        }
      }
    }
  }

  return (output.length == 1) ? output.join("") : output.join("+");
}
