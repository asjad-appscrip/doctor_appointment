class ResponseModel {
  ResponseModel({
    required this.data,
    required this.hasError,
    this.statusCode,
  });
  String data;
  bool hasError;
  int? statusCode;
}
