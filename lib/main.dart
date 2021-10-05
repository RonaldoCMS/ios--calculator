// ignore_for_file: import_of_legacy_library_into_null_safe
// @dart=2.9

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key, @required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String value = "0";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      padding: EdgeInsets.all(8),
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 25),
          Container(
            alignment: Alignment.bottomRight,
            child: FittedBox(
              child: AutoSizeText(
                value,
                textAlign: TextAlign.end,
                minFontSize: 80,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),
          Row(
            children: [
              button(
                "DEL",
                Colors.black,
                Colors.grey,
              ),
              SizedBox(width: 10),
              button(
                "CANC",
                Colors.black,
                Colors.grey,
              ),
              SizedBox(width: 10),
              button("%", Colors.black, Colors.grey),
              SizedBox(width: 10),
              button(
                "/",
                Colors.black,
                Colors.orange,
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              button("7", Colors.black, Color(0xFF3e3f42)),
              SizedBox(width: 10),
              button("8", Colors.black, Color(0xFF3e3f42)),
              SizedBox(width: 10),
              button("9", Colors.black, Color(0xFF3e3f42)),
              SizedBox(width: 10),
              button("*", Colors.black, Colors.orange),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              button("4", Colors.black, Color(0xFF3e3f42)),
              SizedBox(width: 10),
              button("5", Colors.black, Color(0xFF3e3f42)),
              SizedBox(width: 10),
              button("6", Colors.black, Color(0xFF3e3f42)),
              SizedBox(width: 10),
              button("-", Colors.black, Colors.orange),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              button("1", Colors.black, Color(0xFF3e3f42)),
              SizedBox(width: 10),
              button("2", Colors.black, Color(0xFF3e3f42)),
              SizedBox(width: 10),
              button("3", Colors.black, Color(0xFF3e3f42)),
              SizedBox(width: 10),
              button("+", Colors.black, Colors.orange),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: button("0", Colors.black, Color(0xFF3e3f42))),
              SizedBox(width: 10),
              button(".", Colors.black, Color(0xFF3e3f42)),
              SizedBox(width: 10),
              button("=", Colors.black, Colors.orange),
            ],
          ),
        ],
      ),
    ));
  }

  Widget button(value, colorValue, color) {
    return InkWell(
      child: Container(
        alignment: Alignment.center,
        height: 90,
        width: 90,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(100),
        ),
        child: AutoSizeText(
          value.toString(),
          minFontSize: 30,
          textAlign: TextAlign.center,
          style: TextStyle(color: colorValue),
        ),
      ),
      onTap: () {
        setState(() {
          if (value == "=") {
            Parser p = new Parser();
            Expression exp = p.parse(this.value);
            this.value = exp.evaluate(EvaluationType.REAL, null).toString();
          } else if (value == "DEL") {
            this.value = "0";
          } else if (value == "0") {
            this.value = value;
          } else {
            this.value += value;
          }
        });
      },
    );
  }
}
