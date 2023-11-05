import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_calculator/flutter_simple_calculator.dart';

void main() => runApp(const RunMyApp());

class RunMyApp extends StatelessWidget {
  const RunMyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // materialApp with debugbanner false
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.lightBlue), // default theme
      home: Scaffold( // scaffold allows set appbar and it title
        appBar: AppBar(
          title: const Text('Eduardo Calculator'),
        ),
        body: const SizedBox(
          width: double.infinity,
          child: Calc(), // sizedbox taking class Calc
        ),
        // bottomNavigationBar: const SimpleDialog(
          // children: [],
        // ),
      ),
    );
  }
}

class Calc extends StatefulWidget {
  const Calc({Key? key}) : super(key: key);

  @override
  _CalcState createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  double? _currentValue = 0; // Variable that holds the any changes in the calc
  @override
  Widget build(BuildContext context) {
    var calc = SimpleCalculator( // SimpleCalculator widget to allow us to set it parameters
      value: _currentValue!, // value is to currentValue
      hideExpression: false,
      hideSurroundingBorder: false,
      autofocus: true,
      onChanged: (key, value, expression) {
        setState(() { // setState method call everytime when every changes occur
          _currentValue = value ?? 0;
        });
      },
      theme: const CalculatorThemeData( // setting the theme of the calculator
        borderColor: Color.fromRGBO(100, 100, 100, 200),
        borderWidth: 10,
        displayColor: Colors.white,
        displayStyle:
        TextStyle(fontSize: 200, color: Color.fromARGB(255, 0, 0, 0)),
        expressionColor: Color.fromRGBO(200, 200, 255, 255),
        expressionStyle: TextStyle(fontSize: 20, color: Colors.white),
        operatorColor: Colors.blueAccent,
        operatorStyle: TextStyle(fontSize: 30, color: Colors.white),
        commandColor: Colors.grey,
        commandStyle: TextStyle(fontSize: 30, color: Colors.white),
        numColor: Colors.white,
        numStyle: TextStyle(fontSize: 50, color: Colors.black),
      ),
    );
    if (kDebugMode) {
      print(_currentValue);
    }
    return SafeArea(child: calc); // showing the calculator
  }
}
