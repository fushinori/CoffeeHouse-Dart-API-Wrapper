import 'lydia.dart';

/// Represents a single Lydia session.
///
/// You needn't directly instantiate this class.
class LydiaSession {
  /// [Lydia] client associated with this session.
  Lydia _client;

  /// Unique identifier of the current session.
  String id;

  /// Language this session started in.
  String language;

  /// Whether this session has expired or not.
  bool available;

  /// Unix timestamp for when this session will expire.
  int expires;

  LydiaSession(Map<String, dynamic> data, Lydia client) {
    this._client = client;
    this.id = data["session_id"];
    this.language = data["language"];
    this.available = data["available"];
    this.expires = data["expires"];
  }

  /// Processes user input and returns text response of the AI.
  Future<String> thinkThought(String message) async {
    return await _client.thinkThought(id, message);
  }

  @override
  String toString() => id;
}
