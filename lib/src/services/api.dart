import 'dart:convert';

import 'package:http/http.dart' as http;

class API {
  getAnimals() async {
    try {
      var jsonResponse;
      var response = await http.get(
        "https://agile-reef-52993.herokuapp.com/data/all",
        headers: {"Access-Control-Allow-Origin": "*"},
      );
      if (response.statusCode == 200) {
        jsonResponse = json.decode(response.body);
        if (jsonResponse != null) {
          print("200 response : ${response.body}");
        }
        return jsonResponse;
      } else if (response.statusCode == 401) {
        print("401 response : ${response.body}");
      } else {
        print("error response : ${response.body}");
      }
    } catch (e) {}
  }
}
