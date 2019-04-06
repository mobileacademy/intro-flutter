import 'package:flutter/material.dart';
import 'package:flutter_app/person.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactProfileDetails extends StatelessWidget {
  final Person person;

  ContactProfileDetails(this.person);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Builder(
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.only(top: 50, left: 10, right: 10),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(person.picture.medium),
                ),
                createPhone(context),
                createEmail(context)
              ],
            ),
          );
        },
      ),
    );
  }

  Widget createEmail(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Card(
        elevation: 5,
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
//            _sendEmail(person.email, context);
          },
          child: Container(
            padding: EdgeInsets.all(20),
            child: Row(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Icon(Icons.phone)),
                Text(
                  person.email,
                  style: Theme.of(context).textTheme.title,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget createPhone(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(right: 10), child: Icon(Icons.phone)),
              Text(
                person.cell,
                style: Theme.of(context).textTheme.title,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _sendEmail(String email, BuildContext context) async {
    var url = "mailto:" + email;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      _showToast(context);
      throw 'Could not launch $url';
    }
  }

  void _showToast(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Error"),
            content: new Text("Unable to send email"),
            actions: <Widget>[
              new FlatButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
