import 'package:flutter/material.dart';

class OrangeBgTextWidget extends StatelessWidget {
  final String text;

  OrangeBgTextWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.deepOrange),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          "test",
          style: Theme.of(context).textTheme.body1,
        ),
      ),
    );
  }
}

class ListOfOrangeBgTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                "test",
                style: TextStyle(decoration: TextDecoration.none),
              ),
              OrangeBgTextWidget("test"),
              OrangeBgTextWidget("test"),
            ],
          ),
        ],
      ),
    );
  }
}
