import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'core.dart';

//网页跳转
Future<void> _launchInBrowser(Uri url) async {
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw Exception('Could not launch $url');
  }
}

class BroadScreen extends StatefulWidget {
  String token = '';
  BroadScreen({required this.token});
  @override
  State<BroadScreen> createState() => BroadScreenState();
}

class BroadScreenState extends State<BroadScreen> {
  String data1 = "";
  String data2 = "";
  String data3 = "";
  void initState() {
    super.initState();
    // 在这里调用getimageurl方法获取图片URL并更新url变量
    IntoHome(widget.token).then((value) {
      setState(() {
        data1 = value["data1"];
        data2 = value["data2"];
        data3 = value["data3"];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "理财项目",
            style: TextStyle(color: Colors.black87, fontSize: 18),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ZhongYinPage()),
              );
            },
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(20),
              width: 500,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 10)
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "短期中银宝",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Expanded(child: SizedBox()),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(child: SizedBox()),
                      Text(
                        data1,
                        style: TextStyle(
                            height: 1.1,
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "￥",
                        style: TextStyle(
                            height: 1.1,
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => YvEPage()),
              );
            },
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
              width: 500,
              height: 100,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 94, 0),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 10)
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "余额宝",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Expanded(child: SizedBox()),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(child: SizedBox()),
                      Text(
                        data2,
                        style: TextStyle(
                            height: 1.1,
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "￥",
                        style: TextStyle(
                            height: 1.1,
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => YvLiPage()),
              );
            },
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              width: 500,
              height: 100,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 57, 182, 255),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 10)
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "网商银行·余利宝",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Expanded(child: SizedBox()),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(child: SizedBox()),
                      Text(
                        data3,
                        style: TextStyle(
                            height: 1.1,
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "￥",
                        style: TextStyle(
                            height: 1.1,
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget ZhongYinPage() {
    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: [
            Container(
              height: 280,
              color: Color.fromARGB(255, 255, 134, 64),
            ),
            Expanded(
                child: Container(
              color: Colors.white,
            ))
          ],
        ),
        Positioned(
            child: Padding(
          padding: EdgeInsets.only(top: 15, left: 10, right: 10),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 20,
                          ))),
                  Expanded(
                      child: Text(
                    "短期中银宝",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  )),
                  Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.transparent,
                        size: 20,
                      ))
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 45),
                margin: EdgeInsets.only(top: 35, left: 5, right: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 5)
                    ],
                    borderRadius: BorderRadius.circular(10)),
                width: 500,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "总余额",
                          style: TextStyle(color: Colors.black87, fontSize: 15),
                        ),
                        Icon(
                          Icons.pie_chart_outline,
                          size: 15,
                        )
                      ],
                    ),
                    Text(
                      "0.00",
                      style: TextStyle(
                          height: 2,
                          color: Colors.black87,
                          fontSize: 40,
                          fontWeight: FontWeight.w400),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 205, 205, 205),
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "收益明细",
                        style: TextStyle(
                            height: 1.4,
                            color: Colors.black87,
                            //fontSize: 40,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Text(
                      "当前利率：5.85%",
                      style: TextStyle(
                          height: 1.4,
                          color: Colors.black54,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        children: [
                          Expanded(
                              child: Column(
                            children: [
                              Text(
                                "总金额（￥）",
                                style: TextStyle(
                                    height: 1.1,
                                    color: Colors.black54,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                "0.50",
                                style: TextStyle(
                                    height: 1,
                                    color: Colors.black87,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          )),
                          Expanded(
                              child: Column(
                            children: [
                              Text(
                                "可转出金额（￥）",
                                style: TextStyle(
                                    height: 1.1,
                                    color: Colors.black54,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                "0.50",
                                style: TextStyle(
                                    height: 1,
                                    color: Colors.black87,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          )),
                          Expanded(
                              child: Column(
                            children: [
                              Text(
                                "当前收益（￥）",
                                style: TextStyle(
                                    height: 1.1,
                                    color: Colors.black54,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                "292.50",
                                style: TextStyle(
                                    height: 1,
                                    color: Colors.black87,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ))
                        ],
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 134, 64),
                            borderRadius: BorderRadius.circular(8)),
                        height: 75,
                        width: 500,
                        margin: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "  最低转入金额：1000.00",
                                style: TextStyle(
                                    height: 1,
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                              ),
                            )),
                            Container(
                              height: 0.5,
                              color: Colors.white,
                            ),
                            Expanded(
                                child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "  最高转入金额：10000.00",
                                style: TextStyle(
                                    height: 1,
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                              ),
                            )),
                          ],
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)),
                      margin: EdgeInsets.all(5),
                      width: 500,
                      height: 35,
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            color: Color.fromARGB(255, 255, 115, 0),
                            child: Center(
                              child: Text(
                                "转入",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )),
                          Expanded(
                              child: Container(
                            color: Color.fromARGB(255, 253, 239, 232),
                            child: Center(
                              child: Text(
                                "转出",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 115, 0)),
                              ),
                            ),
                          ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Container(

                      //clipBehavior: Clip.hardEdge,
                      padding: EdgeInsets.all(20),
                      child: Scrollbar(
                        child: SingleChildScrollView(
                          child: Text(
                            "        短期中银宝是银行为与余额宝竞争而一款互联网理财产品，预期收益比银行活期高，随存随取，提现比较灵活，该企业被阿里巴巴购买，隶属旗下公司。阿里巴巴是全球企业间(B2B)电子商务的著名品牌，为数千万网商提供海量商机信息和便捷安全的在线交易市场，也是商人们以商会友、真实互动的社区平台。",
                            style: TextStyle(height: 2.2, fontSize: 15),
                          ),
                        ),
                      )))
            ],
          ),
        ))
      ],
    ));
  }

  Widget YvEPage() {
    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: [
            Container(
              height: 280,
              color: Color.fromARGB(255, 240, 98, 16),
            ),
            Expanded(
                child: Container(
              color: Colors.white,
            ))
          ],
        ),
        Positioned(
            child: Padding(
          padding: EdgeInsets.only(top: 15, left: 10, right: 10),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 20,
                          ))),
                  Expanded(
                      child: Text(
                    "余额宝",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  )),
                  Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.transparent,
                        size: 20,
                      ))
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                margin: EdgeInsets.only(top: 35, left: 5, right: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 5)
                    ],
                    borderRadius: BorderRadius.circular(10)),
                width: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "      总余额(元) ",
                          style: TextStyle(color: Colors.black87, fontSize: 12),
                        ),
                        Icon(
                          Icons.remove_red_eye_outlined,
                          size: 18,
                          color: Colors.black45,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(1, 0, 1, 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            border: Border.all(width: 0.5, color: Colors.grey),
                          ),
                          child: Row(children: [
                            Icon(
                              Icons.verified_user,
                              size: 10,
                              color: Colors.orange,
                            ),
                            Text(
                              "资金安全",
                              style: TextStyle(
                                  height: 2,
                                  color: Colors.orange,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w900),
                            ),
                          ]),
                        )
                      ],
                    ),
                    Text(
                      "  545,869.56",
                      style: TextStyle(
                          height: 2,
                          color: Colors.black87,
                          fontSize: 35,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        children: [
                          Expanded(
                              child: Column(
                            children: [
                              Text(
                                "昨日收益(元)",
                                style: TextStyle(
                                    height: 1.1,
                                    color: Colors.black54,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                " 0.27 ",
                                style: TextStyle(
                                    height: 2,
                                    color: Colors.orange,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          )),
                          Expanded(
                              child: Column(
                            children: [
                              Text(
                                "累计收益(元)",
                                style: TextStyle(
                                    height: 1.1,
                                    color: Colors.black54,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                "19.1",
                                style: TextStyle(
                                    height: 2,
                                    color: Colors.black87,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)),
                      margin: EdgeInsets.all(5),
                      width: 500,
                      height: 45,
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 253, 239, 232),
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                              child: Text(
                                "转出",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 115, 0)),
                              ),
                            ),
                          )),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 115, 0),
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                              child: Text(
                                "转入",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ))
      ],
    ));
  }

  Widget YvLiPage() {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
            child: Expanded(
                child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 11, 77, 169),
            Color.fromARGB(255, 255, 255, 255),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        ))),
        Positioned(
            child: Padding(
          padding: EdgeInsets.only(top: 15, left: 10, right: 10),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 20,
                          ))),
                  Expanded(
                      child: Text(
                    "网商银行·余利宝",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  )),
                  Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.transparent,
                        size: 20,
                      ))
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 25, left: 5, right: 5),
                width: 500,
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.remove_red_eye_outlined,
                          size: 17,
                          color: Colors.white,
                        ),
                        Text(
                          " 总余额(元) ",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                    Text(
                      "3,070,249.56",
                      style: TextStyle(
                          height: 2,
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        children: [
                          Expanded(
                              child: Column(
                            children: [
                              Text(
                                " 247.27 ",
                                style: TextStyle(
                                    height: 1.2,
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "昨日收益(元)",
                                style: TextStyle(
                                    height: 1.1,
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          )),
                          Container(
                            width: 0.5,
                            height: 15,
                            color: Colors.white,
                          ),
                          Expanded(
                              child: Column(
                            children: [
                              Text(
                                "16489.76",
                                style: TextStyle(
                                    height: 1.2,
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "累计收益(元)",
                                style: TextStyle(
                                    height: 1.1,
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          )),
                          Container(
                            width: 0.5,
                            height: 15,
                            color: Colors.white,
                          ),
                          Expanded(
                              child: Column(
                            children: [
                              Text(
                                "3.4150%",
                                style: TextStyle(
                                    height: 1.2,
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                "近30日收益率",
                                style: TextStyle(
                                    height: 1.1,
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)),
                      margin: EdgeInsets.all(5),
                      width: 500,
                      height: 45,
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(80, 253, 239, 232),
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                              child: Text(
                                "转出",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                              child: Text(
                                "转入",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 200,
                width: 500,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Text("精选服务"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // 首页按钮
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.home,
                                size: 30,
                                color: Color.fromARGB(255, 33, 107, 243)),
                            Text(
                              '首页',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        // 存款按钮
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.attach_money,
                                size: 30,
                                color: Color.fromARGB(255, 33, 107, 243)),
                            Text(
                              '存款',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        // 客服按钮
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.people,
                                size: 30,
                                color: Color.fromARGB(255, 33, 107, 243)),
                            Text(
                              '客服',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        // 取款按钮
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.money,
                                size: 30,
                                color: Color.fromARGB(255, 33, 107, 243)),
                            Text(
                              '取款',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        // 我的按钮
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ))
      ],
    ));
  }
}

class InfoScreen extends StatefulWidget {
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
    name = "黄丽英";
    id = "13144";
    grade = "分";
    level = "高级会员";
    num = "196318.26";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.only(top: 20, left: 20, right: 10, bottom: 10),
            height: 240,
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
                  onTap: () {},
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

class HomeScreen extends StatefulWidget {
  String token;
  HomeScreen({required this.token});
  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  int selectedButtonIndex = 0;
  final PageController homepagecontroller = PageController();
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
            BroadScreen(
              token: widget.token,
            ),
            TalkScreen(),
            TalkScreen(),
            TalkScreen(),
            InfoScreen()
          ],
        )),
        Container(
          height: 60,
          color: Colors.amber,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // 首页按钮
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.home),
                    color:
                        selectedButtonIndex == 0 ? Colors.blue : Colors.black87,
                    onPressed: () {
                      setState(() {
                        selectedButtonIndex = 0; // 更新选中的按钮索引
                        homepagecontroller.animateToPage(
                          0, // 首页对应的页面索引
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      });
                    },
                  ),
                  Text(
                    '首页',
                    style: TextStyle(
                      color: selectedButtonIndex == 0
                          ? Colors.blue
                          : Colors.black87,
                    ),
                  ),
                ],
              ),
// 存款按钮
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.attach_money),
                    color:
                        selectedButtonIndex == 1 ? Colors.blue : Colors.black87,
                    onPressed: () {
                      setState(() {
                        selectedButtonIndex = 1; // 更新选中的按钮索引
                        homepagecontroller.animateToPage(
                          1, // 存款页面对应的页面索引
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      });
                    },
                  ),
                  Text(
                    '存款',
                    style: TextStyle(
                      color: selectedButtonIndex == 1
                          ? Colors.blue
                          : Colors.black87,
                    ),
                  ),
                ],
              ),
              // 客服按钮
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.people),
                    color:
                        selectedButtonIndex == 2 ? Colors.blue : Colors.black87,
                    onPressed: () {
                      setState(() {
                        selectedButtonIndex = 2; // 更新选中的按钮索引
                        homepagecontroller.animateToPage(
                          2, // 存款页面对应的页面索引
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      });
                    },
                  ),
                  Text(
                    '客服',
                    style: TextStyle(
                      color: selectedButtonIndex == 2
                          ? Colors.blue
                          : Colors.black87,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.money),
                    color:
                        selectedButtonIndex == 3 ? Colors.blue : Colors.black87,
                    onPressed: () {
                      setState(() {
                        selectedButtonIndex = 3; // 更新选中的按钮索引
                        homepagecontroller.animateToPage(
                          3, // 存款页面对应的页面索引
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      });
                    },
                  ),
                  Text(
                    '取款',
                    style: TextStyle(
                      color: selectedButtonIndex == 3
                          ? Colors.blue
                          : Colors.black87,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.person),
                    color:
                        selectedButtonIndex == 4 ? Colors.blue : Colors.black87,
                    onPressed: () {
                      setState(() {
                        selectedButtonIndex = 4; // 更新选中的按钮索引
                        homepagecontroller.animateToPage(
                          4, // 存款页面对应的页面索引
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      });
                    },
                  ),
                  Text(
                    '我的',
                    style: TextStyle(
                      color: selectedButtonIndex == 4
                          ? Colors.blue
                          : Colors.black87,
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
