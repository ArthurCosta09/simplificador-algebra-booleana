import 'package:flutter/material.dart';
import "simple_eq.dart";

const TRUEBIN = "1";
String simplifier(List<List> kMap, List<String> rowInputs,
    List<String> colInputs, List<List> inps) {
  Map trueRows = _trueVars(rowInputs, kMap);
  Map trueColumns = _trueVars(colInputs, _kMapColumn(kMap));

  if (trueRows.isEmpty || trueColumns.isEmpty) {
    return TRUEBIN;
  }

  print(trueRows);
  print(trueColumns);

  return "";
}

String _solver(Map trueRows, Map trueColumns, List<String> rowInputs,
    List<String> colInputs, List<List> inps) {
  List output = [];
  List rows = [];
  List columns = [];
  var rowKeys = trueRows.keys.toList();
  var columnKeys = trueColumns.keys.toList();
  if (columnKeys.length == 1 && rowKeys.length >= rowInputs.length) {
    columns.add(colInputs[columnKeys[0]]);
    if (rowKeys.length >= rowInputs.length) {
      output.add(simpleEq(inputs: inps[1], columns: columns));
    } else {
      trueColumns[columnKeys[0]].forEach((row) {
        rows.add(rowInputs[row]);
      });
      output.add(simpleEq(inputs: inps, columns: columns, rows: rows));
    }
  } else if (rowKeys.length == 1 && columnKeys.length >= colInputs.length) {
    rows.add(rowInputs[rowKeys[0]]);
    if (columnKeys.length >= colInputs.length) {
      output.add(simpleEq(inputs: inps[0], rows: rows));
    } else {
      trueRows[rowKeys[0]].forEach((column) {
        columns.add(colInputs[column]);
      });
      output.add(simpleEq(inputs: inps, columns: columns, rows: rows));
    }
  } else {
    final columnList = trueRows.values.toList();
    final commomColumn =
        columnList.fold<Set>(columnList.first, (a, b) => a.intersection(b));
    final rowList = trueColumns.values.toList();
    final commonRow =
        rowList.fold<Set>(rowList.first, (a, b) => a.intersection(b));
    if (rowKeys.length >= rowInputs.length && colInputs.length <= 2) {
      if (commomColumn.isEmpty && commonRow.isNotEmpty) {
        columns = [for (int i in columnKeys) colInputs[i]];
        rows = [for (int i in commonRow) rowInputs[i]];
        output.add(simpleEq(inputs: inps, rows: rows, columns: columns));
        trueColumns.forEach((column, row) {
          row = row.toList();
          if (row.length > colInputs.length) {
            if (row.contains(0) && row.contains(3)) {
              List subRow;
              if (row[1] == 2) {
                subRow = row.sublist(1, 3);
              } else {
                subRow = row.sublist(0, 2);
              }
              output.add(simpleEq(
                  inputs: inps,
                  columns: [colInputs[column]],
                  rows: [rowInputs[0], rowInputs[2]]));
              output.add(simpleEq(
                  inputs: inps,
                  columns: [colInputs[column]],
                  rows: [for (int i in subRow) rowInputs[i]]));
            } else {
              for (int i = 0; i < row.length - 1; i++) {
                int next = row[i] + 1;
                if (row[i + 1] == next) {
                  List r = row.toList().sublist(i, i + 2);
                  output.add(simpleEq(
                      inputs: inps,
                      columns: [colInputs[column]],
                      rows: [for (int j in r) rowInputs[j]]));
                }
              }
            }
          } else {
            output.add(simpleEq(
                inputs: inps,
                columns: [colInputs[column]],
                rows: [for (int j in row) rowInputs[j]]));
          }
        });
      } else if (commomColumn.isEmpty && commonRow.isEmpty) {
        trueColumns.forEach((column, row) {
          output.add(simpleEq(
              inputs: inps,
              rows: [for (int i in rows) rowInputs[i]],
              columns: [colInputs[column]]));
        });
      } else {
        columns = [for (int i in commomColumn) colInputs[i]];
        output.add(simpleEq(inputs: inps[1], columns: columns));

        columns = [for (int i in columnKeys) colInputs[i]];
        if (commonRow.length > colInputs.length) {
          if (commonRow.contains(0) &&
              commonRow.contains(trueRows.length - 1)) {
            List subRow = [];
            if (commonRow.elementAt(1) == 2) {
              subRow = commonRow.toList().sublist(1, commonRow.length);
            } else {
              subRow = commonRow.toList().sublist(0, commonRow.length - 1);
            }
            output.add(simpleEq(
                inputs: inps,
                columns: columns,
                rows: [for (int i in subRow) rowInputs[i]]));
            output.add(simpleEq(inputs: inps, columns: columns, rows: [
              for (int i in [0, trueRows.length - 1]) rowInputs[i]
            ]));
          } else {
            for (int i = 0; i < commonRow.length - 1; i++) {
              List subRow = [
                rowInputs[commonRow.elementAt(i)],
                rowInputs[commonRow.elementAt(i + 1)]
              ];
              output
                  .add(simpleEq(inputs: inps, columns: columns, rows: subRow));
            }
          }
        } else {
          output.add(simpleEq(
              inputs: inps,
              columns: columns,
              rows: [for (int i in commonRow) rowInputs[i]]));
        }
      }
    } else if (rowKeys.length < rowInputs.length && colInputs.length <= 2) {
      if (columnKeys.length < colInputs.length) {
        columns = [for (int i in columnKeys) colInputs[i]];
        rows = [
          for (int i in columnKeys)
            for (int j in trueColumns[i]) rowInputs[j]
        ];
        output.add(simpleEq(inputs: inps, columns: columns, rows: rows));
      } else if (rowKeys.length == 1) {
        columns = [for (int i in trueRows[rowKeys[0]]) colInputs[i]];
        rows = [rowInputs[rowKeys[0]]];
        output.add(simpleEq(inputs: inps, columns: columns, rows: rows));
      } else {
        if (commomColumn.isEmpty && commonRow.isNotEmpty) {
          columns = [for (int i in columnKeys) colInputs[i]];
          rows = [for (int i in commonRow) rowInputs[i]];
          output.add(simpleEq(inputs: inps, columns: columns, rows: rows));
          columns.clear();
          rows.clear();
          trueColumns.forEach((column, row) {
            columns = [colInputs[column]];
            if (row.length > colInputs.length) {
              for (int i = 0; i < row.length - 1; i++) {
                List subRow = row.toList().sublist(i, i + 2);
                rows = [for (int j in subRow) rowInputs[j]];
                output
                    .add(simpleEq(inputs: inps, columns: columns, rows: rows));
              }
            } else {
              rows = [for (int i in row) rowInputs[i]];
              output.add(simpleEq(inputs: inps, columns: columns, rows: rows));
            }
          });
        } else if (commomColumn.isNotEmpty &&
            commonRow.isNotEmpty &&
            rowKeys.length <= 2) {
          bool isSepareted = false;
          for (int i = 0; i < rowKeys.length - 1; i++) {
            int next = rowKeys[i] + 1;
            if (rowKeys[i + 1] != next) {
              isSepareted = true;
              break;
            }
          }
          bool is_03 = rowKeys.contains(0) && rowKeys.contains(3);
          if (isSepareted && !is_03) {
            trueRows.forEach((row, column) {
              rows = [rowInputs[row]];
              columns = [for (int i in column) colInputs[column]];
              output.add(simpleEq(inputs: inps, columns: columns, rows: rows));
            });
          } else {
            rows = [for (int i in rowKeys) rowInputs[i]];
            columns = [for (int i in commomColumn) colInputs[i]];
            output.add(simpleEq(inputs: inps, columns: columns, rows: rows));
          }
        } else if (commomColumn.isNotEmpty &&
            commonRow.isNotEmpty &&
            rowKeys.length > 2) {
          columns = [for (int i in columnKeys) colInputs[i]];
          rows = [for (int i in commonRow) rowInputs[i]];
          output.add(simpleEq(inputs: inps, columns: columns, rows: rows));
          if (rowKeys.contains(0) && rowKeys.contains(3)) {
            List subRow = (rowKeys[1] == 2)
                ? rowKeys.sublist(1, rowKeys.length)
                : rowKeys.sublist(0, 2);
            rows = [for (int i in subRow) rowInputs[i]];
            columns = [for (int i in commomColumn) colInputs[i]];
            output.add(simpleEq(inputs: inps, columns: columns, rows: rows));
            output.add(simpleEq(
                inputs: inps,
                columns: columns,
                rows: [rowInputs[0], rowInputs[3]]));
          } else {
            for (int i = 0; i < rowKeys.length - 1; i++) {
              List subRow = rowKeys.sublist(i, i + 2);
              rows = [for (int i in subRow) rowInputs[i]];
              columns = [for (int i in commomColumn) colInputs[i]];
              output.add(simpleEq(inputs: inps, columns: columns, rows: rows));
            }
          }
        }
      }
    } else if (rowKeys.length >= rowInputs.length &&
        colInputs.length > 2 &&
        columnKeys.length >= colInputs.length) {
      rows = [for (int i in rowKeys) rowInputs[i]];

      if (commomColumn.length > 2) {
        if (commomColumn.contains(0) && commomColumn.contains(3)) {
          List subColumn = (commomColumn.elementAt(1) == 2)
              ? commomColumn.toList().sublist(1, 3)
              : commomColumn.toList().sublist(0, 2);
          output.add(simpleEq(
              inputs: inps,
              columns: [for (int i in subColumn) colInputs[i]],
              rows: rows));
          output.add(simpleEq(
              inputs: inps, columns: [colInputs[0], colInputs[3]], rows: rows));
        } else {
          for (int i = 0; i < commomColumn.length - 1; i++) {
            List subColumn = commomColumn.toList().sublist(i, i + 2);
            columns = [for (int j in subColumn) colInputs[i]];
            output.add(simpleEq(inputs: inps, columns: columns, rows: rows));
          }
        }
      } else {
        columns = [for (int i in commomColumn) colInputs[i]];
        output.add(simpleEq(inputs: inps, columns: columns, rows: rows));
      }

      columns = [for (int i in columnKeys) colInputs[i]];
      if (commonRow.length > 2) {
        if (commonRow.contains(0) && commonRow.contains(3)) {
          List subRow = (commonRow.elementAt(1) == 2)
              ? commonRow.toList().sublist(1, 3)
              : commonRow.toList().sublist(0, 2);
          rows = [for (int i in subRow) rowInputs[i]];
          output.add(simpleEq(inputs: inps, columns: columns, rows: rows));
          output.add(simpleEq(
              inputs: inps,
              columns: columns,
              rows: [rowInputs[0], rowInputs[3]]));
        } else {
          for (int i = 0; i < commonRow.length - 1; i++) {
            List subRow = commonRow.toList().sublist(i, i + 2);
            rows = [for (int i in subRow) rowInputs[i]];
            output.add(simpleEq(inputs: inps, columns: columns, rows: rows));
          }
        }
      } else {
        rows = [for (int i in commonRow) rowInputs[i]];
        output.add(simpleEq(inputs: inps, columns: columns, rows: rows));
      }
    } else if (rowKeys.length >= rowInputs.length &&
        colInputs.length > 2 &&
        columnKeys.length < colInputs.length) {
      rows = [for (int i in rowKeys) rowInputs[i]];
      columns = [for (int i in commomColumn) colInputs[i]];
      output.add(simpleEq(inputs: inps, columns: columns, rows: rows));

      if (commonRow.length == 1){
        if (commonRow.contains(0) && columnKeys.contains(3)){
          
        }
      }
      rows = [for (int i in commonRow) rowInputs[i]];
      if (columnKeys.length > 2 && commonRow.length == columnKeys.length) {
        columns = [
          for (int i = 0; i < columnKeys.length - 1; i++)
            colInputs[columnKeys[i]]
        ];
      } else {
        columns = [for (int i in columnKeys) colInputs[i]];
      }
      output.add(simpleEq(inputs: inps, columns: columns, rows: rows));
    } else if (rowKeys.length < rowInputs.length &&
        colInputs.length > 2 &&
        columnKeys.length >= colInputs.length) {
      columns = [for (int i in columnKeys) colInputs[i]];
      if (rowKeys.length <= 2 && commomColumn.length >= colInputs.length) {
        if (!rowKeys.contains(0) && !rowKeys.contains(3)) {
          int next = rowKeys[0] + 1;
          if (rowKeys[1] == next) {
            rows = [for (int i in rowKeys) rowInputs[i]];
            output.add(simpleEq(inputs: inps[0], rows: rows));
          } else {
            rowKeys.forEach((row) {
              output.add(simpleEq(inputs: inps[0], rows: [rowInputs[row]]));
            });
          }
        } else {
          rows = [rowInputs[0], rowInputs[3]];
          output.add(simpleEq(inputs: inps[0], rows: rows));
        }
      } else if (rowKeys.length <= 2 && commomColumn.length < colInputs.length){
        
      }
    }
  }

  output = output.toSet().toList();

  return (output.length > 1) ? output.join("+") : output.join("");
}

List<List> _kMapColumn(List<List> kMap) {
  List<List> output = [];
  for (int j = 0; j < kMap[0].length; j++) {
    List row = [];
    for (int i = 0; i < kMap.length; i++) {
      row.add(kMap[i][j]);
    }
    output.add(row);
  }
  return output;
}

Map _trueVars(List binInputs, List<List> kMap) {
  int onesRow = 0;
  Map<int, Set> onVars = {};

  binInputs.asMap().forEach((id, value) {
    var rowMap = kMap[id];
    bool hasOne = rowMap.any((number) => number == TRUEBIN);
    bool allOne = rowMap.every((number) => number == TRUEBIN);

    if (allOne) {
      onesRow++;
    }

    if (hasOne) {
      Set<int> cols = {};
      rowMap.asMap().forEach((key, number) {
        if (number == TRUEBIN) {
          cols.add(key);
        }
      });
      onVars[id] = cols;
    }
  });
  if (onesRow >= binInputs.length) {
    return {};
  }

  return onVars;
}
