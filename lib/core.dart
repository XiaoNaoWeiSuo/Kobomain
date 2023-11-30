import 'package:dio/dio.dart';
import 'dart:html' as html;

import 'package:flutter/material.dart';

String initialurl = "http://127.0.0.1:8000";
//网页跳转
Future<void> redirectToUrl(Uri url) async {
  html.window.location.href = url.toString();
}

Future<Map> lntoHome(token) async {
  //String url = 'http://49.235.106.67:5000/api/userdata/';
  String url = '$initialurl/api/userdata/';
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

//用户数据更新
Future<Map> update(token, dat) async {
  //String url = 'http://49.235.106.67:5000/api/write/';
  String url = '$initialurl/api/write/';
  dat["Authorization"] = token;
  try {
    Response response = await Dio().post(url, data: dat);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return {"status": "error"};
    }
  } catch (e) {
    return {"status": "error"};
  }
}

//支付数据更新
Future<Map> mout(token, dat, paykey) async {
  String url = "$initialurl/api/checkpaykey/";
  Map<String, dynamic> data = {
    "Authorization": token,
    "paykey": paykey,
    "data": dat
  };
  try {
    Response response = await Dio().post(url, data: data);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return {"status": "error"};
    }
  } catch (e) {
    return {"status": "error"};
  }
}

Future<void> showMyDialog(BuildContext context, String text) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('提示'),
        content: Text(text),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // 关闭弹窗
            },
            child: const Text('确定'),
          ),
        ],
      );
    },
  );
}
