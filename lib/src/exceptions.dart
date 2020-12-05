/// Exception thrown when the server returns an error.
class CoffeeHouseError implements Exception {
  int statusCode;
  Map<String, dynamic> message;
  String requestID;

  CoffeeHouseError(this.statusCode, this.message, this.requestID);

  @override
  String toString() {
    return "CoffeeHouseError: $message";
  }
}
