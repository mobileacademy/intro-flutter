import 'package:flutter/material.dart';

class FirstExample extends StatefulWidget {
  FirstExample({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<FirstExample> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 10,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("You have clicked the button"),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.display1,
              ),
              Text("times"),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
          elevation: 4, child: Icon(Icons.add), onPressed: _incrementCounter),
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
}
