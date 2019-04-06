import 'package:flutter_app/name.dart';
import 'package:flutter_app/picture.dart';

class Person {
  final String email, cell, phone;
  final Name name;
  final Picture picture;


  Person(this.email, this.cell, this.phone, this.name, this.picture);

  Person.fromJson(Map<String, dynamic> json) :
        email = json['email'],
        cell = json['cell'],
        phone = json['phone'],
        name = new Name(json['name']['first'], json['name']['last'],),
        picture = new Picture(json['picture']['large'], json['picture']['medium'], json['picture']['thumbnail']);
}
