import 'package:flutter/material.dart';
import 'core.dart';
import 'pages.dart';
import 'dart:html' as html;

Future<void> main() async {
  String? urlToken =
      Uri.parse(html.window.location.href).queryParameters['token'];
  // 如果地址中有 token，则存储到本地存储中
  if (urlToken != null) {
    html.window.localStorage['token'] = urlToken;
  }
  // 获取本地存储中的 token
  String? storedToken = html.window.localStorage['token'];
  Map data = await IntoHome(storedToken);
  runApp(MyApp(
    data: data,
  ));
}

class MyApp extends StatelessWidget {
  final Map data;
  const MyApp({required this.data, super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IndexScreen(),
      //home: HomeScreen(data: data),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container());
  }
}
