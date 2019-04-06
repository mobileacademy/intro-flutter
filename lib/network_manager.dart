import 'dart:convert' as convert;

import 'package:flutter_app/person.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  final api = "https://randomuser.me/api?results=10";
  Future<List<Person>> retrieveUsers() async {
    var response = await http.get(api);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body)['results'] as List;
      return jsonResponse.map((data) => new Person.fromJson(data)).toList();
    }
    return new List<Person>();
  }
}
