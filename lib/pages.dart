// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:async';
import 'dart:convert';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'core.dart';

class TextAnimation extends StatefulWidget {
  final String text;

  TextAnimation({required this.text});

  @override
  _TextAnimationState createState() => _TextAnimationState();
}

class _TextAnimationState extends State<TextAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Tween<double> _positionTween;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    )..repeat();

    _positionTween = Tween<double>(
      begin: 1,
      end: -0.3,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        double position = _positionTween.evaluate(_controller);
        return Transform.translate(
          offset: Offset(
            MediaQuery.of(context).size.width * position,
            0,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              widget.text,
              style: TextStyle(fontSize: 12, color: Colors.blue),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class MyCircularCheckbox extends StatefulWidget {
  @override
  _MyCircularCheckboxState createState() => _MyCircularCheckboxState();
}

class _MyCircularCheckboxState extends State<MyCircularCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: Container(
        width: 18.0,
        height: 18.0,
        decoration: BoxDecoration(
          color: isChecked ? Colors.blue : Colors.white,
          shape: BoxShape.circle,
          border:
              isChecked ? null : Border.all(color: Colors.black, width: 0.5),
        ),
        child: Center(
          child: isChecked
              ? Icon(
                  Icons.check,
                  size: 15.0,
                  color: Colors.white,
                )
              : null,
        ),
      ),
    );
  }
}

class TkIntoScreen extends StatefulWidget {
  @override
  State<TkIntoScreen> createState() => TkIntoScreenState();
}

