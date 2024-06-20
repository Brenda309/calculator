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
  buttonPressed(){

  }
  Widget buildingButton(String buttonText){
    return Expanded(
        child: SizedBox(
          height: 70.0,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: OutlinedButton(
              child: Text(
                buttonText,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              onPressed: () => buttonPressed(),
            ),
          ),
        )
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
            padding: EdgeInsets.symmetric(vertical: 24.0, horizontal:12.0),
            child: Text(
                '0',
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
