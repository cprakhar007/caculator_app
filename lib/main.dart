import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output ="0";
  String _output="0";
  double n1= 0.0;
  double n2=0.0;
  String operand="";

  buttonPressed(String buttonText) {
    if (buttonText == "clr") {
      _output = "0";
      n1 = 0.0;
      n2 = 0.0;
      operand = "";
    }
    else if (buttonText == "+" || buttonText == "-" || buttonText == "*" ||
        buttonText == "/") {
      n1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    }
    else if (buttonText == ".") {
      if (_output.contains(".")) {
        print("already contains a decimals");
        return;
      } else {
        _output = _output + buttonText;
      }
    }
    else if (buttonText == "=") {
      n2 = double.parse(output);
      if (operand == "+") {
        _output = (n1 + n2).toString();
      }
      if (operand == "-") {
        _output = (n1 - n2).toString();
      }
      if (operand == "*") {
        _output = (n1 * n2).toString();
      }
      if (operand == "/") {
        _output = (n1 / n2).toString();
      }
      n1 = 0.0;
      n2 = 0.0;
      operand = "";
    }
    else {
      _output = _output + buttonText;
    }
    print(_output);
    setState(() {
      output = double.parse(_output).toStringAsFixed(4);
    });
  }

  Widget buildButton( String buttonText ){
   return Expanded(
      child: new OutlineButton(
        padding: EdgeInsets.all(22.0),
        child: new Text(buttonText),
        onPressed: () =>{
          buttonPressed(buttonText
          )


        },
        color: Colors.black,

      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: new Container(
          child: new Column(children: <Widget>[
             Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(
              vertical:24.0,
              horizontal:12.0,
          ),
                child: new Text(output, style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 45.0,
                ))),
        Expanded(
          child: Divider(),
        ),



        Column(
          children: [
            Row(
                      children: [
                       buildButton("7"),
                        buildButton("8"),
                        buildButton("9"),
                        buildButton("/")
                      ]
                    ),

            Row(
                children: [
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("*")
                ]
            ),
            Row(
                children: [
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("-")
                ]
            ),
            Row(
                children: [
                  buildButton("clr"),
                  buildButton("0"),
                  buildButton("00"),
                  buildButton(".")
                ]
            ),
            Row(
                children: [
                  buildButton("="),
                  buildButton("%"),
                  buildButton("log"),
                  buildButton("+")
                ]
            ),
          ],
        ),

          ],),
        )
      );
  }
}
