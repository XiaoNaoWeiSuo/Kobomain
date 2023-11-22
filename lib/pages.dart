// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:async';
import 'dart:convert';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:kobo_login/sonpage.dart';
//import 'package:url_launcher/url_launcher.dart';
import 'core.dart';
import 'design.dart';

class InfoScreen extends StatefulWidget {
  final Map info;
  const InfoScreen({super.key, required this.info});
  @override
  State<InfoScreen> createState() => InfoScreenState();
}

class InfoScreenState extends State<InfoScreen> {
  String name = "";
  String id = "";
  String grade = "";
  String level = "";
  String num = "";
  @override
  void initState() {
    super.initState();

    name = widget.info["name"];
    id = widget.info["id"];
    grade = widget.info["code"];
    level = widget.info["level"];
    num = widget.info["total"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.only(top: 20, left: 20, right: 10, bottom: 10),
            height: 200,
            color: Color.fromARGB(255, 3, 67, 244),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: SizedBox()),
                Text(
                  "会员姓名：$name",
                  style:
                      TextStyle(color: Colors.white, height: 2.5, fontSize: 17),
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 3, 123, 244)),
                      child: Text(
                        "会员ID：$id",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(217, 244, 71, 3)),
                      child: Text(
                        "已实名认证",
                        style: TextStyle(color: Colors.white, fontSize: 11),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "芝麻信用：",
                      style: TextStyle(
                          color: Colors.white, height: 2.5, fontSize: 14),
                    ),
                    Text(
                      "$grade  ",
                      style: TextStyle(
                          color: Color.fromARGB(255, 216, 216, 216),
                          height: 2.5,
                          fontSize: 14),
                    ),
                    Text(
                      "会员等级：",
                      style: TextStyle(
                          color: Colors.white, height: 2.5, fontSize: 14),
                    ),
                    Text(
                      "$level  ",
                      style: TextStyle(
                          color: Color.fromARGB(255, 216, 216, 216),
                          height: 2.5,
                          fontSize: 14),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "总资产：",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    Text(
                      "$num￥",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            color: Colors.amber,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => logsScreen()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            bottom:
                                BorderSide(width: 0.3, color: Colors.black26))),
                    child: Row(
                      children: [
                        Icon(
                          Icons.copy,
                          color: Colors.black54,
                          size: 18,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "收益明细",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            bottom:
                                BorderSide(width: 0.3, color: Colors.black26))),
                    child: Row(
                      children: [
                        Icon(
                          Icons.layers,
                          color: Colors.black54,
                          size: 18,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "存款记录",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            bottom:
                                BorderSide(width: 0.3, color: Colors.black26))),
                    child: Row(
                      children: [
                        Icon(
                          Icons.credit_card,
                          color: Colors.black54,
                          size: 18,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "取款记录",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            bottom:
                                BorderSide(width: 0.3, color: Colors.black26))),
                    child: Row(
                      children: [
                        Icon(
                          Icons.settings,
                          color: Colors.black54,
                          size: 18,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "系统设置",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            bottom:
                                BorderSide(width: 0.3, color: Colors.black26))),
                    child: Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.black54,
                          size: 18,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "实名认证",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            bottom:
                                BorderSide(width: 0.3, color: Colors.black26))),
                    child: Row(
                      children: [
                        Icon(
                          Icons.home,
                          color: Colors.black54,
                          size: 18,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "语言设置",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    html.window.localStorage.remove('token');
                    redirectToUrl(Uri.parse('http://49.235.106.67'));
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            bottom:
                                BorderSide(width: 0.3, color: Colors.black26))),
                    child: Row(
                      children: [
                        Icon(
                          Icons.exit_to_app,
                          color: Colors.black54,
                          size: 18,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "退出登录",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => IndexScreenState();
}

class IndexScreenState extends State<IndexScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      Stack(
        children: [
          Column(
            children: [
              Image.network(
                "https://gw.alipayobjects.com/mdn/rms_48b4e9/afts/img/A*dML_Qqo8YKoAAAAAAAAAAAAAARQnAQ",
                height: 140,
                fit: BoxFit.fill,
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(children: [
              Row(
                children: [
                  Text(
                    "蚂蚁消金",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  Expanded(child: SizedBox()),
                  Text(
                    "语言设置",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Image.network(
                "https://img-prod-cms-rt-microsoft-com.akamaized.net/cms/api/am/imageFileData/RE4wwuO?ver=1fc3",
                height: 110,
                width: 500,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  TextAnimation(text: "测试文本滚动动画"),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 50,
                      color: Colors.white,
                      child: Row(
                        children: [
                          Icon(Icons.volume_up, size: 15, color: Colors.blue),
                          Text(
                            " 公告",
                            style: TextStyle(fontSize: 12, color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.all(10),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.blue),
                    borderRadius: BorderRadius.circular(20)),
                height: 18,
                child: Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      color: Colors.blue,
                      child: Icon(
                        Icons.access_alarm,
                        color: Colors.white,
                        size: 14,
                      ),
                    ),
                    Text(
                      "    现时抢购:活动时间:16:00~18:00",
                      style: TextStyle(fontSize: 11, color: Colors.black),
                    )
                  ],
                ),
              ),
              Row(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ModelScreen(
                                  label: "1",
                                )),
                      );
                    },
                    child: Container(
                      //padding: EdgeInsets.all(5),
                      height: 90,
                      width: 90,
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 2,
                                offset: Offset(5, 5))
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 60,
                            child: Image.asset("assets/11.png"),
                          ),
                          Text(
                            "中银宝",
                            style: TextStyle(fontSize: 10, height: 1.5),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ModelScreen(
                                    label: "2",
                                  )),
                        );
                      },
                      child: Container(
                        //padding: EdgeInsets.all(5),
                        height: 90,
                        width: 90,
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 2,
                                  offset: Offset(5, 5))
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 50,
                              child: Image.asset("assets/22.png"),
                            ),
                            Text(
                              "余额宝",
                              style: TextStyle(fontSize: 10, height: 1.5),
                            )
                          ],
                        ),
                      )),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ModelScreen(
                                    label: "3",
                                  )),
                        );
                      },
                      child: Container(
                        //padding: EdgeInsets.all(5),
                        height: 90,
                        width: 90,
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 2,
                                  offset: Offset(5, 5))
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 50,
                              child: Image.asset("assets/33.png"),
                            ),
                            Text(
                              "余利宝",
                              style: TextStyle(fontSize: 10, height: 1.5),
                            )
                          ],
                        ),
                      )),
                ],
              ),
              Container(
                margin: EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    border:
                        Border(left: BorderSide(width: 5, color: Colors.blue))),
                child: Text(
                  "   短期投资",
                  style: TextStyle(fontSize: 13),
                ),
              ),
              Row(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ModelScreen(
                                  label: "4",
                                )),
                      );
                    },
                    child: Container(
                      //padding: EdgeInsets.all(5),
                      height: 90,
                      width: 90,
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 2,
                                offset: Offset(5, 5))
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 60,
                            child: Image.asset("assets/11.png"),
                          ),
                          Text(
                            "短期中银宝",
                            style: TextStyle(fontSize: 10, height: 1.5),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ModelScreen(
                                    label: "5",
                                  )),
                        );
                      },
                      child: Container(
                        //padding: EdgeInsets.all(5),
                        height: 90,
                        width: 90,
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 2,
                                  offset: Offset(5, 5))
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 50,
                              child: Image.asset("assets/22.png"),
                            ),
                            Text(
                              "短期余额宝",
                              style: TextStyle(fontSize: 10, height: 1.5),
                            )
                          ],
                        ),
                      )),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ModelScreen(
                                    label: "6",
                                  )),
                        );
                      },
                      child: Container(
                        //padding: EdgeInsets.all(5),
                        height: 90,
                        width: 90,
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 2,
                                  offset: Offset(5, 5))
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 50,
                              child: Image.asset("assets/33.png"),
                            ),
                            Text(
                              "短期余利宝",
                              style: TextStyle(fontSize: 10, height: 1.5),
                            )
                          ],
                        ),
                      )),
                ],
              ),
              Container(
                margin: EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    border:
                        Border(left: BorderSide(width: 5, color: Colors.blue))),
                child: Text(
                  "   长期投资",
                  style: TextStyle(fontSize: 13),
                ),
              ),
              Row(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ModelScreen(
                                  label: "7",
                                )),
                      );
                    },
                    child: Container(
                      //padding: EdgeInsets.all(5),
                      height: 90,
                      width: 90,
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 2,
                                offset: Offset(5, 5))
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 60,
                            child: Image.asset("assets/11.png"),
                          ),
                          Text(
                            "长期中银宝",
                            style: TextStyle(fontSize: 10, height: 1.5),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ModelScreen(
                                    label: "8",
                                  )),
                        );
                      },
                      child: Container(
                        //padding: EdgeInsets.all(5),
                        height: 90,
                        width: 90,
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 2,
                                  offset: Offset(5, 5))
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 50,
                              child: Image.asset("assets/22.png"),
                            ),
                            Text(
                              "长期余额宝",
                              style: TextStyle(fontSize: 10, height: 1.5),
                            )
                          ],
                        ),
                      )),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ModelScreen(
                                    label: "9",
                                  )),
                        );
                      },
                      child: Container(
                        //padding: EdgeInsets.all(5),
                        height: 90,
                        width: 90,
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 2,
                                  offset: Offset(5, 5))
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 50,
                              child: Image.asset("assets/33.png"),
                            ),
                            Text(
                              "长期余利宝",
                              style: TextStyle(fontSize: 10, height: 1.5),
                            )
                          ],
                        ),
                      )),
                ],
              ),
              Container(
                margin: EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    border:
                        Border(left: BorderSide(width: 5, color: Colors.blue))),
                child: Text(
                  "   收益推荐",
                  style: TextStyle(fontSize: 13),
                ),
              ),
              Row(
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        //padding: EdgeInsets.all(5),
                        height: 90,
                        width: 90,
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 199, 214, 255),
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 2,
                                  offset: Offset(5, 5))
                            ]),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 5),
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(4),
                                          bottomRight: Radius.circular(4))),
                                  alignment: Alignment.centerLeft,
                                  child: Text(" 蚂蚁抢购",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 8)),
                                ),
                                Expanded(child: SizedBox())
                              ],
                            ),
                            Text(
                              "限时抢购",
                              style: TextStyle(
                                  fontSize: 8, height: 1.5, color: Colors.red),
                            ),
                            Text(
                              "6.35",
                              style: TextStyle(
                                  fontSize: 8, height: 1.5, color: Colors.red),
                            ),
                            Text(
                              "9.45",
                              style: TextStyle(
                                  fontSize: 8, height: 1.5, color: Colors.red),
                            ),
                            Text(
                              "12.25",
                              style: TextStyle(
                                  fontSize: 8, height: 1.5, color: Colors.red),
                            ),
                            Text(
                              "时收益",
                              style: TextStyle(
                                  fontSize: 7,
                                  height: 1.5,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        //padding: EdgeInsets.all(5),
                        height: 90,
                        width: 90,
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 199, 214, 255),
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 2,
                                  offset: Offset(5, 5))
                            ]),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 5),
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(4),
                                          bottomRight: Radius.circular(4))),
                                  alignment: Alignment.centerLeft,
                                  child: Text(" 蚂蚁公益",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 8)),
                                ),
                                Expanded(child: SizedBox())
                              ],
                            ),
                            Text(
                              "短期灵活",
                              style: TextStyle(
                                  fontSize: 8, height: 1.5, color: Colors.red),
                            ),
                            Text(
                              "5.85",
                              style: TextStyle(
                                  fontSize: 8, height: 1.5, color: Colors.red),
                            ),
                            Text(
                              "8.95",
                              style: TextStyle(
                                  fontSize: 8, height: 1.5, color: Colors.red),
                            ),
                            Text(
                              "11.75",
                              style: TextStyle(
                                  fontSize: 8, height: 1.5, color: Colors.red),
                            ),
                            Text(
                              "时收益",
                              style: TextStyle(
                                  fontSize: 7,
                                  height: 1.5,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        //padding: EdgeInsets.all(5),
                        height: 90,
                        width: 90,
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 199, 214, 255),
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 2,
                                  offset: Offset(5, 5))
                            ]),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 5),
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(4),
                                          bottomRight: Radius.circular(4))),
                                  alignment: Alignment.centerLeft,
                                  child: Text(" 阿里巴巴",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 8)),
                                ),
                                Expanded(child: SizedBox())
                              ],
                            ),
                            Text(
                              "长期收益",
                              style: TextStyle(
                                  fontSize: 8, height: 1.5, color: Colors.red),
                            ),
                            Text(
                              "6.35",
                              style: TextStyle(
                                  fontSize: 8, height: 1.5, color: Colors.red),
                            ),
                            Text(
                              "9.45",
                              style: TextStyle(
                                  fontSize: 8, height: 1.5, color: Colors.red),
                            ),
                            Text(
                              "12.25",
                              style: TextStyle(
                                  fontSize: 8, height: 1.5, color: Colors.red),
                            ),
                            Text(
                              "时收益",
                              style: TextStyle(
                                  fontSize: 7,
                                  height: 1.5,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                  ])
            ]),
          )
        ],
      )
    ]));
  }
}

