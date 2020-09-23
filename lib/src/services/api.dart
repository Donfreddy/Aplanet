import 'dart:async';

import 'package:http/http.dart' as http;

class API {
  static Future getAnimals() {
    var url = "https://agile-reef-52993.herokuapp.com/data/all";
    return http.get(
      url,
      headers: {"Access-Control-Allow-Origin": "*"},
    );
  }
}
