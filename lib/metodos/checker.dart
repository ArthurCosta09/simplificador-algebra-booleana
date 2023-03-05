import 'package:flutter/material.dart';
import "bool_calc.dart";
import 'equationWriter.dart';

final operadores = ["+", "*", "!"];
Padding checker(BuildContext context, String equacao) {
  bool isProblem = false;

  if (equacao.isEmpty) {
    isProblem = true;
    _warning("Campo Vazio",
        "É preciso inserir a equação para obter o resultado.", context);
  } else {
    List vars = [];
    equacao.split("").forEach((inp) {
      if (!operadores.contains(inp) && inp != "(" && inp != ")") {
        vars.add(inp);
      }
    });
    int numfp = "(".allMatches(equacao).length;
    int numbp = ")".allMatches(equacao).length;
    if (vars.toSet().length > 4) {
      isProblem = true;
      _warning("Limite de variáveis excedido",
          "O máximo de variáveis de entrada permitido é quatro.", context);
    } else if (!RegExp(r'^[A-Za-z+*!()]+$').hasMatch(equacao)) {
      isProblem = true;
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
      isProblem = true;
      _warning(
          "Entrada(s) vazia(s)",
          "É preciso inserir alguma letra. Somente símbolos de operação não são válidos.",
          context);
    } else if (equacao.startsWith("+") || equacao.startsWith("*")) {
      isProblem = true;
      _warning("Equação Inválida",
          "Iniciar a equação com os operadores + e * é inválido.", context);
    } else if (equacao.endsWith("+") ||
        equacao.endsWith("*") ||
        equacao.endsWith("(") ||
        equacao.endsWith("!")) {
      isProblem = true;
      _warning("Equação Inválida",
          "Terminar a equação com os operadores no final é inválido.", context);
    } else if (numfp != numbp) {
      isProblem = true;
      _warning("Equação Inválida", "Parênteses a mais é inválido.", context);
    } else if (vars.toSet().length == 1) {
      equacao =
          equacao.replaceAll("!", "").replaceAll("(", "").replaceAll(")", "'");
      return resultEquation(equacao);
    }
  }

  if (isProblem) {
    return const Padding(padding: EdgeInsets.only(top: 20.0, left: 120.0));
  }

  return calculo(equacao);
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
              child: const Text("Ok"),
              onPressed: () =>
                  Navigator.of(context, rootNavigator: false).pop(),
            ),
          ],
        );
      });
}
