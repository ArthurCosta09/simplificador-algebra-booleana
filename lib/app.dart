import "metodos/checker.dart";
import 'package:flutter/material.dart';

class BooleanCalculator extends StatefulWidget {
  const BooleanCalculator({super.key});

  @override
  State<BooleanCalculator> createState() => _BooleanCalculatorState();
}

class _BooleanCalculatorState extends State<BooleanCalculator> {
  var _resultText = "";
  final _equation = TextEditingController();

  @override
  void dispose() {
    _equation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Calculadora Algebra Booleana",
          style: TextStyle(color: Colors.white60),
        ),
        backgroundColor: const Color.fromRGBO(165, 207, 250, 0.7),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            Padding(
                padding: EdgeInsets.fromLTRB(2.0, 18.0, 7, 0),
                child: SizedBox(
                    width: 337,
                    child: TextField(
                      autofocus: false,
                      controller: _equation,
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            width: 3,
                            color: Color.fromRGBO(139, 195, 252, 1),
                          )),
                          icon: Icon(Icons.exposure_rounded,
                              color: Color.fromRGBO(139, 195, 252, 0.92)),
                          hintText: "Insira a equação",
                          hintStyle: TextStyle(color: Colors.white54)),
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white54,
                          fontWeight: FontWeight.w400),
                    ))),
            Padding(
                padding: EdgeInsets.fromLTRB(10, 25.0, 0, 0),
                child: ElevatedButton(
                    onPressed: () {
                      checker(context, _equation.text.replaceAll(" ", ""));
                    },
                    child: const Text("Efetuar Operação",
                        style: TextStyle(fontSize: 20, color: Colors.white54)),
                    style: ElevatedButton.styleFrom(
                        side: BorderSide(
                            width: 2,
                            color: Color.fromRGBO(139, 195, 252, 0.93)),
                        backgroundColor: Color.fromRGBO(117, 186, 255, 0.9)))),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 42, 0, 0),
                child: Container(
                  width: 300,
                  height: 115,
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 3),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 22, 0, 0),
                      child: Text(_resultText,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold))),
                )),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 53, 0, 0),
              child: Text("Legenda:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                  )),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Container(
                  width: 300,
                  height: 190,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white24,
                        width: 2.3,
                      ),
                      borderRadius: BorderRadius.circular(6.1),
                      color: Color.fromRGBO(255, 255, 255, 0.23)),
                  child: Column(children: const <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text("* - Operação AND",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold))),
                    Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text("+ - Operação OR",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold))),
                    Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text("!(Input) - Operação NOT",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold)))
                  ]),
                )),
            Padding(
                padding: EdgeInsets.only(top: 30),
                child: Image(
                  image: AssetImage("ufu_logo/ufu_logo.png"),
                  width: 100,
                  height: 100,
                ))
          ],
        ),
      ),
      backgroundColor: Color.fromRGBO(104, 175, 247, 0.75),
    );
  }
}
