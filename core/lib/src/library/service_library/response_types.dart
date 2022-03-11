class SingleApiResponse<T> {
  int statusCode;
  String message;
  T data;

  SingleApiResponse(this.statusCode, this.message, this.data);
}

class ListApiResponse<T> {
  int statusCode;
  String message;
  List<T> data;
  int totalCount;

  ListApiResponse(
    this.statusCode,
    this.message,
    this.data,
    this.totalCount,
  );
}

class StringApiResponse {
  int statusCode;
  String message;
  String data;

  StringApiResponse(
    this.statusCode,
    this.message,
    this.data,
  );
}
