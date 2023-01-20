import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  String output = '0';
  String _output = '0';
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = '';
  buttonPressed(String buttonText) {
    if (buttonText == 'CLEAR') {
      _output = '0';
      num1 = 0.0;
      num2 = 0.0;
      operand = '0';
    } else if (buttonText == '/' ||
        buttonText == '-' ||
        buttonText == '+' ||
        buttonText == 'x') {
      num1 = double.parse(output);
      operand = buttonText;
      _output = '0';
    } else if (buttonText == '.') {
      if (_output.contains('.')) {
        print("Value already contains '.'");
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == '=') {
      num2 = double.parse(output);
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      if (operand == "x") {
        _output = (num1 * num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }
    setState(() => output = double.parse(_output).toStringAsFixed(2));
  }

  buildButton(String buttonText) {
    return Expanded(
        child: OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white10,
        padding: EdgeInsets.all(30),
      ),
      onPressed: () => buttonPressed(buttonText),
      child: Text(
          style: TextStyle(fontSize: 24.0, color: Colors.white), buttonText),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.white10,
            title: Text(
                style: TextStyle(fontSize: 24.0, color: Colors.white),
                'Calculator'),
          ),
          body: Column(children: [
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(
                vertical: 50.0,
                horizontal: 20.0,
              ),
              child: Text(
                  style: TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  output),
            ),
            Expanded(child: Divider()),
            Row(
              children: [
                buildButton('1'),
                buildButton('2'),
                buildButton('3'),
                buildButton('/')
              ],
            ),
            Row(
              children: [
                buildButton('4'),
                buildButton('5'),
                buildButton('6'),
                buildButton('x')
              ],
            ),
            Row(
              children: [
                buildButton('7'),
                buildButton('8'),
                buildButton('9'),
                buildButton('-')
              ],
            ),
            Row(
              children: [
                buildButton('0'),
                buildButton('00'),
                buildButton('.'),
                buildButton('+')
              ],
            ),
            Row(
              children: [buildButton('CLEAR'), buildButton('=')],
            ),
          ]),
        ));
  }
}
