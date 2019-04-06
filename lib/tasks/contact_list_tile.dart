import 'package:flutter/material.dart';
import 'package:flutter_app/network_manager.dart';
import 'package:flutter_app/person.dart';
import 'package:flutter_app/tasks/contact_profile_details.dart';

class ContactListTile extends StatefulWidget {
  ContactListTile({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ContactListTile> {
  List<Person> _dataSet = new List();
  NetworkHelper networkHelper = new NetworkHelper();

  _MyHomePageState() {
    networkHelper.retrieveUsers().then((result) => _setDataSet(result));
  }

  void _setDataSet(List<Person> dataSet) {
    setState(() {
      _dataSet = dataSet;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(widget.title),
          elevation: 10,
        ),
        body: ListView.separated(
          itemCount: _dataSet.length,
          itemBuilder: (BuildContext context, int index) {
            Person person = _dataSet[index];
            return ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ContactProfileDetails(person)));
              },
              contentPadding: EdgeInsets.all(10.0),
              leading: new CircleAvatar(
                backgroundImage: NetworkImage(person.picture.thumbnail),
              ),
              title: new Text(
                person.name.first + " " + person.name.last,
                style: Theme.of(context).textTheme.body1,
              ),
              subtitle: new Text(person.cell),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
        ),
        bottomNavigationBar: makeBottom,
    );
  }

  final makeBottom = Container(
    height: 55.0,
    child: BottomAppBar(
      color: Color.fromRGBO(58, 66, 86, 1.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.home, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.blur_on, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.hotel, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.account_box, color: Colors.white),
            onPressed: () {},
          )
        ],
      ),
    ),
  );
}
