import 'package:flutter/material.dart';
import 'dart:async';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Age Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'GoogleSans',
      ),
      home: MyHomePage(title: 'Age Calculator'),
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
  // int _counter = 0;
  DateTime _value = new DateTime.now();
  // String _age = '';
  DateTime _date = new DateTime.now();
  // DateTime _dategive;
  String duryr = '';
  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(1910),
        lastDate: new DateTime.now()
    );
    if(picked != null) setState(() => _value = picked);
  }
  void _calcAge() {
    Duration diffyr = _date.difference(_value);
    setState(() {
          duryr = (diffyr.inDays/365).floor().toString(); 
          String days = (diffyr.inDays - ((diffyr.inDays/365).floor())*365).toString();
          duryr = duryr + " Years " + days + " Days ";
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Center(child: Text(widget.title)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Align(
              alignment: Alignment.center,
              child: Text(
              'Your Age is:',
              style: TextStyle(fontSize: 48),
              ),
            ),
            new Align(
              alignment: Alignment.center,
              child: Text(
              '$duryr',
              style: Theme.of(context).textTheme.display1,
              ),
            ),
            new Align(
              alignment: Alignment.bottomCenter,
              child: new RaisedButton(
                  onPressed: _selectDate,
                  child: new Text(
                    "Select Date",
                    style: TextStyle(fontSize: 20) ,
                  ),
                  color: Color.fromARGB(0xFF, 0x00, 0xbc, 0xd4),
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
              ),
            ),
            new Align(
              alignment: Alignment.bottomCenter,
              child: new RaisedButton(
                      onPressed: _calcAge,
                      // tooltip: 'Increment',
                      child: new Text( 
                        "Calculate",
                        style: TextStyle(fontSize: 34), 
                      ),
                      color: Color.fromARGB(0xFF, 0x00, 0xbc, 0xd4),
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
