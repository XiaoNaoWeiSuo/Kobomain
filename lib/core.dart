import 'dart:math';

import 'package:dio/dio.dart';
import 'dart:html' as html;

import 'package:flutter/material.dart';

String initialurl = "http://49.235.106.67:5001";
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

String generateAnonymousUserId() {
  List<String> baseNames = [
    "林", "华", "之声", "晓", "明", "风", "雨", "彩", "云", "龙",
    "美", "希", "光", "影", "雪", "霜", "海", "波", "梦", "星",
    "翔", "力", "韵", "琴", "宇", "奇", "瑞", "青", "夜", "花"
    // 添加更多名字
  ];

  String userId = "";
  // 添加随机的星号
  int starCount = Random().nextInt(3) + 1; // 随机生成1到3个星号
  userId += "*".padRight(starCount, '*');

  // 添加汉字（1到2个字）
  int chineseCount = Random().nextInt(2) + 1;
  for (int i = 0; i < chineseCount; i++) {
    userId += getRandomElement(baseNames);
  }

  return userId;
}

String getRandomElement(List<String> list) {
  return list[Random().nextInt(list.length)];
}

String generateRandomAmount() {
  const int maxAmount = 10000;
  const int minAmount = 1;

  // 使用指数分布生成整数倍数，1元的概率最大
  double exponent = Random().nextDouble();
  int amount = (pow(maxAmount, exponent) + minAmount).toInt();

  // 保证生成的是整数倍数
  amount -= amount % minAmount;

  // 转换为保留两位小数的字符串
  String formattedAmount = (amount / 100).toStringAsFixed(2);

  return formattedAmount;
}

String generateRandomTime() {
  Random random = Random();

  // 随机生成小时和分钟
  int hour = random.nextInt(12) + 1; // 1到12之间的小时
  int minute = random.nextInt(60); // 0到59之间的分钟

  // 随机生成“上午”或“下午”
  String period = (random.nextBool()) ? "上午" : "下午";

  // 格式化时间字符串
  String formattedTime = "$period $hour:${minute.toString().padLeft(2, '0')}";

  return formattedTime;
}
