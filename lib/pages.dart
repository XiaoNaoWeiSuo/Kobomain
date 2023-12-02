//import 'dart:async';
//import 'dart:convert';
import 'dart:async';
import 'dart:html' as html;
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'package:kobo_login/sonpage.dart';
//import 'package:url_launcher/url_launcher.dart';
import 'core.dart';
import 'design.dart';

class InfoScreen extends StatefulWidget {
  final Map info;
  final List history;
  final List tin;
  final List tout;
  const InfoScreen(
      {super.key,
      required this.info,
      required this.history,
      required this.tin,
      required this.tout});
  @override
  State<InfoScreen> createState() => InfoScreenState();
}

class InfoScreenState extends State<InfoScreen> {
  String name = "";
  String id = "";
  String grade = "";
  String level = "";
  String num = "";
  String identiy = "0";
  @override
  void initState() {
    super.initState();

    name = widget.info["name"];
    id = widget.info["id"];
    grade = widget.info["code"];
    level = widget.info["level"];
    num = widget.info["total"];
    identiy = widget.info["check"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding:
                const EdgeInsets.only(top: 20, left: 20, right: 10, bottom: 10),
            height: 200,
            color: const Color.fromARGB(255, 3, 67, 244),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(child: SizedBox()),
                Text(
                  "会员姓名：$name",
                  style: const TextStyle(
                      color: Colors.white, height: 2.5, fontSize: 17),
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color.fromARGB(255, 3, 123, 244)),
                      child: Text(
                        "会员ID：$id",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: identiy == "1"
                              ? const Color.fromARGB(217, 244, 71, 3)
                              : const Color.fromARGB(158, 244, 71, 3)),
                      child: identiy == "1"
                          ? const Text(
                              "已实名认证",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 11),
                            )
                          : const Text(
                              "未实名认证",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 239, 239, 239),
                                  fontSize: 11),
                            ),
                    )
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "芝麻信用：",
                      style: TextStyle(
                          color: Colors.white, height: 2.5, fontSize: 14),
                    ),
                    Text(
                      "$grade  ",
                      style: const TextStyle(
                          color: Color.fromARGB(255, 216, 216, 216),
                          height: 2.5,
                          fontSize: 14),
                    ),
                    const Text(
                      "会员等级：",
                      style: TextStyle(
                          color: Colors.white, height: 2.5, fontSize: 14),
                    ),
                    Text(
                      "$level  ",
                      style: const TextStyle(
                          color: Color.fromARGB(255, 216, 216, 216),
                          height: 2.5,
                          fontSize: 14),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "总资产：",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    Text(
                      "$num￥",
                      style: const TextStyle(color: Colors.white, fontSize: 22),
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
                      MaterialPageRoute(
                          builder: (context) => LogsScreen(
                                log: widget.history,
                              )),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            bottom:
                                BorderSide(width: 0.3, color: Colors.black26))),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.copy,
                          color: Colors.black54,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "收益明细",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
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
                          builder: (context) => DepositScreen(tin: widget.tin)),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            bottom:
                                BorderSide(width: 0.3, color: Colors.black26))),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.layers,
                          color: Colors.black54,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "存款记录",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
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
                          builder: (context) => AtmScreen(
                                out: widget.tout,
                              )),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            bottom:
                                BorderSide(width: 0.3, color: Colors.black26))),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.credit_card,
                          color: Colors.black54,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "取款记录",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
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
                          builder: (context) => const SettingScreen()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            bottom:
                                BorderSide(width: 0.3, color: Colors.black26))),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.settings,
                          color: Colors.black54,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "系统设置",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const IdentityScreen()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            bottom:
                                BorderSide(width: 0.3, color: Colors.black26))),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.person,
                          color: Colors.black54,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "实名认证",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
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
                          builder: (context) => const LanguageScreen()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            bottom:
                                BorderSide(width: 0.3, color: Colors.black26))),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.home,
                          color: Colors.black54,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "语言设置",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    html.window.localStorage.remove('token');
                    redirectToUrl(Uri.parse('$initialurl/index/'));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            bottom:
                                BorderSide(width: 0.3, color: Colors.black26))),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.exit_to_app,
                          color: Colors.black54,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "退出登录",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
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

