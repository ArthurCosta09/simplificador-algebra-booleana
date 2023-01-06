// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import "app.dart";

void main() {
  runApp(BoolCalc());
}

class BoolCalc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Calculadora Algebra Booleana", home: BooleanCalculator());
  }
}
