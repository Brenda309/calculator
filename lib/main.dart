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
class _MyHomePageState extends State<MyHomePage> {
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
          )
        ],
      )
    )
  );
}
}
