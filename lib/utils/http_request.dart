
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:lesson/utils/http_hander.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lesson/services/navigator_service.dart';
import 'package:lesson/services/setup.dart';

class HttpRequest{
  static const host = "http://localhost:3000/";
  static const uri = host;

  Dio dio = Dio();

  Future<dynamic> request(String api, String method, dynamic data, {bool handler = false}) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Response? response;

    final String uri = '$host$api';

    try{

      Directory dir = await getTemporaryDirectory();
      CookieJar cookieJar = PersistCookieJar(storage: FileStorage(dir.path), ignoreExpires: true);
      dio.interceptors.add(CookieManager(cookieJar));


      const accessToken = "A";
      const deviceToken = "a";

      dio.options.headers = {
        'authorization': 'Bearer $accessToken',
        'device-token': deviceToken,
        'device_type': 'MOS',
        'device_imei': '',
        'device_info': 'iphone 13'
      };
    } catch(err){
      debugPrint("* * * * * * * START: Http Request Set Header Error Handler * * * * * * *");
        debugPrint(err.toString());
        debugPrint("* * * * * * * START: Http Request Set Header Error Handler * * * * * * *");

    }
    
    try{
      switch (method){
        case "GET":
          {
            response = await dio.get(uri, queryParameters: data);
            break;
          }
        case "POST":
          {
            response = await dio.post(uri, queryParameters: data);
            break;
          }
        case "PUT":{
          response = await dio.post(uri, queryParameters: data);
          break;
        }
        case "DELETE":{
          response = await dio.post(uri, queryParameters: data);
          break;
        }
        default:{
          break;
        }
      }
      return HttpHandler(statusCode: response?.statusCode).handle(response);
    } on DioError catch(ex){
      print(ex);
      HttpHandler? error =
          HttpHandler(statusCode: ex.response?.statusCode).handle(ex.response);
      switch (ex.response?.statusCode){
        case 401: {
          String? message = "Нэвтрэх эрхийн хүчинтэй хугацаа дууссан байна";
          if (error?.message != null && error?.message != "") {
            message = error?.message;
          }

          locator<NavigatorService>().alertDialog("$message");
          throw error!;
        }
        case 400:
          {
            String? message = "Илгээсэн мэдээлэл зөрүүтэй байна";

            if (error?.message != null && error?.message != "") {
              message = error?.message;
            }

            locator<NavigatorService>().alertDialog("$message");
            throw error!;
          }
        case 404:
          {
            throw error!;
          }
        case 500:
          {
            throw error!;
          }
        }
      }
    }

    Future<dynamic> get(String url,  {dynamic data, bool handler = true}) async{
      try {
        return await request(url, 'GET', data, handler: handler);
      } catch (e) {
        rethrow;
      }
    }
  Future<dynamic> post(String url, {dynamic data, bool handler = true}) async {
    try {
      return await request(url, 'POST', data, handler: handler);
    } catch (e) {
      debugPrint("* * * * * * * Failed POST Request Error * * * * * * *");
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<dynamic> put(String url, {dynamic data, bool handler = true}) async {
    try {
      return await request(url, 'PUT', data, handler: handler);
    } catch (e) {
      debugPrint("* * * * * * * Failed PUT Request Error * * * * * * *");
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<dynamic> del(String url, {dynamic data, bool handler = true}) async {
    try {
      return await request(url, 'DELETE', data, handler: handler);
    } catch (e) {
      debugPrint("* * * * * * * Failed DELETE Request Error * * * * * * *");
      debugPrint(e.toString());
      rethrow;
    }
  }
  }
