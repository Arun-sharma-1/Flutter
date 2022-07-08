
class HTTPException implements Exception {
  final String message;
  HTTPException(this.message);

  @override
  String returnMsg() {
    return message;
  }
}
