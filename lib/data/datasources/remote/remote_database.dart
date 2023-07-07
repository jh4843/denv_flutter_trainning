// class for remote database

import 'dart:convert';
import 'package:http/http.dart' as http;

class RemoteDatabase {
  // singleton
  static final RemoteDatabase _instance = RemoteDatabase._internal();
  factory RemoteDatabase() => _instance;
  RemoteDatabase._internal();

  // get data from remote database
  Future<List<RemoteData>> getData() async {
    // get data from remote database
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    // check if response is ok
    if (response.statusCode == 200) {
      // decode json
      final data = jsonDecode(response.body) as List;
      // return data
      return data.map((e) => RemoteData.fromJson(e)).toList();
    } else {
      // throw error
      throw Exception('Failed to load data');
    }
  }
}