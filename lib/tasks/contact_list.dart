import 'package:flutter/material.dart';
import 'package:flutter_app/network_manager.dart';
import 'package:flutter_app/person.dart';
import 'package:flutter_app/tasks/contact_profile.dart';

class ContactList extends StatefulWidget {
  ContactList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<ContactList> {
  List<Person> _dataSet = new List();
  NetworkHelper networkHelper = new NetworkHelper();

  _MyHomePageState() {
    Future<List<Person>> result = networkHelper.retrieveUsers();
    result.then((onValue) => _setDataSet(onValue));
  }

  void _setDataSet(List<Person> dataSet) {
    setState(() {
      _dataSet = dataSet;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          elevation: 10,
        ),
        body: ListView.separated(
          itemCount: _dataSet.length,
          itemBuilder: (BuildContext context, int index) {
            Person person = _dataSet[index];
            return ContactProfile(person.name.first + " " + person.name.last, person.email, person.picture.thumbnail);
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
        ));
  }
}