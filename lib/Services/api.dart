import 'dart:convert';
import 'package:get/utils.dart';
import 'package:http/http.dart' as http;

class CallApi {
  final String _url = 'http://tafesaru.afyasasa.io/api/';

  postData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaders());
  }

  getData(apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await http.get(Uri.parse(fullUrl), headers: _setHeaders());
  }

  getScript(url) async {
    return await http.get(Uri.parse(url), headers: _setHeaders());
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
}
