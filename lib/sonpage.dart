import 'package:decimal/decimal.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'core.dart';

class identityScreen extends StatefulWidget {
  const identityScreen({super.key});

  @override
  State<identityScreen> createState() => identityScreenState();
}

class identityScreenState extends State<identityScreen> {
  Map data = {};
  bool state = false;
  TextEditingController name = TextEditingController();
  TextEditingController bank = TextEditingController();
  TextEditingController bankid = TextEditingController();
  TextEditingController alipay = TextEditingController();
  TextEditingController usdt = TextEditingController();
  @override
  void initState() {
    super.initState();
    String? token = html.window.localStorage['token'];
    IntoHome(token).then((value) {
      data = value;
      name.text = data["data2"]["name"];
      bank.text = data["data2"]["bank"];
      bankid.text = data["data2"]["bankid"];
      alipay.text = data["data2"]["alipay"];
      usdt.text = data["data2"]["usdt"];
      state = (data["data2"]["check"] == "0" ? true : false);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(children: [
        Row(
          children: [
            SizedBox(
                width: 60,
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black38,
                      size: 20,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "关闭",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        )),
                  ],
                )),
            const Expanded(
                child: Center(
              child: Text(
                "实名认证",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            )),
            const SizedBox(
              width: 60,
            )
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          children: [
            const Text("姓名       "),
            Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.only(left: 10),
                width: 250,
                height: 40,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(13, 0, 0, 0),
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: TextField(
                    enabled: state,
                    controller: name,
                    style: const TextStyle(fontSize: 16),
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(bottom: 5)),
                  ),
                ))
          ],
        ),
        Row(
          children: [
            const Text("开户银行"),
            Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.only(left: 10),
                width: 250,
                height: 40,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(13, 0, 0, 0),
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: TextField(
                    enabled: state,
                    controller: bank,
                    style: const TextStyle(fontSize: 16),
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(bottom: 5)),
                  ),
                ))
          ],
        ),
        Row(
          children: [
            const Text("银行卡号"),
            Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.only(left: 10),
                width: 250,
                height: 40,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(13, 0, 0, 0),
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: TextField(
                    enabled: state,
                    keyboardType: TextInputType.number,
                    controller: bankid,
                    style: const TextStyle(fontSize: 16),
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(bottom: 5)),
                  ),
                ))
          ],
        ),
        Row(
          children: [
            const Text("支付宝   "),
            Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.only(left: 10),
                width: 250,
                height: 40,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(13, 0, 0, 0),
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: TextField(
                    enabled: state,
                    controller: alipay,
                    style: const TextStyle(fontSize: 16),
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(bottom: 5)),
                  ),
                ))
          ],
        ),
        Row(
          children: [
            const Text("USDT      "),
            Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.only(left: 10),
                width: 250,
                height: 40,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(13, 0, 0, 0),
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: TextField(
                    enabled: state,
                    controller: usdt,
                    style: const TextStyle(fontSize: 16),
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(bottom: 5)),
                  ),
                ))
          ],
        ),
        Text(state ? "填写后不可修改，请仔细填写！！！" : "如需修改个人信息请联系在线客服！！！"),
        const SizedBox(
          height: 20,
        ),
        state
            ? GestureDetector(
                onTap: () {
                  if (name.text != "") {
                    data["data2"]["name"] = name.text;
                    data["data2"]["bank"] = bank.text;
                    data["data2"]["bankid"] = bankid.text;
                    data["data2"]["alipay"] = alipay.text;
                    data["data2"]["usdt"] = usdt.text;
                    data["data2"]["check"] = "1";
                    String? token = html.window.localStorage['token'];
                    data.remove("status");
                    Update(token, data).then((value) {
                      if (value["status"] == "success") {
                        html.window.location.reload();
                      } else {
                        showMyDialog(context, "更新失败，请重试");
                      }
                    });
                  } else {
                    showMyDialog(context, "姓名为必填项");
                  }
                },
                child: Container(
                  height: 35,
                  margin: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.blue,
                  ),
                  child: Center(
                    child: Text(
                      "确认填写",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            : Container(),
      ]),
    ));
  }
}

class logsScreen extends StatefulWidget {
  List log;
  logsScreen({super.key, required this.log});

  @override
  State<logsScreen> createState() => logsScreenState();
}

class logsScreenState extends State<logsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            color: Color.fromARGB(255, 14, 71, 212),
            height: 50,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                    child: Center(
                  child: Text(
                    "收益明细",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                )),
                Icon(
                  Icons.arrow_back_ios,
                  color: Colors.transparent,
                ),
              ],
            ),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(10),
            child: ListView.builder(
              itemCount: widget.log.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(width: 1, color: Colors.black12))),
                  width: 500,
                  height: 110,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 13,
                          ),
                          Text(
                            "购买时间: ${widget.log[index]["start"]}",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 13,
                          ),
                          Text(
                            "结束时间: ${widget.log[index]["end"]}",
                            style: TextStyle(fontSize: 12),
                          ),
                          Expanded(child: SizedBox()),
                          Text(
                            widget.log[index]["status"] == "0" ? "进行中" : "已结束",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "${widget.log[index]["name"]}",
                            style: TextStyle(fontSize: 10),
                          ),
                          Expanded(child: SizedBox()),
                          Text(
                            "利率：${widget.log[index]["interest"]}%",
                            style: TextStyle(fontSize: 10),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "本金：${widget.log[index]["base"]}￥",
                            style: TextStyle(fontSize: 10),
                          ),
                          Expanded(child: SizedBox()),
                          Text(
                            "收益：${widget.log[index]["gone"]}￥",
                            style: TextStyle(fontSize: 10),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ))
        ],
      ),
    );
  }
}

