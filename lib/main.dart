import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:math_expressions/math_expressions.dart';

import 'widgets/CalButton.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  CalAppState createState() {
    return CalAppState();
  }
}

class CalAppState extends State<MyApp> {
  String _expression = '';

  void numClick(String text) {
    setState(() => _expression += text);
  }

  void clearAll(String text) {
    setState(() {
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = _expression.substring(0, _expression.length - 1);
    });
  }

  void calcul(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();

    setState(() {
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
        title: 'Calculator',
        home: Scaffold(
            backgroundColor: Color.fromARGB(255, 78, 78, 74),
            body: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Center(
                    child: Text(
                      _expression,
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 0.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalButton("AC", 0xFF212121, clearAll),
                          CalButton("%", 0xFF212121, numClick),
                          CalButton("/", 0xFF212121, numClick),
                          CalButton("C", 0xFF212121, clear)
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalButton("7", 0xFF212121, numClick),
                          CalButton("8", 0xFF212121, numClick),
                          CalButton("9", 0xFF212121, numClick),
                          CalButton("*", 0xFF212121, numClick)
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalButton("4", 0xFF212121, numClick),
                          CalButton("5", 0xFF212121, numClick),
                          CalButton("6", 0xFF212121, numClick),
                          CalButton("-", 0xFF212121, numClick)
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalButton("1", 0xFF212121, numClick),
                          CalButton("2", 0xFF212121, numClick),
                          CalButton("3", 0xFF212121, numClick),
                          CalButton("+", 0xFF212121, numClick)
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalButton(".", 0xFF212121, numClick),
                          CalButton("0", 0xFF212121, numClick),
                          CalButton("( )", 0xFF212121, numClick),
                          CalButton("=", 0xFF212121, calcul)
                        ])
                  ],
                ),
              )
            ])));
  }
}
