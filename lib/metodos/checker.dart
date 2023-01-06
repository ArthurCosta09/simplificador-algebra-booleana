import 'package:flutter/material.dart';
import "bool_calc.dart";

void checker(BuildContext context, String equacao) {
  bool is_problem = false;
  if (equacao.isEmpty) {
    is_problem = true;
    _warning("Campo Vazio",
        "É preciso inserir a equação para obter o resultado.", context);
  } else {
    int numfp = "(".allMatches(equacao).length;
    int numbp = ")".allMatches(equacao).length;

    if (!RegExp(r'^[A-Za-z+*!()]+$').hasMatch(equacao)) {
      is_problem = true;
      var message = "";
      if (RegExp(r'^[0-9]+$').hasMatch(equacao)) {
        message = "Somente letras são válidas.";
      } else if (!RegExp(r'^[+*!()]+$').hasMatch(equacao)) {
        message =
            "Símbolo(s) inválido(s). Use somente os símbolos mostrados na legenda.";
      }
      _warning("Equação Inválida", message, context);
    } else if (!RegExp(r'^[A-Za-z]+$').hasMatch(equacao) &&
        RegExp(r'^[+*!()]+$').hasMatch(equacao)) {
      is_problem = true;
      _warning(
          "Entrada(s) vazia(s)",
          "É preciso inserir alguma letra. Somente símbolos de operação não são válidos.",
          context);
    } else if (equacao.startsWith("+") || equacao.startsWith("*")) {
      is_problem = true;
      _warning("Equação Inválida",
          "Iniciar a equação com os operadores + e * é inválido.", context);
    } else if (equacao.endsWith("+") ||
        equacao.endsWith("*") ||
        equacao.endsWith("(") ||
        equacao.endsWith("!")) {
      is_problem = true;
      _warning("Equação Inválida",
          "Terminar a equação com os operadores no final é inválido.", context);
    } else if (numfp != numbp) {
      is_problem = true;
      _warning("Equação Inválida", "Parênteses a mais é inválido.", context);
    } else if (equacao.length > 1) {
      calculo(equacao);
    }
  }
}

void _warning(String title, String message, BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              child: Text("Ok"),
              onPressed: () =>
                  Navigator.of(context, rootNavigator: false).pop(),
            ),
          ],
        );
      });
}
