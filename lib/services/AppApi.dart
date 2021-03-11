import 'package:dio/dio.dart';

class AppApi {
  static Dio _dio = Dio(BaseOptions(
      baseUrl: "https://us-central1-grigora-alt.cloudfunctions.net"));

  static Future getHomeScreenApi() {
    return _dio.get("/home");
  }

  static Future getRestaurantDetail() {
    return _dio.get("/details");
  }
}
