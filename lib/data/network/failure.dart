class Failure {
  // Status code of the response (200, 201, ..300, ..400, ..500, ..etc).
  final int code;
  // The error message of the response.
  final String message;

  const Failure(this.code, this.message);
}
