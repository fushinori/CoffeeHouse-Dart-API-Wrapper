import '../coffeehouse.dart';
import 'session.dart';

/// Main client to manage Lydia sessions.
class Lydia extends API {
  Lydia(String access_key) : super(access_key);

  /// Creates and returns a new [LydiaSession].
  Future<LydiaSession> createSession({String language = "en"}) async {
    var data = await this.send("v1/lydia/session/create",
        payload: {"target_language": language});
    return LydiaSession(data, this);
  }

  /// Returns existing [LydiaSession].
  Future<LydiaSession> getSession(String sessionID) async {
    var data = await this
        .send("v1/lydia/session/get", payload: {"session_id": sessionID});
    return LydiaSession(data, this);
  }

  /// Processes user input and returns text response of the AI.
  Future<String> thinkThought(String sessionID, String message) async {
    var payload = await this.send("v1/lydia/session/think",
        payload: {"session_id": sessionID, "input": message});
    return payload["output"];
  }
}
