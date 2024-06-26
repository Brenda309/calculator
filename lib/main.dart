import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       primarySwatch: Colors.brown
      ),
      home: const MyHomePage(title: 'My calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0";
String _output = "0";
double num1 = 0;
double  num2 = 0;
String operand = "";

  buttonPressed(String buttonText){
if(buttonText == "CLEAR"){
  _output = "0";
  num1 = 0;
  num2 = 0;
  String operand= "";
}else if (buttonText == "+" ||
buttonText == "-" ||
buttonText == "/" ||
buttonText == "*"){
  num1 = double.parse(output);
  operand = buttonText;
  _output= "0";
}else if ( buttonText == "."){
  if(_output.contains(".")){
    print ('already contains a decimal');
  }else{
    _output = _output + buttonText;
  }
}else if (buttonText == "="){
  num2 = double.parse(output);
  if(operand == "+"){
    _output = (num1 + num2).toString();
  }
  if(operand == "-"){
    _output = (num1 - num2).toString();
  }

  if(operand == "*"){
    _output = (num1 * num2).toString();
  }

  if(operand == "/"){
    _output = (num1 / num2).toString();
  }
num1 = 0;
  num2 = 0;
  operand = "";
}else{
  _output = _output + buttonText;
}
print(_output);
setState(() {
  output = double.parse(_output).toStringAsFixed(1);
});
  }
  Widget buildingButton(String buttonText) {
    return Expanded(
      child: SizedBox(
        height: 120.0,
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), // Rectangle shape with no rounded corners
              ),
              side: BorderSide(width: 3.0, color: Colors.brown), // Customize border if needed
            ),
            onPressed: () => buttonPressed(buttonText),
            child: Text(
              buttonText,
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  @override
Widget build (BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title: new Text(widget.title),
       backgroundColor: Colors.brown,
    ),
    body: Container(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal:12.0),
            child: Text(
                output,
                style:TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                )
            ),
          ),
       Expanded(
           child: Divider(),
       ),
          new Column(
              children:[
            new Row(
              children:[
               buildingButton("7"),
                buildingButton("8"),
                buildingButton("9"),
                buildingButton("/")
              ],
            ),
                new Row(
                    children:[
                      buildingButton("4"),
                      buildingButton("5"),
                      buildingButton("6"),
                      buildingButton("*")
                    ],
                ),
                new Row(
                    children:[
                      buildingButton("1"),
                      buildingButton("2"),
                      buildingButton("3"),
                      buildingButton("/")
                    ],
                ),
                new Row(
                    children:[
                      buildingButton("."),
                      buildingButton("0"),
                      buildingButton("00"),
                      buildingButton("+")
                    ],
                ),
                new Row(
                  children: [
                    buildingButton("CLEAR"), buildingButton("="),
                  ],
                )
          ])
        ],
      )
    )
  );
}
}
