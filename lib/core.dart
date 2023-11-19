import 'package:dio/dio.dart';
import 'dart:html' as html;

//网页跳转
Future<void> redirectToUrl(Uri url) async {
  html.window.location.href = url.toString();
}

Future<Map> IntoHome(token) async {
  String url = 'http://49.235.106.67:5000/api/userdata/';
  Map<String, dynamic> data = {"Authorization": token};
  //print(username);
  // 发送注册请求的代码...
  try {
    Response response = await Dio().post(url, data: data);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return data;
    }
  } catch (e) {
    return data;
  }
}
