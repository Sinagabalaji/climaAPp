import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
  String url;

  Network(this.url);

  Future getData() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