class IndexScreenState extends State<IndexScreen>
    with SingleTickerProviderStateMixin {
  List<List> messages = [];

  final ScrollController _scrollController = ScrollController();
  void Tomaxposition() {
    messages.add([
      generateAnonymousUserId(),
      generateRandomAmount(),
      generateRandomTime()
    ]);
    setState(() {});
    Future.delayed(const Duration(milliseconds: 500), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    messages.add([
      generateAnonymousUserId(),
      generateRandomAmount(),
      generateRandomTime()
    ]);

    Timer.periodic(const Duration(seconds: 3), (timer) {
      // 每三秒触发一次的操作
      Tomaxposition();
    });
  }

  Widget _buildMessageWidget(String message, String value, String time) {
    return Container(
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: const Icon(
              Icons.person,
              size: 20,
              color: Colors.black26,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            message,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            "  捐款$value元   ",
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
          Text(
            "$time  ",
            style: const TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.w300),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      Stack(
        children: [
          Image.asset(
            "assets/bg1.jpg",
            height: 140,
            width: 500,
            fit: BoxFit.fitWidth,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(children: [
              Row(
                children: const [
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
              const SizedBox(
                height: 50,
              ),
              Image.asset(
                "assets/bg2.jpg",
                height: 110,
                width: 500,
                fit: BoxFit.fitWidth,
              ),
              const SizedBox(
                height: 10,
              ),
              // Stack(
              //   children: [
              //     //const Text("        测试文本测试文本测试文本测试文本测试文本测试文本"),
              //const TextAnimation(text: "凝聚爱心用户 4,535,294,299 次捐赠"),
              SizedBox(
                height: 55,
                //padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _scrollController,
                  //reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 1.0),
                        child: Row(
                          children: [
                            _buildMessageWidget(messages[index][0],
                                messages[index][1], messages[index][2]),
                            const Expanded(child: SizedBox())
                          ],
                        ));
                  },
                ),
              ),
              //     Align(
              //         alignment: Alignment.centerLeft,
              //         child: Container(
              //           color: Colors.white,
              //           child: const Text(
              //             " 公  告 ",
              //             style: TextStyle(color: Colors.blue),
              //           ),
              //         ))
              //   ],
              // ),
              Container(
                margin: const EdgeInsets.all(10),
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
                      child: const Icon(
                        Icons.access_alarm,
                        color: Colors.white,
                        size: 14,
                      ),
                    ),
                    const Text(
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
                    child: Container(
                      //padding: EdgeInsets.all(5),
                      height: 100,
                      width: 100,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 2,
                                offset: Offset(5, 5))
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 70,
                            child: Image.asset("assets/11.png"),
                          ),
                          const Text(
                            "中银宝",
                            style: TextStyle(fontSize: 10, height: 1.5),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                      child: Container(
                    //padding: EdgeInsets.all(5),
                    height: 100,
                    width: 100,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 2,
                              offset: Offset(5, 5))
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 70,
                          child: Image.asset("assets/22.png"),
                        ),
                        const Text(
                          "余额宝",
                          style: TextStyle(fontSize: 10, height: 1.5),
                        )
                      ],
                    ),
                  )),
                  GestureDetector(
                      child: Container(
                    //padding: EdgeInsets.all(5),
                    height: 100,
                    width: 100,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 2,
                              offset: Offset(5, 5))
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 70,
                          child: Image.asset("assets/33.png"),
                        ),
                        const Text(
                          "余利宝",
                          style: TextStyle(fontSize: 10, height: 1.5),
                        )
                      ],
                    ),
                  )),
                ],
              ),
              Container(
                margin: const EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                decoration: const BoxDecoration(
                    border:
                        Border(left: BorderSide(width: 5, color: Colors.blue))),
                child: const Text(
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
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              const ModelScreen(
                            label: "4",
                          ),
                          transitionsBuilder:
                              (context, animation1, animation2, child) {
                            return child; // 返回child即可去掉动画
                          },
                        ),
                      );
                    },
                    child: Container(
                      //padding: EdgeInsets.all(5),
                      height: 100,
                      width: 100,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 2,
                                offset: Offset(5, 5))
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 70,
                            child: Image.asset("assets/11.png"),
                          ),
                          const Text(
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
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                const ModelScreen(
                              label: "5",
                            ),
                            transitionsBuilder:
                                (context, animation1, animation2, child) {
                              return child; // 返回child即可去掉动画
                            },
                          ),
                        );
                      },
                      child: Container(
                        //padding: EdgeInsets.all(5),
                        height: 100,
                        width: 100,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 2,
                                  offset: Offset(5, 5))
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 70,
                              child: Image.asset("assets/22.png"),
                            ),
                            const Text(
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
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                const ModelScreen(
                              label: "6",
                            ),
                            transitionsBuilder:
                                (context, animation1, animation2, child) {
                              return child; // 返回child即可去掉动画
                            },
                          ),
                        );
                      },
                      child: Container(
                        //padding: EdgeInsets.all(5),
                        height: 100,
                        width: 100,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 2,
                                  offset: Offset(5, 5))
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 70,
                              child: Image.asset("assets/33.png"),
                            ),
                            const Text(
                              "短期余利宝",
                              style: TextStyle(fontSize: 10, height: 1.5),
                            )
                          ],
                        ),
                      )),
                ],
              ),
              Container(
                margin: const EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                decoration: const BoxDecoration(
                    border:
                        Border(left: BorderSide(width: 5, color: Colors.blue))),
                child: const Text(
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
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              const ModelScreen(
                            label: "7",
                          ),
                          transitionsBuilder:
                              (context, animation1, animation2, child) {
                            return child; // 返回child即可去掉动画
                          },
                        ),
                      );
                    },
                    child: Container(
                      //padding: EdgeInsets.all(5),
                      height: 100,
                      width: 100,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 2,
                                offset: Offset(5, 5))
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 70,
                            child: Image.asset("assets/11.png"),
                          ),
                          const Text(
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
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                const ModelScreen(
                              label: "8",
                            ),
                            transitionsBuilder:
                                (context, animation1, animation2, child) {
                              return child; // 返回child即可去掉动画
                            },
                          ),
                        );
                      },
                      child: Container(
                        //padding: EdgeInsets.all(5),
                        height: 100,
                        width: 100,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 2,
                                  offset: Offset(5, 5))
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 70,
                              child: Image.asset("assets/22.png"),
                            ),
                            const Text(
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
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                const ModelScreen(
                              label: "9",
                            ),
                            transitionsBuilder:
                                (context, animation1, animation2, child) {
                              return child; // 返回child即可去掉动画
                            },
                          ),
                        );
                      },
                      child: Container(
                        //padding: EdgeInsets.all(5),
                        height: 100,
                        width: 100,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 2,
                                  offset: Offset(5, 5))
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 70,
                              child: Image.asset("assets/33.png"),
                            ),
                            const Text(
                              "长期余利宝",
                              style: TextStyle(fontSize: 10, height: 1.5),
                            )
                          ],
                        ),
                      )),
                ],
              ),
              Container(
                margin: const EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                decoration: const BoxDecoration(
                    border:
                        Border(left: BorderSide(width: 5, color: Colors.blue))),
                child: const Text(
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
                        height: 100,
                        width: 100,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 199, 214, 255),
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const [
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
                                  margin: const EdgeInsets.only(top: 5),
                                  width: 40,
                                  decoration: const BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(4),
                                          bottomRight: Radius.circular(4))),
                                  alignment: Alignment.centerLeft,
                                  child: const Text(" 蚂蚁抢购",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 8)),
                                ),
                                const Expanded(child: SizedBox())
                              ],
                            ),
                            const Text(
                              "限时抢购",
                              style: TextStyle(
                                  fontSize: 10, height: 1.5, color: Colors.red),
                            ),
                            const Text(
                              "6.35",
                              style: TextStyle(
                                  fontSize: 10, height: 1.5, color: Colors.red),
                            ),
                            const Text(
                              "9.45",
                              style: TextStyle(
                                  fontSize: 10, height: 1.5, color: Colors.red),
                            ),
                            const Text(
                              "12.25",
                              style: TextStyle(
                                  fontSize: 10, height: 1.5, color: Colors.red),
                            ),
                            const Text(
                              "时收益",
                              style: TextStyle(
                                  fontSize: 10,
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
                        height: 100,
                        width: 100,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 199, 214, 255),
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const [
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
                                  margin: const EdgeInsets.only(top: 5),
                                  width: 40,
                                  decoration: const BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(4),
                                          bottomRight: Radius.circular(4))),
                                  alignment: Alignment.centerLeft,
                                  child: const Text(" 蚂蚁公益",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 8)),
                                ),
                                const Expanded(child: SizedBox())
                              ],
                            ),
                            const Text(
                              "短期灵活",
                              style: TextStyle(
                                  fontSize: 10, height: 1.5, color: Colors.red),
                            ),
                            const Text(
                              "5.85",
                              style: TextStyle(
                                  fontSize: 10, height: 1.5, color: Colors.red),
                            ),
                            const Text(
                              "8.95",
                              style: TextStyle(
                                  fontSize: 10, height: 1.5, color: Colors.red),
                            ),
                            const Text(
                              "11.75",
                              style: TextStyle(
                                  fontSize: 10, height: 1.5, color: Colors.red),
                            ),
                            const Text(
                              "时收益",
                              style: TextStyle(
                                  fontSize: 10,
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
                        height: 100,
                        width: 100,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 199, 214, 255),
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const [
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
                                  margin: const EdgeInsets.only(top: 5),
                                  width: 40,
                                  decoration: const BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(4),
                                          bottomRight: Radius.circular(4))),
                                  alignment: Alignment.centerLeft,
                                  child: const Text(" 阿里巴巴",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 8)),
                                ),
                                const Expanded(child: SizedBox())
                              ],
                            ),
                            const Text(
                              "长期收益",
                              style: TextStyle(
                                  fontSize: 10, height: 1.5, color: Colors.red),
                            ),
                            const Text(
                              "6.35",
                              style: TextStyle(
                                  fontSize: 10, height: 1.5, color: Colors.red),
                            ),
                            const Text(
                              "9.45",
                              style: TextStyle(
                                  fontSize: 10, height: 1.5, color: Colors.red),
                            ),
                            const Text(
                              "12.25",
                              style: TextStyle(
                                  fontSize: 10, height: 1.5, color: Colors.red),
                            ),
                            const Text(
                              "时收益",
                              style: TextStyle(
                                  fontSize: 10,
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
  final Map data;
  const HomeScreen({super.key, required this.data});
  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  Map info = {};
  List history = [];
  @override
  void initState() {
    super.initState();
    info = widget.data["data2"]; // json.decode(.replaceAll("'", "\""));
    history = widget.data["data3"]["object"];
  }

  void jumppage(int label) {
    if (widget.data["data2"]["check"] == "1" || label == 4 || label == 0) {
      homepagecontroller.jumpToPage(
        label, // 存款页面对应的页面索引
      );
    } else {
      showMyDialog(context, "请先完成实名认证");
      selectedButtonIndex = 4;
    }
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
          physics: const NeverScrollableScrollPhysics(),
          controller: homepagecontroller,
          children: [
            const IndexScreen(),
            CunScreen(
              info: info,
            ),
            const TalkScreen(),
            OutScreen(
              total: info["total"],
            ),
            InfoScreen(
              info: info,
              history: history,
              tin: widget.data["data3"]["in"],
              tout: widget.data["data3"]["out"],
            )
          ],
        )),
        Container(
          height: 60,
          decoration: const BoxDecoration(
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
                    icon: const Icon(
                      Icons.home,
                    ),
                    color:
                        selectedButtonIndex == 0 ? Colors.blue : Colors.black54,
                    onPressed: () {
                      setState(() {
                        selectedButtonIndex = 0; // 更新选中的按钮索引
                        jumppage(0);
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
                    icon: const Icon(
                      IconData(0xe617,
                          fontFamily: 'KoboIcon', matchTextDirection: true),
                      //size: 20,
                    ),
                    color:
                        selectedButtonIndex == 1 ? Colors.blue : Colors.black54,
                    onPressed: () {
                      setState(() {
                        selectedButtonIndex = 1; // 更新选中的按钮索引
                        jumppage(1);
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
                    icon: const Icon(
                      IconData(0xe621,
                          fontFamily: 'KoboIcon', matchTextDirection: true),
                      //size: 20,
                    ),
                    color:
                        selectedButtonIndex == 2 ? Colors.blue : Colors.black54,
                    onPressed: () {
                      setState(() {
                        selectedButtonIndex = 2; // 更新选中的按钮索引
                        jumppage(2);
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
                    icon: const Icon(
                      IconData(0xe8f7,
                          fontFamily: 'KoboIcon', matchTextDirection: true),
                      //size: 20,
                    ),
                    color:
                        selectedButtonIndex == 3 ? Colors.blue : Colors.black54,
                    onPressed: () {
                      setState(() {
                        selectedButtonIndex = 3; // 更新选中的按钮索引
                        jumppage(3);
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
                    icon: const Icon(Icons.person),
                    color:
                        selectedButtonIndex == 4 ? Colors.blue : Colors.black54,
                    onPressed: () {
                      setState(() {
                        selectedButtonIndex = 4; // 更新选中的按钮索引
                        jumppage(4);
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
  const TalkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
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
  final Map info;
  const CunScreen({required this.info, super.key});

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
            offset: const Offset(0, -500),
            child: FractionallySizedBox(
              widthFactor: 2,
              heightFactor: 1,
              alignment: Alignment.topCenter,
              child: Container(
                width: 400,
                height: 500,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 71, 119, 219),
                    borderRadius: BorderRadius.circular(500)),
              ),
            )),
        Column(children: [
          const Text(
            "存款",
            style: TextStyle(color: Colors.white, fontSize: 17, height: 3),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 5)
                ]),
            width: 500,
            height: 110,
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      "    会员ID        ",
                      style: TextStyle(
                          color: Colors.black, fontSize: 12, height: 2.5),
                    ),
                    Text("${widget.info["id"]}")
                  ],
                ),
                Container(
                  height: 1,
                  width: 500,
                  color: Colors.black26,
                ),
                Row(
                  children: [
                    const Text(
                      "    会员昵称    ",
                      style: TextStyle(
                          color: Colors.black, fontSize: 12, height: 2.5),
                    ),
                    Text("${widget.info["name"]}")
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
                      child: const Center(
                        child: Text(
                          "￥",
                          style: TextStyle(
                              color: Colors.black, fontSize: 9, height: 1),
                        ),
                      ),
                    ),
                    Text(
                      "  当前金额:${widget.info["total"]}￥",
                      style: const TextStyle(
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
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 5)
                  ]),
              width: 500,
              height: 200,
              child: Row(
                children: [
                  SizedBox(
                    width: 70,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
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
                        const SizedBox(
                          height: 17,
                        ),
                        const SizedBox(
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
                                  const Text(
                                    "请联系在线客服     ",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 12),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(3)),
                                    child: const Text(
                                      " 复制 ",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 11),
                                    ),
                                  )
                                ],
                              ),
                            )),
                        const SizedBox(
                            height: 30,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "请联系在线客服",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                              ),
                            )),
                        const SizedBox(
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
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          decimal: true),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'^\d+\.?\d{0,2}'))
                                  ],
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 12),
                                  decoration: const InputDecoration(
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
                            duration: const Duration(milliseconds: 500),
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
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 11),
                                    ),
                                    const Expanded(child: SizedBox()),
                                    const Icon(
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
                                                  style: const TextStyle(
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
            onTap: () {
              showMyDialog(context, "资金存入中，等待系统审核");
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.blue,
              ),
              child: const Center(
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
  final String total;
  const OutScreen({required this.total, super.key});

  @override
  State<OutScreen> createState() => OutScreenState();
}

class OutScreenState extends State<OutScreen> {
  int payway = 0;
  bool expandstate = false;
  List way = ["USDT", "银行", "支付宝"];
  TextEditingController password = TextEditingController();
  TextEditingController number = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          color: const Color.fromARGB(255, 33, 86, 243),
          child: const Center(
            child: Text(
              "用户出金",
              style: TextStyle(color: Colors.white, fontSize: 15, height: 2),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
            padding: const EdgeInsets.all(10),
            width: 500,
            height: 200,
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(color: Colors.black26, blurRadius: 5)
                ]),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        const Text(
                          "提款余额：",
                          style: TextStyle(
                              color: Colors.black, fontSize: 13, height: 2),
                        ),
                        Text(
                          "${widget.total}￥",
                          style: const TextStyle(
                              color: Colors.red, fontSize: 13, height: 2),
                        ),
                      ],
                    ),
                    TextField(
                      controller: number,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d{0,2}'))
                      ],
                      decoration: const InputDecoration(
                          prefixIcon: Text(
                        "￥",
                        style: TextStyle(
                            color: Colors.black, fontSize: 15, height: 2),
                      )),
                    ),
                    const Text(
                      "  单次提现金额至少￥100.00",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 11,
                      ),
                    ),
                    const Text(
                      "  取款时间为每日10:00--22:00",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 11,
                      ),
                    ),
                    const Text(
                      "取款密码：",
                      style: TextStyle(color: Colors.black, fontSize: 13),
                    ),
                    SizedBox(
                      height: 40,
                      child: TextField(
                        controller: password,
                        decoration:
                            const InputDecoration(border: InputBorder.none),
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
                          children: const [
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
                            duration: const Duration(milliseconds: 500),
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
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 11),
                                    ),
                                    const Expanded(child: SizedBox()),
                                    const Icon(
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
                                                  style: const TextStyle(
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
          onTap: () {
            String? token = html.window.localStorage['token'];
            lntoHome(token).then((value) {
              Map initdata = value;
              if (Decimal.parse(value["data2"]["total"]) >=
                  Decimal.parse(number.text)) {
                initdata["data2"]["total"] =
                    (Decimal.parse(value["data2"]["total"]) -
                            Decimal.parse(number.text))
                        .toStringAsFixed(2);
                DateTime now = DateTime.now();
                initdata["data3"]["out"].add({
                  "time": DateFormat('yyyy-MM-dd HH:mm:ss').format(now),
                  "value": Decimal.parse(number.text).toStringAsFixed(2)
                });
                mout(token, initdata, password.text).then((value) {
                  if (value["status"] == "success") {
                    showMyDialog(context, "恭喜，取款成功！");
                  } else {
                    showMyDialog(context, "密码错误或金额不符合要求");
                  }
                });
              } else {
                showMyDialog(context, "账户资产不足");
              }
            });
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.blue,
            ),
            child: const Center(
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
