class BaseResponse {
  final int? statusCode;
  final String? message;
  final dynamic data;

  BaseResponse({this.statusCode, this.message, this.data});

  BaseResponse.error({this.message, this.statusCode}) : data = null;
  BaseResponse.ignored()
      : data = null,
        message = null,
        statusCode = null;

  bool get isSuccess => statusCode == 200;
  bool get shouldIgnore => statusCode == -1;
}
