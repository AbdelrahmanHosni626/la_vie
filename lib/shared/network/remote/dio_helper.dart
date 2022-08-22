import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';


class DioHelper {

  static late Dio dio;

  static init()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://lavie.orangedigitalcenteregypt.com',
        receiveDataWhenStatusError: true,
      ),
    );
  }


  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? accessToken,
})
  async {
    dio.options.headers =
    {
      'Content-Type' : 'application/json',
      'Accept' : 'application/json',
      'lang': lang,
      'Authorization': 'Bearer $accessToken',
    };

    return await dio.get(url, queryParameters: query,);
  }



  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? accessToken,
  })
  async {

    dio.options.headers =
    {
      'Content-Type' : 'application/json',
      'Accept' : 'application/json',
      'lang': lang,
      'Authorization': 'Bearer $accessToken',

    };

    return await dio.post(
      url,
      data: data,
      queryParameters: query,
    );
  }
}
