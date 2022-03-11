import '../_library_exporter.dart';

class ServiceFactory {
  static Map<String, String> jsonHeaders() {
    return {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + ServerConfig.TOKEN,
      "accept": "text/plain",
      // "Access-Control-Allow-Origin": "*",
      // "Access-Control-Allow-Methods": "GET,POST,OPTIONS,DELETE,PUT",
    };
  }

  static Map<String, String> formHeaders() {
    return {
      "Content-Type": "multipart/form-data",
      "Authorization": "Bearer " + ServerConfig.TOKEN,
      "accept": "text/plain",
      // "Access-Control-Allow-Origin": "*",
      // "Access-Control-Allow-Methods": "GET,POST,OPTIONS,DELETE,PUT",
    };
  }
}
