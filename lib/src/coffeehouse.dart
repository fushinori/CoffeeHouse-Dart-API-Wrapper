import 'dart:convert';

import 'package:http/http.dart' as http;

import 'exceptions.dart';

/// Base class for Coffeehouse.
class API {
  String accessKey;
  String endpoint;

  /// HTTP client for handling requests.
  http.Client _client;

  API(String accessKey,
      {String endpoint = "https://api.intellivoid.net/coffeehouse"}) {
    this.accessKey = accessKey;
    this.endpoint = endpoint;
    this._client = http.Client();
  }

  /// Handles sending requests to the server.
  ///
  /// Not meant to be called directly.
  Future<Map<String, dynamic>> send(String path,
      {bool accessKey = true, Map payload}) async {
    if (accessKey) {
      payload["access_key"] = this.accessKey;
    }
    var response = await _client.post("$endpoint/$path", body: payload);
    var result = jsonDecode(response.body);
    if (response.statusCode != 200) {
      if (response.headers.containsKey("x-request-id")) {
        String requestID = response.headers["x-request-id"];
        throw CoffeeHouseError(response.statusCode, result, requestID);
      } else {
        throw CoffeeHouseError(response.statusCode, result, "");
      }
    } else {
      return result["payload"];
    }
  }

  /// Closes the [http.Client].
  ///
  /// Call this method to free up resources after you're done.
  void close() {
    this._client.close();
  }
}