class HomeScreen extends StatefulWidget {
  Map data;
  HomeScreen({required this.data});
  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  Map info = {};
  @override
  void initState() {
    super.initState();
    info = json.decode(widget.data["data2"].replaceAll("'", "\""));
  }

  int selectedButtonIndex = 4;
  final PageController homepagecontroller = PageController(initialPage: 4);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
            child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: homepagecontroller,
          children: [
            IndexScreen(),
            CunScreen(),
            TalkScreen(),
            OutScreen(),
            InfoScreen(info: info)
          ],
        )),
        Container(
          height: 60,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // 首页按钮
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.home),
                    color:
                        selectedButtonIndex == 0 ? Colors.blue : Colors.black54,
                    onPressed: () {
                      setState(() {
                        selectedButtonIndex = 0; // 更新选中的按钮索引
                        homepagecontroller.jumpToPage(
                          0, // 首页对应的页面索引
                        );
                      });
                    },
                  ),
                  Text(
                    '首页',
                    style: TextStyle(
                      fontSize: 10,
                      color: selectedButtonIndex == 0
                          ? Colors.blue
                          : Colors.black54,
                    ),
                  ),
                ],
              ),
// 存款按钮
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(
                      IconData(0xe617,
                          fontFamily: 'KoboIcon', matchTextDirection: true),
                      //size: 20,
                    ),
                    color:
                        selectedButtonIndex == 1 ? Colors.blue : Colors.black54,
                    onPressed: () {
                      setState(() {
                        selectedButtonIndex = 1; // 更新选中的按钮索引
                        homepagecontroller.jumpToPage(
                          1, // 存款页面对应的页面索引
                        );
                      });
                    },
                  ),
                  Text(
                    '存款',
                    style: TextStyle(
                      fontSize: 10,
                      color: selectedButtonIndex == 1
                          ? Colors.blue
                          : Colors.black54,
                    ),
                  ),
                ],
              ),
              // 客服按钮
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(
                      IconData(0xe621,
                          fontFamily: 'KoboIcon', matchTextDirection: true),
                      //size: 20,
                    ),
                    color:
                        selectedButtonIndex == 2 ? Colors.blue : Colors.black54,
                    onPressed: () {
                      setState(() {
                        selectedButtonIndex = 2; // 更新选中的按钮索引
                        homepagecontroller.jumpToPage(
                          2, // 存款页面对应的页面索引
                        );
                      });
                    },
                  ),
                  Text(
                    '客服',
                    style: TextStyle(
                      fontSize: 10,
                      color: selectedButtonIndex == 2
                          ? Colors.blue
                          : Colors.black54,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(
                      IconData(0xe8f7,
                          fontFamily: 'KoboIcon', matchTextDirection: true),
                      //size: 20,
                    ),
                    color:
                        selectedButtonIndex == 3 ? Colors.blue : Colors.black54,
                    onPressed: () {
                      setState(() {
                        selectedButtonIndex = 3; // 更新选中的按钮索引
                        homepagecontroller.jumpToPage(
                          3, // 存款页面对应的页面索引
                        );
                      });
                    },
                  ),
                  Text(
                    '取款',
                    style: TextStyle(
                      fontSize: 10,
                      color: selectedButtonIndex == 3
                          ? Colors.blue
                          : Colors.black54,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.person),
                    color:
                        selectedButtonIndex == 4 ? Colors.blue : Colors.black54,
                    onPressed: () {
                      setState(() {
                        selectedButtonIndex = 4; // 更新选中的按钮索引
                        homepagecontroller.jumpToPage(
                          4, // 存款页面对应的页面索引
                        );
                      });
                    },
                  ),
                  Text(
                    '我的',
                    style: TextStyle(
                      fontSize: 10,
                      color: selectedButtonIndex == 4
                          ? Colors.blue
                          : Colors.black54,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    ));
  }
}

class TalkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "跳转客服页面",
          style: TextStyle(color: Colors.black87, fontSize: 18),
        ),
      ),
    );
  }
}

class CunScreen extends StatefulWidget {
  const CunScreen({super.key});

  @override
  State<CunScreen> createState() => CunScreenState();
}

class CunScreenState extends State<CunScreen> {
  int payway = 0;
  bool expandstate = false;
  List way = ["USDT", "银行", "支付宝"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Transform.translate(
            offset: Offset(0, -500),
            child: FractionallySizedBox(
              widthFactor: 2,
              heightFactor: 1,
              alignment: Alignment.topCenter,
              child: Container(
                width: 400,
                height: 500,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 71, 119, 219),
                    borderRadius: BorderRadius.circular(500)),
              ),
            )),
        Column(children: [
          Text(
            "存款",
            style: TextStyle(color: Colors.white, fontSize: 17, height: 3),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
            width: 500,
            height: 110,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "    会员ID        ",
                      style: TextStyle(
                          color: Colors.black, fontSize: 12, height: 2.5),
                    ),
                    Text("------")
                  ],
                ),
                Container(
                  height: 1,
                  width: 500,
                  color: Colors.black26,
                ),
                Row(
                  children: [
                    Text(
                      "    会员昵称    ",
                      style: TextStyle(
                          color: Colors.black, fontSize: 12, height: 2.5),
                    ),
                    Text("------")
                  ],
                ),
                Container(
                  height: 1,
                  width: 500,
                  color: Colors.black26,
                ),
                Row(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: Colors.black87)),
                      child: Center(
                        child: Text(
                          "￥",
                          style: TextStyle(
                              color: Colors.black, fontSize: 9, height: 1),
                        ),
                      ),
                    ),
                    Text(
                      "  当前金额:-----￥",
                      style: TextStyle(
                          color: Colors.black, fontSize: 12, height: 2.5),
                    ),
                  ],
                ),
                Container(
                  height: 1,
                  width: 500,
                  color: Colors.black26,
                ),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 5),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
              width: 500,
              height: 200,
              child: Row(
                children: [
                  SizedBox(
                    width: 70,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "支付方式",
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                        SizedBox(
                            height: 50,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "二维码",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                              ),
                            )),
                        SizedBox(
                            height: 20,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "卡号",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                              ),
                            )),
                        SizedBox(
                            height: 30,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "姓名",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                              ),
                            )),
                        SizedBox(
                            height: 30,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "备注",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                              ),
                            )),
                        SizedBox(
                            height: 32,
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                "存款金额",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Stack(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 17,
                        ),
                        SizedBox(
                            height: 50,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "二维码",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                              ),
                            )),
                        SizedBox(
                            height: 20,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Text(
                                    "请联系在线客服     ",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 12),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(3)),
                                    child: Text(
                                      " 复制 ",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 11),
                                    ),
                                  )
                                ],
                              ),
                            )),
                        SizedBox(
                            height: 30,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "请联系在线客服",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                              ),
                            )),
                        SizedBox(
                            height: 30,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "平台会不定期更换收款账号，请联系在线客服获取最新收款账号",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                              ),
                            )),
                        SizedBox(
                            height: 30,
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: TextField(
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(0),
                                      border: InputBorder.none,
                                      hintText: "请输入存款金额"),
                                ))),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              expandstate = !expandstate;
                            });
                          },
                          child: AnimatedContainer(
                            //padding: EdgeInsets.all(2),
                            duration: Duration(milliseconds: 500),
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(width: 1, color: Colors.black12),
                                borderRadius: BorderRadius.circular(3)),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      " ${way[payway]}入款",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 11),
                                    ),
                                    Expanded(child: SizedBox()),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 16,
                                    )
                                  ],
                                ),
                                expandstate
                                    ? SizedBox(
                                        height: 50,
                                        child: ListView.builder(
                                          itemCount: 3,
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    payway = index;
                                                    expandstate = !expandstate;
                                                  });
                                                },
                                                child: Text(
                                                  "  ${way[index]}",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12),
                                                ));
                                          },
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ]))
                ],
              )),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(10),
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.blue,
              ),
              child: Center(
                child: Text(
                  "确定",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
          )
        ])
      ]),
    );
  }
}

