const TRUEBIN = "1";
const FALSEBIN = "0";

String simpleEq({List? rows, List? columns, required List inputs}) {
  if (rows != null && columns == null) {
    return _outSolver(inputs, rows);
  } else if (rows == null && columns != null) {
    return _outSolver(inputs, columns);
  }

  print(inputs);
  print(columns);
  print(rows);

  return _outSolver(inputs[0], rows!) + _outSolver(inputs[1], columns!);
}

String _outSolver(List binInput, List mapInput) {
  String output = "";
  for (int i = 0; i < binInput.length; i++) {
    var checker = [];
    String input = binInput[i];
    print(input);
    mapInput.forEach((element) {
      checker.add(element[i]);
    });

    if (checker.every((element) => element == TRUEBIN)) {
      output += "$input";
      print(output);
    } else if (checker.every((element) => element == FALSEBIN)) {
      output += "$input'";
    }
    print(checker.every((element) => element == TRUEBIN));
  }
  return output;
}
