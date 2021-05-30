import 'dart:convert';

import 'package:exchange_currency_ovo_flutter/basics/exceptions/http_exception.dart';
import 'package:exchange_currency_ovo_flutter/configs/configs.dart';
import 'package:http/http.dart' as http;

abstract class BaseHTTPHelper {
  Future<Map<String, dynamic>> post({String json, String endpoint}) async {
    try {
      var url = Uri.http(Configs.httpLink, "/$endpoint");
      var response = await http.post(url, body: json);
      if (response.statusCode == 200) {
        var map = jsonDecode(response.body);
        return map['data'];
      } else {
        throw HTTPException.fromHTTPError(jsonDecode(response.body));
      }
    } on HTTPException {
      rethrow;
    } catch (err) {
      throw HTTPException.fromError(err);
    }
  }

  Future<Map<String, dynamic>> get({String endpoint}) async {
    try {
      var url = Uri.http(Configs.httpLink, "/$endpoint");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var map = jsonDecode(response.body);
        return map['data'];
      } else {
        throw HTTPException.fromHTTPError(jsonDecode(response.body));
      }
    } on HTTPException {
      rethrow;
    } catch (err) {
      throw HTTPException.fromError(err);
    }
  }
}
