// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:html' as html;

import 'package:kobo_login/core.dart';

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
  String label;
  bool state;
  TkIntoScreen({required this.label, required this.state});
  @override
  State<TkIntoScreen> createState() => TkIntoScreenState();
}

class TkIntoScreenState extends State<TkIntoScreen> {
  bool check = false;
  String text = "";
  Map data = {};
  void initState() {
    super.initState();
    text = widget.state ? "转入" : "转出";
    String? token = html.window.localStorage['token'];

    IntoHome(token).then((value) {
      //print("");
      String data1 = value["data1"];
      //print("data1$data1");
      data = json.decode(data1.replaceAll("'", "\""))[widget.label];
      setState(() {});
      //data = json.decode(data1.replaceAll("'", "\""))[widget.label];
    });
    // print("111111111111111111111111111111111111111111111111111$data");
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
                  onPressed: () {
                    Navigator.pop(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ModelScreen(
                                label: widget.label,
                              )),
                    );
                  },
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
                  "$text",
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
                  "  $text金额",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                Expanded(child: SizedBox()),
                Text(
                  "可$text金额:${data["enout"]}",
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
                      hintText: "输入$text金额",
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

  // Widget ZhongYinPage() {
  //   return Scaffold(
  //       body: Stack(
  //     children: [
  //       Column(
  //         children: [
  //           Container(
  //             height: 280,
  //             color: Color.fromARGB(255, 255, 134, 64),
  //           ),
  //           Expanded(
  //               child: Container(
  //             color: Colors.white,
  //           ))
  //         ],
  //       ),
  //       Positioned(
  //           child: Padding(
  //         padding: EdgeInsets.only(top: 15, left: 10, right: 10),
  //         child: Column(
  //           children: [
  //             Row(
  //               children: [
  //                 GestureDetector(
  //                     onTap: () {
  //                       Navigator.pop(context);
  //                     },
  //                     child: Container(
  //                         margin: EdgeInsets.only(left: 10, right: 10),
  //                         child: Icon(
  //                           Icons.arrow_back_ios,
  //                           color: Colors.white,
  //                           size: 20,
  //                         ))),
  //                 Expanded(
  //                     child: Text(
  //                   "短期中银宝",
  //                   textAlign: TextAlign.center,
  //                   style: TextStyle(color: Colors.white, fontSize: 15),
  //                 )),
  //                 Container(
  //                     margin: EdgeInsets.only(left: 10, right: 10),
  //                     child: Icon(
  //                       Icons.arrow_back_ios,
  //                       color: Colors.transparent,
  //                       size: 20,
  //                     ))
  //               ],
  //             ),
  //             Container(
  //               padding: EdgeInsets.only(top: 45),
  //               margin: EdgeInsets.only(top: 35, left: 5, right: 5),
  //               decoration: BoxDecoration(
  //                   color: Colors.white,
  //                   boxShadow: [
  //                     BoxShadow(color: Colors.black12, blurRadius: 5)
  //                   ],
  //                   borderRadius: BorderRadius.circular(10)),
  //               width: 500,
  //               child: Column(
  //                 children: [
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: [
  //                       Text(
  //                         "总余额",
  //                         style: TextStyle(color: Colors.black87, fontSize: 15),
  //                       ),
  //                       Icon(
  //                         Icons.pie_chart_outline,
  //                         size: 15,
  //                       )
  //                     ],
  //                   ),
  //                   Text(
  //                     "0.00",
  //                     style: TextStyle(
  //                         height: 2,
  //                         color: Colors.black87,
  //                         fontSize: 40,
  //                         fontWeight: FontWeight.w400),
  //                   ),
  //                   Container(
  //                     margin: EdgeInsets.only(bottom: 10),
  //                     padding: EdgeInsets.only(left: 10, right: 10),
  //                     decoration: BoxDecoration(
  //                         color: Color.fromARGB(255, 205, 205, 205),
  //                         borderRadius: BorderRadius.circular(20)),
  //                     child: Text(
  //                       "收益明细",
  //                       style: TextStyle(
  //                           height: 1.4,
  //                           color: Colors.black87,
  //                           //fontSize: 40,
  //                           fontWeight: FontWeight.w400),
  //                     ),
  //                   ),
  //                   Text(
  //                     "当前利率：5.85%",
  //                     style: TextStyle(
  //                         height: 1.4,
  //                         color: Colors.black54,
  //                         fontSize: 12,
  //                         fontWeight: FontWeight.w400),
  //                   ),
  //                   SizedBox(
  //                     height: 30,
  //                   ),
  //                   Container(
  //                     margin: EdgeInsets.only(left: 15, right: 15),
  //                     child: Row(
  //                       children: [
  //                         Expanded(
  //                             child: Column(
  //                           children: [
  //                             Text(
  //                               "总金额（￥）",
  //                               style: TextStyle(
  //                                   height: 1.1,
  //                                   color: Colors.black54,
  //                                   fontSize: 11,
  //                                   fontWeight: FontWeight.w400),
  //                             ),
  //                             Text(
  //                               "0.50",
  //                               style: TextStyle(
  //                                   height: 1,
  //                                   color: Colors.black87,
  //                                   fontSize: 20,
  //                                   fontWeight: FontWeight.w400),
  //                             ),
  //                           ],
  //                         )),
  //                         Expanded(
  //                             child: Column(
  //                           children: [
  //                             Text(
  //                               "可转出金额（￥）",
  //                               style: TextStyle(
  //                                   height: 1.1,
  //                                   color: Colors.black54,
  //                                   fontSize: 11,
  //                                   fontWeight: FontWeight.w400),
  //                             ),
  //                             Text(
  //                               "0.50",
  //                               style: TextStyle(
  //                                   height: 1,
  //                                   color: Colors.black87,
  //                                   fontSize: 20,
  //                                   fontWeight: FontWeight.w400),
  //                             ),
  //                           ],
  //                         )),
  //                         Expanded(
  //                             child: Column(
  //                           children: [
  //                             Text(
  //                               "当前收益（￥）",
  //                               style: TextStyle(
  //                                   height: 1.1,
  //                                   color: Colors.black54,
  //                                   fontSize: 11,
  //                                   fontWeight: FontWeight.w400),
  //                             ),
  //                             Text(
  //                               "292.50",
  //                               style: TextStyle(
  //                                   height: 1,
  //                                   color: Colors.black87,
  //                                   fontSize: 20,
  //                                   fontWeight: FontWeight.w400),
  //                             ),
  //                           ],
  //                         ))
  //                       ],
  //                     ),
  //                   ),
  //                   Container(
  //                       decoration: BoxDecoration(
  //                           color: Color.fromARGB(255, 255, 134, 64),
  //                           borderRadius: BorderRadius.circular(8)),
  //                       height: 75,
  //                       width: 500,
  //                       margin: EdgeInsets.all(20),
  //                       child: Column(
  //                         crossAxisAlignment: CrossAxisAlignment.center,
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         children: [
  //                           Expanded(
  //                               child: Align(
  //                             alignment: Alignment.centerLeft,
  //                             child: Text(
  //                               "  最低转入金额：1000.00",
  //                               style: TextStyle(
  //                                   height: 1,
  //                                   color: Colors.white,
  //                                   fontSize: 13,
  //                                   fontWeight: FontWeight.w400),
  //                             ),
  //                           )),
  //                           Container(
  //                             height: 0.5,
  //                             color: Colors.white,
  //                           ),
  //                           Expanded(
  //                               child: Align(
  //                             alignment: Alignment.centerLeft,
  //                             child: Text(
  //                               "  最高转入金额：10000.00",
  //                               style: TextStyle(
  //                                   height: 1,
  //                                   color: Colors.white,
  //                                   fontSize: 13,
  //                                   fontWeight: FontWeight.w400),
  //                             ),
  //                           )),
  //                         ],
  //                       )),
  //                   SizedBox(
  //                     height: 10,
  //                   ),
  //                   Container(
  //                     clipBehavior: Clip.hardEdge,
  //                     decoration:
  //                         BoxDecoration(borderRadius: BorderRadius.circular(5)),
  //                     margin: EdgeInsets.all(5),
  //                     width: 500,
  //                     height: 35,
  //                     child: Row(
  //                       children: [
  //                         Expanded(
  //                             child: Container(
  //                           color: Color.fromARGB(255, 255, 115, 0),
  //                           child: Center(
  //                             child: Text(
  //                               "转入",
  //                               style: TextStyle(color: Colors.white),
  //                             ),
  //                           ),
  //                         )),
  //                         Expanded(
  //                             child: Container(
  //                           color: Color.fromARGB(255, 253, 239, 232),
  //                           child: Center(
  //                             child: Text(
  //                               "转出",
  //                               style: TextStyle(
  //                                   color: Color.fromARGB(255, 255, 115, 0)),
  //                             ),
  //                           ),
  //                         ))
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             Expanded(
  //                 child: Container(

  //                     //clipBehavior: Clip.hardEdge,
  //                     padding: EdgeInsets.all(20),
  //                     child: Scrollbar(
  //                       child: SingleChildScrollView(
  //                         child: Text(
  //                           "        短期中银宝是银行为与余额宝竞争而一款互联网理财产品，预期收益比银行活期高，随存随取，提现比较灵活，该企业被阿里巴巴购买，隶属旗下公司。阿里巴巴是全球企业间(B2B)电子商务的著名品牌，为数千万网商提供海量商机信息和便捷安全的在线交易市场，也是商人们以商会友、真实互动的社区平台。",
  //                           style: TextStyle(height: 2.2, fontSize: 15),
  //                         ),
  //                       ),
  //                     )))
  //           ],
  //         ),
  //       ))
  //     ],
  //   ));
  // }

  // Widget YvEPage() {
//     return Scaffold(
//         body: Stack(
//       children: [
//         Column(
//           children: [
//             Container(
//               height: 280,
//               color: Color.fromARGB(255, 240, 98, 16),
//             ),
//             Expanded(
//                 child: Container(
//               color: Colors.white,
//             ))
//           ],
//         ),
//         Positioned(
//             child: Padding(
//           padding: EdgeInsets.only(top: 15, left: 10, right: 10),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   GestureDetector(
//                       onTap: () {
//                         Navigator.pop(context);
//                       },
//                       child: Container(
//                           margin: EdgeInsets.only(left: 10, right: 10),
//                           child: Icon(
//                             Icons.arrow_back_ios,
//                             color: Colors.white,
//                             size: 20,
//                           ))),
//                   Expanded(
//                       child: Text(
//                     "余额宝",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(color: Colors.white, fontSize: 15),
//                   )),
//                   Container(
//                       margin: EdgeInsets.only(left: 10, right: 10),
//                       child: Icon(
//                         Icons.arrow_back_ios,
//                         color: Colors.transparent,
//                         size: 20,
//                       ))
//                 ],
//               ),
//               Container(
//                 padding: EdgeInsets.only(top: 20),
//                 margin: EdgeInsets.only(top: 35, left: 5, right: 5),
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     boxShadow: [
//                       BoxShadow(color: Colors.black12, blurRadius: 5)
//                     ],
//                     borderRadius: BorderRadius.circular(10)),
//                 width: 500,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Text(
//                           "总余额(元) ",
//                           style: TextStyle(color: Colors.black87, fontSize: 12),
//                         ),
//                         Icon(
//                           Icons.remove_red_eye_outlined,
//                           size: 18,
//                           color: Colors.black45,
//                         ),
//                         Container(
//                           padding: EdgeInsets.fromLTRB(1, 0, 1, 0),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(3),
//                             border: Border.all(width: 0.5, color: Colors.grey),
//                           ),
//                           child: Row(children: [
//                             Icon(
//                               Icons.verified_user,
//                               size: 10,
//                               color: Colors.orange,
//                             ),
//                             Text(
//                               "资金安全",
//                               style: TextStyle(
//                                   height: 2,
//                                   color: Colors.orange,
//                                   fontSize: 8,
//                                   fontWeight: FontWeight.w900),
//                             ),
//                           ]),
//                         )
//                       ],
//                     ),
//                     Text(
//                       "  545,869.56",
//                       style: TextStyle(
//                           height: 2,
//                           color: Colors.black87,
//                           fontSize: 35,
//                           fontWeight: FontWeight.w500),
//                     ),
//                     SizedBox(
//                       height: 30,
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(left: 15, right: 15),
//                       child: Row(
//                         children: [
//                           Expanded(
//                               child: Column(
//                             children: [
//                               Text(
//                                 "昨日收益(元)",
//                                 style: TextStyle(
//                                     height: 1.1,
//                                     color: Colors.black54,
//                                     fontSize: 13,
//                                     fontWeight: FontWeight.w400),
//                               ),
//                               Text(
//                                 " 0.27 ",
//                                 style: TextStyle(
//                                     height: 2,
//                                     color: Colors.orange,
//                                     fontSize: 17,
//                                     fontWeight: FontWeight.w600),
//                               ),
//                             ],
//                           )),
//                           Expanded(
//                               child: Column(
//                             children: [
//                               Text(
//                                 "累计收益(元)",
//                                 style: TextStyle(
//                                     height: 1.1,
//                                     color: Colors.black54,
//                                     fontSize: 13,
//                                     fontWeight: FontWeight.w400),
//                               ),
//                               Text(
//                                 "19.1",
//                                 style: TextStyle(
//                                     height: 2,
//                                     color: Colors.black87,
//                                     fontSize: 17,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                             ],
//                           )),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Container(
//                       clipBehavior: Clip.hardEdge,
//                       decoration:
//                           BoxDecoration(borderRadius: BorderRadius.circular(5)),
//                       margin: EdgeInsets.all(5),
//                       width: 500,
//                       height: 45,
//                       child: Row(
//                         children: [
//                           Expanded(
//                               child: Container(
//                             decoration: BoxDecoration(
//                                 color: Color.fromARGB(255, 253, 239, 232),
//                                 borderRadius: BorderRadius.circular(5)),
//                             child: Center(
//                               child: Text(
//                                 "转出",
//                                 style: TextStyle(
//                                     color: Color.fromARGB(255, 255, 115, 0)),
//                               ),
//                             ),
//                           )),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Expanded(
//                               child: Container(
//                             decoration: BoxDecoration(
//                                 color: Color.fromARGB(255, 255, 232, 232),
//                                 borderRadius: BorderRadius.circular(5)),
//                             child: Center(
//                               child: Text(
//                                 "转入",
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                             ),
//                           )),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ))
//       ],
//     ));
//   }
// // }
}

class ModelScreen extends StatefulWidget {
  String label;
  ModelScreen({required this.label, super.key});

  @override
  State<ModelScreen> createState() => ModelScreenState();
}

class ModelScreenState extends State<ModelScreen> {
  Map data = {};

  @override
  void initState() {
    super.initState();
    String? token = html.window.localStorage['token'];

    IntoHome(token).then((value) {
      //print("");
      String data1 = value["data1"];
      //print("data1$data1");
      data = json.decode(data1.replaceAll("'", "\""))[widget.label];
      setState(() {});
      //data = json.decode(data1.replaceAll("'", "\""))[widget.label];
    });
    //print("111111111111111111111111111111111111111111111111111$data");
  }

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
                    "${data["name"]}",
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
                      "${data["balance"]}",
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
                      "当前利率：${data["interest"]}%",
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
                                "${data["total"]}",
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
                                "${data["enout"]}",
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
                                "${data["current"]}",
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
                                "    最低转入金额：${data["top"]}",
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
                                "    最高转入金额：${data["bottom"]}",
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
                              child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TkIntoScreen(
                                          label: widget.label,
                                          state: true,
                                        )),
                              );
                            },
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
                            ),
                          )),
                          Expanded(
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TkIntoScreen(
                                                label: widget.label,
                                                state: false,
                                              )),
                                    );
                                  },
                                  child: Container(
                                    color: Color.fromARGB(255, 253, 239, 232),
                                    child: Center(
                                      child: Text(
                                        "转出",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 254, 79, 52),
                                        ),
                                      ),
                                    ),
                                  )))
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
