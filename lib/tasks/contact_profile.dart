import 'package:flutter/material.dart';

class ContactProfile extends StatelessWidget {
  final String name, email, thumbnail;

  ContactProfile(this.name, this.email, this.thumbnail);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(thumbnail),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          name,
                          style: Theme.of(context).textTheme.body1,
                        ),
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            email,
                            style: Theme.of(context).textTheme.body1,
                          )),
                    ],
                  ),
                ),
              ),
              flex: 1,
            ),
            IconButton(
              icon: Icon(Icons.star_border),
              onPressed: _pushSaved,
            )
          ],
        ));
  }

  void _pushSaved() {}
}