class OutScreen extends StatefulWidget {
  const OutScreen({super.key});

  @override
  State<OutScreen> createState() => OutScreenState();
}

class OutScreenState extends State<OutScreen> {
  int payway = 0;
  bool expandstate = false;
  List way = ["USDT", "银行", "支付宝"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          color: Color.fromARGB(255, 33, 86, 243),
          child: Center(
            child: Text(
              "用户出金",
              style: TextStyle(color: Colors.white, fontSize: 15, height: 2),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
            padding: EdgeInsets.all(10),
            width: 500,
            height: 200,
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)]),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          "提款余额：",
                          style: TextStyle(
                              color: Colors.black, fontSize: 13, height: 2),
                        ),
                        Text(
                          "262910.00￥",
                          style: TextStyle(
                              color: Colors.red, fontSize: 13, height: 2),
                        ),
                      ],
                    ),
                    TextField(
                      decoration: InputDecoration(
                          prefixIcon: Text(
                        "￥",
                        style: TextStyle(
                            color: Colors.black, fontSize: 15, height: 2),
                      )),
                    ),
                    Text(
                      "  单次提现金额至少￥100.00",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 11,
                      ),
                    ),
                    Text(
                      "  取款时间为每日10:00--22:00",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 11,
                      ),
                    ),
                    Text(
                      "取款密码：",
                      style: TextStyle(color: Colors.black, fontSize: 13),
                    ),
                    SizedBox(
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Text(
                              "提款方式：",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              expandstate = !expandstate;
                            });
                          },
                          child: AnimatedContainer(
                            //padding: EdgeInsets.all(2),
                            duration: Duration(milliseconds: 500),
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(width: 1, color: Colors.black12),
                                borderRadius: BorderRadius.circular(3)),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      " ${way[payway]}",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 11),
                                    ),
                                    Expanded(child: SizedBox()),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 16,
                                    )
                                  ],
                                ),
                                expandstate
                                    ? SizedBox(
                                        height: 50,
                                        child: ListView.builder(
                                          itemCount: 3,
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    payway = index;
                                                    expandstate = !expandstate;
                                                  });
                                                },
                                                child: Text(
                                                  "  ${way[index]}",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12),
                                                ));
                                          },
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            )),
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(10),
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.blue,
            ),
            child: Center(
              child: Text(
                "确认出金",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
