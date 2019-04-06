import 'package:flutter/material.dart';
import 'package:flutter_app/localization/localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstExample extends StatefulWidget {
  FirstExample({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<FirstExample> {
  static const _prefsCounter = "prefs_counter";
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

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
              Text(DemoLocalizations.of(context).clickTitle),
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
    _updateCounterInPrefs();
  }

  Future<Null> _loadCounter() async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    try {
      int existingVal = sharedPrefs.getInt(_prefsCounter);
      setState(() {
        _counter = existingVal == null ? 0 : existingVal;
      });
    } finally {}
  }

  void _updateCounterInPrefs() async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setInt(_prefsCounter, _counter);
  }
}
