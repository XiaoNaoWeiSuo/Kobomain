import 'package:flutter/material.dart';
import 'core.dart';
import 'pages.dart';
import 'dart:html' as html;
import 'sonpage.dart';

Future<void> main() async {
  String? urlToken =
      Uri.parse(html.window.location.href).queryParameters['token'];
  // 如果地址中有 token，则存储到本地存储中
  if (urlToken != null) {
    html.window.localStorage['token'] = urlToken;
  }
  //  else {
  //   html.window.localStorage['token'] =
  //       "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX25hbWUiOiIyMDIyMDA3OTIzIiwiZXhwIjoxNzAwNzQ3NTk5fQ.Rmgk1arZKHCIMpvRqYoNPNKF6qjwk6rKQciT1ymh-kE";
  // }
  // 获取本地存储中的 token
  String? storedToken = html.window.localStorage['token'];
  print("Token is $storedToken");

  Map data = await IntoHome(storedToken);
  //print("Data is$data");
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
      //home: logsScreen(),
      home: HomeScreen(data: data),
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