class depositScreen extends StatefulWidget {
  const depositScreen({super.key});

  @override
  State<depositScreen> createState() => depositScreenState();
}

class depositScreenState extends State<depositScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
          color: const Color.fromARGB(255, 14, 71, 212),
          height: 50,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
              const Expanded(
                  child: Center(
                child: Text(
                  "存款记录",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              )),
              const Icon(
                Icons.arrow_back_ios,
                color: Colors.transparent,
              ),
            ],
          ),
        ),
        const Text("暂无存款记录")
      ]),
    );
  }
}

class atmScreen extends StatefulWidget {
  const atmScreen({super.key});

  @override
  State<atmScreen> createState() => atmScreenState();
}

class atmScreenState extends State<atmScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
          color: const Color.fromARGB(255, 14, 71, 212),
          height: 50,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
              const Expanded(
                  child: Center(
                child: Text(
                  "取款记录",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              )),
              const Icon(
                Icons.arrow_back_ios,
                color: Colors.transparent,
              ),
            ],
          ),
        ),
        const Text("暂无取款记录")
      ]),
    );
  }
}

class settingScreen extends StatefulWidget {
  const settingScreen({super.key});

  @override
  State<settingScreen> createState() => settingScreenState();
}

class settingScreenState extends State<settingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
        color: const Color.fromARGB(255, 14, 71, 212),
        height: 50,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            const Expanded(
                child: Center(
              child: Text(
                "系统设置",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )),
            const Icon(
              Icons.arrow_back_ios,
              color: Colors.transparent,
            ),
          ],
        ),
      ),
      Expanded(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => identityScreen()));
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1, color: Colors.black12))),
                child: Row(
                  children: const [
                    Icon(
                      Icons.person,
                      color: Colors.black54,
                    ),
                    Text("  修改个人资料")
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => pwScreen(
                              mode: true,
                            )));
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1, color: Colors.black12))),
                child: Row(
                  children: const [
                    Icon(
                      Icons.lock,
                      color: Colors.black54,
                    ),
                    Text("  修改登录密码")
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => pwScreen(
                              mode: false,
                            )));
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1, color: Colors.black12))),
                child: Row(
                  children: const [
                    Icon(
                      Icons.settings,
                      color: Colors.black54,
                    ),
                    Text("  修改支付密码")
                  ],
                ),
              ),
            )
          ],
        ),
      ))
    ]));
  }
}

class languageScreen extends StatefulWidget {
  const languageScreen({super.key});

  @override
  State<languageScreen> createState() => languageScreenState();
}

class languageScreenState extends State<languageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Container(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
        color: const Color.fromARGB(255, 14, 71, 212),
        height: 50,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            const Expanded(
                child: Center(
              child: Text(
                "语言设置",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )),
            const Icon(
              Icons.arrow_back_ios,
              color: Colors.transparent,
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Container(
        decoration: const BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 1, color: Colors.black12))),
        child: const Text(
          "    繁体中文",
          style: TextStyle(fontSize: 15, height: 3),
        ),
      ),
      Container(
        decoration: const BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 1, color: Colors.black12))),
        child: const Text(
          "    简体中文",
          style: TextStyle(fontSize: 15, height: 3),
        ),
      ),
      Container(
        decoration: const BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 1, color: Colors.black12))),
        child: const Text(
          "    English",
          style: TextStyle(fontSize: 15, height: 3),
        ),
      )
    ]));
  }
}

class pwScreen extends StatefulWidget {
  bool mode;
  pwScreen({required this.mode, super.key});

  @override
  State<pwScreen> createState() => pwScreenState();
}

class pwScreenState extends State<pwScreen> {
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  Map data = {};

  @override
  void initState() {
    super.initState();
    String? token = html.window.localStorage['token'];
    IntoHome(token).then((value) {
      data = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            color: const Color.fromARGB(255, 14, 71, 212),
            height: 50,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "修改${widget.mode ? "登录" : "支付"}密码",
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
                const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.transparent,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: oldPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: '原密码',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: newPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: '新密码',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: '确认新密码',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // 在这里添加确认修改的逻辑
              confirmModification();
            },
            child: Text('确认修改'),
          ),
        ],
      ),
    );
  }

  void confirmModification() {
    // 在这里添加检查原密码和确认修改的逻辑
    String oldPassword = oldPasswordController.text;
    String newPassword = newPasswordController.text;
    String confirmPassword = confirmPasswordController.text;

    if (newPassword == confirmPassword) {
      isOldPasswordCorrect(
              oldPassword, newPassword, (widget.mode ? "login" : "pay"))
          .then((value) {
        if (value) {
          if (widget.mode) {
            html.window.localStorage.remove('token');
            redirectToUrl(Uri.parse('$initialurl/index/'));
          } else {
            Navigator.pop(context);
          }
        } else {
          showMyDialog(context, "原密码错误");
        }
      });
    } else {
      showMyDialog(context, "新密码和确认密码不一致");
      oldPasswordController.clear();
    }
  }

  Future<bool> isOldPasswordCorrect(
      String oldPassword, String newPassword, String type) async {
    String? token = html.window.localStorage['token'];
    Map<String, dynamic> data = {
      "Authorization": token,
      "type": type,
      "old": oldPassword,
      "new": newPassword
    };
    String url = '$initialurl/api/cp/';
    try {
      Response response = await Dio().post(url, data: data);
      if (response.statusCode == 200) {
        if (response.data["status"] == "success") {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
