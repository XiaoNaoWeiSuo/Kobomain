import 'package:flutter/material.dart';

class identityScreen extends StatefulWidget {
  const identityScreen({super.key});

  @override
  State<identityScreen> createState() => identityScreenState();
}

class identityScreenState extends State<identityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(10),
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
                        onTap: () {},
                        child: Text(
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
            Text("姓名       "),
            Container(
              margin: EdgeInsets.all(5),
              //padding: EdgeInsets.only(bottom: ),
              width: 250,
              height: 40,
              decoration: BoxDecoration(
                  color: Color.fromARGB(13, 0, 0, 0),
                  borderRadius: BorderRadius.circular(30)),
              child: TextField(
                //textAlign: TextAlign.center,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(0)),
              ),
            )
          ],
        ),
        Row(
          children: [
            Text("开户银行"),
            Container(
              margin: EdgeInsets.all(5),
              //padding: EdgeInsets.only(bottom: ),
              width: 250,
              height: 40,
              decoration: BoxDecoration(
                  color: Color.fromARGB(13, 0, 0, 0),
                  borderRadius: BorderRadius.circular(30)),
              child: TextField(
                //textAlign: TextAlign.center,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(0)),
              ),
            )
          ],
        ),
        Row(
          children: [
            Text("银行卡号"),
            Container(
              margin: EdgeInsets.all(5),
              //padding: EdgeInsets.only(bottom: ),
              width: 250,
              height: 40,
              decoration: BoxDecoration(
                  color: Color.fromARGB(13, 0, 0, 0),
                  borderRadius: BorderRadius.circular(30)),
              child: TextField(
                //textAlign: TextAlign.center,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(0)),
              ),
            )
          ],
        ),
        Row(
          children: [
            Text("支付宝   "),
            Container(
              margin: EdgeInsets.all(5),
              //padding: EdgeInsets.only(bottom: ),
              width: 250,
              height: 40,
              decoration: BoxDecoration(
                  color: Color.fromARGB(13, 0, 0, 0),
                  borderRadius: BorderRadius.circular(30)),
              child: TextField(
                //textAlign: TextAlign.center,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(0)),
              ),
            )
          ],
        ),
        Row(
          children: [
            Text("USDT      "),
            Container(
              margin: EdgeInsets.all(5),
              //padding: EdgeInsets.only(bottom: ),
              width: 250,
              height: 40,
              decoration: BoxDecoration(
                  color: Color.fromARGB(13, 0, 0, 0),
                  borderRadius: BorderRadius.circular(30)),
              child: TextField(
                //textAlign: TextAlign.center,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(0)),
              ),
            )
          ],
        ),
        Text("如需修改个人信息请联系在线客服！！！")
      ]),
    ));
  }
}

class logsScreen extends StatefulWidget {
  const logsScreen({super.key});

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
              itemCount: 3,
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
                            "购买时间: 2023-10-23 19:38:29",
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
                            "结束时间: 2023-10-26 19:39:49",
                            style: TextStyle(fontSize: 12),
                          ),
                          Expanded(child: SizedBox()),
                          Text(
                            "已结束",
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
                            "长期余额宝",
                            style: TextStyle(fontSize: 10),
                          ),
                          Expanded(child: SizedBox()),
                          Text(
                            "利率：21.53%",
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
                            "本金：200000.00￥",
                            style: TextStyle(fontSize: 10),
                          ),
                          Expanded(child: SizedBox()),
                          Text(
                            "收益：43060.00￥",
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