class TkIntoScreenState extends State<TkIntoScreen> {
  bool check = false;
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  bottom: BorderSide(width: 0.5, color: Colors.black12))),
          padding: EdgeInsets.all(5),
          height: 50,
          child: Row(
            children: [
              TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        size: 12,
                      ),
                      Text(
                        "返回",
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  )),
              Expanded(
                  child: Center(
                child: Text(
                  "转入",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              )),
              Text(
                "交易规则",
                style: TextStyle(fontSize: 12, color: Colors.blue),
              )
            ],
          ),
        ),
        Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom: BorderSide(width: 0.5, color: Colors.black12))),
            padding: EdgeInsets.all(5),
            height: 40,
            child: Row(
              children: [
                Text(
                  "  转入金额",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                Expanded(child: SizedBox()),
                Text(
                  "账户余额:23482.00",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black45),
                ),
              ],
            )),
        Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom: BorderSide(width: 0.5, color: Colors.black12))),
            padding: EdgeInsets.all(15),
            //height: 150,
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: Text(
                        "￥",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 25),
                      ),
                      hintText: "输入转出金额",
                      border: UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 0.1, color: Colors.black12))),
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "默认为:登入密码",
                      border: UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 0.1, color: Colors.black12))),
                )
              ],
            )),
        Container(
          padding: EdgeInsets.only(left: 10),
          height: 50,
          child: Row(
            children: [
              MyCircularCheckbox(),
              Text(
                "  同意",
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
              Text(
                "《相关协议》",
                style: TextStyle(fontSize: 12, color: Colors.blue),
              ),
              Text(
                "，并知晓理财可能存在的风险",
                style: TextStyle(fontSize: 12, color: Colors.black),
              )
            ],
          ),
        ),
        GestureDetector(
          child: Container(
            height: 35,
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: Colors.blue,
            ),
            child: Center(
              child: Text(
                "立即转出",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    ));
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
                          "总余额(元) ",
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
                                color: Color.fromARGB(255, 255, 232, 232),
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
}

class ModelScreen extends StatefulWidget {
  const ModelScreen({super.key});

  @override
  State<ModelScreen> createState() => ModelScreenState();
}

class ModelScreenState extends State<ModelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: [
            Container(
              height: 200,
              color: Color.fromARGB(255, 254, 79, 52),
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
                margin: EdgeInsets.only(top: 35),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: 5)
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
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                        Icon(
                          Icons.visibility,
                          size: 14,
                          color: Colors.black45,
                        )
                      ],
                    ),
                    Text(
                      "0.00",
                      style: TextStyle(
                          fontFamily: "Yu Gothic UI",
                          height: 2.5,
                          color: Colors.black87,
                          fontSize: 27,
                          fontWeight: FontWeight.w400),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(199, 205, 205, 205),
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "收益明细",
                        style: TextStyle(
                            height: 1.8,
                            color: Colors.black,
                            fontSize: 11,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Text(
                      "当前利率：5.85%",
                      style: TextStyle(
                          height: 1.4,
                          color: Colors.black54,
                          fontSize: 10,
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
                                    height: 1.3,
                                    color: Colors.black54,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "3060.50",
                                style: TextStyle(
                                    fontFamily: "Microsoft JhengHei",
                                    height: 1.5,
                                    color: Colors.black87,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          )),
                          Expanded(
                              child: Column(
                            children: [
                              Text(
                                "可转出金额（￥）",
                                style: TextStyle(
                                    height: 1.3,
                                    color: Colors.black54,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "3060.50",
                                style: TextStyle(
                                    fontFamily: "Microsoft JhengHei",
                                    height: 1.5,
                                    color: Colors.black87,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          )),
                          Expanded(
                              child: Column(
                            children: [
                              Text(
                                "当前收益（￥）",
                                style: TextStyle(
                                    height: 1.3,
                                    color: Colors.black54,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "292.50",
                                style: TextStyle(
                                    fontFamily: "Microsoft JhengHei",
                                    height: 1.5,
                                    color: Colors.black87,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ))
                        ],
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 254, 79, 52),
                            borderRadius: BorderRadius.circular(8)),
                        height: 60,
                        width: 500,
                        margin: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "    最低转入金额：10000.00",
                                style: TextStyle(
                                    height: 1,
                                    color: Colors.white,
                                    fontSize: 11,
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
                                "    最高转入金额：10000000.00",
                                style: TextStyle(
                                    //fontFamily: "MS Gothic",
                                    height: 1,
                                    color: Colors.white,
                                    fontSize: 11,
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
                      width: 500,
                      height: 32,
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            color: Color.fromARGB(255, 254, 79, 52),
                            child: Center(
                              child: Text(
                                "转入",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
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
                                  color: Color.fromARGB(255, 254, 79, 52),
                                ),
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
                      margin: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 5)
                          ]),

                      //clipBehavior: Clip.hardEdge,
                      padding: EdgeInsets.all(10),
                      child: Scrollbar(
                        child: SingleChildScrollView(
                          child: Text(
                            "        短期中银宝是银行为与余额宝竞争而一款互联网理财产品，预期收益比银行活期高，随存随取，提现比较灵活，该企业被阿里巴巴购买，隶属旗下公司。阿里巴巴是全球企业间(B2B)电子商务的著名品牌，为数千万网商提供海量商机信息和便捷安全的在线交易市场，也是商人们以商会友、真实互动的社区平台。",
                            style: TextStyle(height: 2.2, fontSize: 12),
                          ),
                        ),
                      )))
            ],
          ),
        ))
      ],
    ));
  }
}

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
    grade = "分";
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
            child: Column(
              children: [
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
                              style:
                                  TextStyle(fontSize: 12, color: Colors.blue),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      height: 80,
                      width: 80,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(color: Colors.black26, blurRadius: 10)
                          ]),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 50,
                            child: Image.asset("assets/11.png"),
                          ),
                          Text(
                            "蚂蚁消金",
                            style: TextStyle(fontSize: 12, height: 1.5),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      height: 80,
                      width: 80,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(color: Colors.black26, blurRadius: 10)
                          ]),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 50,
                            child: Image.asset("assets/22.png"),
                          ),
                          Text(
                            "余额宝",
                            style: TextStyle(fontSize: 12, height: 1.5),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      height: 80,
                      width: 80,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(color: Colors.black26, blurRadius: 10)
                          ]),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 50,
                            child: Image.asset("assets/33.png"),
                          ),
                          Text(
                            "余利宝",
                            style: TextStyle(fontSize: 12, height: 1.5),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      )
    ]));
  }
}

class HomeScreen extends StatefulWidget {
  //Map data;
  //HomeScreen({required this.data});
  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  Map info = {};
  @override
  void initState() {
    super.initState();
    //info = json.decode(widget.data["data2"].replaceAll("'", "\""));
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
            // BroadScreen(
            //   token: widget.token,
            // ),
            TalkScreen(),
            TalkScreen(),
            TalkScreen(),
            InfoScreen(info: info)
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
                        homepagecontroller.jumpToPage(
                          0, // 首页对应的页面索引
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
                        homepagecontroller.jumpToPage(
                          1, // 存款页面对应的页面索引
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
                        homepagecontroller.jumpToPage(
                          2, // 存款页面对应的页面索引
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
                        homepagecontroller.jumpToPage(
                          3, // 存款页面对应的页面索引
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
                        homepagecontroller.jumpToPage(
                          4, // 存款页面对应的页面索引
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
