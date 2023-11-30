// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'dart:html' as html;
//import 'pages.dart';
import 'package:kobo_login/core.dart';

// class TextAnimation extends StatefulWidget {
//   final String text;
//   const TextAnimation({super.key, required this.text});
//   @override
//   _TextAnimationState createState() => _TextAnimationState();
// }
// class _TextAnimationState extends State<TextAnimation>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Tween<double> _positionTween;
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 5),
//       vsync: this,
//     )..repeat();
//     _positionTween = Tween<double>(
//       begin: 1,
//       end: -1,
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _controller,
//       builder: (context, child) {
//         double position = _positionTween.evaluate(_controller);
//         return Transform.translate(
//           offset: Offset(
//             MediaQuery.of(context).size.width * position,
//             0,
//           ),
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: Text(
//               widget.text,
//               style: const TextStyle(fontSize: 12, color: Colors.blue),
//             ),
//           ),
//         );
//       },
//     );
//   }
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }

class MyCircularCheckbox extends StatefulWidget {
  final ValueChanged<bool>? onChanged;

  const MyCircularCheckbox({super.key, this.onChanged});

  @override
  _MyCircularCheckboxState createState() => _MyCircularCheckboxState();
}

class _MyCircularCheckboxState extends State<MyCircularCheckbox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isChecked = !_isChecked;
          widget.onChanged?.call(_isChecked);
        });
      },
      child: Container(
        width: 18.0,
        height: 18.0,
        decoration: BoxDecoration(
          color: _isChecked ? Colors.blue : Colors.white,
          shape: BoxShape.circle,
          border:
              _isChecked ? null : Border.all(color: Colors.black, width: 0.5),
        ),
        child: Center(
          child: _isChecked
              ? const Icon(
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
  final String label;
  final bool state;
  const TkIntoScreen({
    super.key,
    required this.label,
    required this.state,
  });
  @override
  State<TkIntoScreen> createState() => TkIntoScreenState();
}

class TkIntoScreenState extends State<TkIntoScreen> {
  bool check = false;
  String? text = "";
  TextEditingController number = TextEditingController();
  TextEditingController password = TextEditingController();
  Map data = {};
  @override
  void initState() {
    super.initState();
    text = widget.state ? "转入" : "转出";
    String? token = html.window.localStorage['token'];

    lntoHome(token).then((value) {
      //print("Received value from lntoHome: $value");
      data = value; //data1[widget.label];
      //print(token);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                  bottom: BorderSide(width: 0.5, color: Colors.black12))),
          padding: const EdgeInsets.all(5),
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
                    children: const [
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
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
              )),
              const Text(
                "交易规则",
                style: TextStyle(fontSize: 12, color: Colors.blue),
              )
            ],
          ),
        ),
        Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom: BorderSide(width: 0.5, color: Colors.black12))),
            padding: const EdgeInsets.all(5),
            height: 40,
            child: Row(
              children: [
                Text(
                  "  $text金额",
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500),
                ),
                const Expanded(child: SizedBox()),
                Text(
                  "可$text金额:${data.isNotEmpty ? (widget.state ? data["data2"]["total"] : data["data1"][widget.label]["enout"]) : '加载中...'}",
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black45),
                ),
              ],
            )),
        Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom: BorderSide(width: 0.5, color: Colors.black12))),
            padding: const EdgeInsets.all(15),
            //height: 150,
            child: Column(
              children: [
                TextField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
                  ],
                  controller: number,
                  decoration: InputDecoration(
                      prefixIcon: const Text(
                        "￥",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 25),
                      ),
                      hintText: "输入$text金额",
                      border: const UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 0.1, color: Colors.black12))),
                ),
                TextField(
                  controller: password,
                  obscureText: true,
                  decoration: const InputDecoration(
                      hintText: "默认为:登入密码",
                      border: UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 0.1, color: Colors.black12))),
                )
              ],
            )),
        Container(
          padding: const EdgeInsets.only(left: 10),
          height: 50,
          child: Row(
            children: [
              MyCircularCheckbox(
                onChanged: (value) {
                  setState(() {
                    check = value;
                  });
                },
              ),
              const Text(
                "  同意",
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
              const Text(
                "《相关协议》",
                style: TextStyle(fontSize: 12, color: Colors.blue),
              ),
              const Text(
                "，并知晓理财可能存在的风险",
                style: TextStyle(fontSize: 12, color: Colors.black),
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            if (number.text != "" && check) {
              if (widget.state) {
                Decimal objecttotal =
                    Decimal.parse(data["data1"][widget.label]["balance"]);
                Decimal usertotal = Decimal.parse(data["data2"]["total"]);
                Decimal takemoney = Decimal.parse(number.text);
                if (usertotal >= takemoney) {
                  DateTime now = DateTime.now();
                  List interest = [
                    [1, "1.0585"],
                    [3, "1.0895"],
                    [7, "1.1175"],
                    [24, "1.1467"],
                    [72, "1.2153"],
                    [360, "1.2583"]
                  ];
                  DateTime futureTime = now.add(Duration(
                      hours: interest[(int.parse(widget.label) - 4)]
                          [0])); //此处-4是因为项目标签是从4开始数的
                  data["data1"][widget.label]["balance"] =
                      (objecttotal + takemoney).toStringAsFixed(2);
                  data["data1"][widget.label]["total"] =
                      (objecttotal + takemoney).toStringAsFixed(2);
                  data["data1"][widget.label]["enout"] =
                      (objecttotal + takemoney).toStringAsFixed(2);
                  data["data2"]["total"] =
                      (usertotal - takemoney).toStringAsFixed(2);
                  data["data3"].add({
                    "start": DateFormat('yyyy-MM-dd HH:mm:ss').format(now),
                    "end": DateFormat('yyyy-MM-dd HH:mm:ss').format(futureTime),
                    "status": "0", //表示项目正在进行
                    "name": data["data1"][widget.label]["name"],
                    "base": (objecttotal + takemoney).toStringAsFixed(2),
                    "interest": data["data1"][widget.label]["interest"],
                    "gone": ((objecttotal + takemoney) *
                            Decimal.parse(
                                interest[(int.parse(widget.label) - 4)][1]))
                        .toStringAsFixed(2)
                  });
                  String? token = html.window.localStorage['token'];
                  mout(token, data, password.text).then((value) {
                    if (value["status"] == "success") {
                      String? storedToken = html.window.localStorage['token'];
                      redirectToUrl(
                          Uri.parse('$initialurl/home/?token=$storedToken'));
                    } else {
                      showMyDialog(context, "密码错误或金额不符合要求");
                    }
                  });
                } else {
                  showMyDialog(context, "产品金额不足");
                }
              } else {
                //产品当前余额
                Decimal objecttotal =
                    Decimal.parse(data["data1"][widget.label]["balance"]);
                //用于钱包余额
                Decimal usertotal = Decimal.parse(data["data2"]["total"]);
                //输入框金额
                Decimal takemoney = Decimal.parse(number.text);
                if (objecttotal >= takemoney) {
                  if (takemoney <=
                      Decimal.parse(data["data1"][widget.label]["enout"])) {
                    data["data1"][widget.label]["balance"] =
                        (objecttotal - takemoney).toStringAsFixed(2);
                    data["data1"][widget.label]["total"] =
                        (objecttotal - takemoney).toStringAsFixed(2);
                    data["data1"][widget.label]["enout"] =
                        (objecttotal - takemoney).toStringAsFixed(2);
                    data["data2"]["total"] =
                        (usertotal + takemoney).toStringAsFixed(2);
                    String? token = html.window.localStorage['token'];
                    mout(token, data, password.text).then((value) {
                      if (value["status"] == "success") {
                        String? storedToken = html.window.localStorage['token'];
                        redirectToUrl(
                            Uri.parse('$initialurl/home/?token=$storedToken'));
                      } else {
                        showMyDialog(context, "密码错误或金额不符合要求");
                      }
                    });
                  } else {
                    showMyDialog(context, "当前金额数量不可提取");
                  }
                } else {
                  showMyDialog(context, "账户余额不足");
                }
              }
            }
          },
          child: Container(
            height: 35,
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: check ? Colors.blue : Colors.black26,
            ),
            child: Center(
              child: Text(
                "立即$text",
                style: const TextStyle(color: Colors.white),
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
  final String label;
  const ModelScreen({required this.label, super.key});

  @override
  State<ModelScreen> createState() => ModelScreenState();
}

class ModelScreenState extends State<ModelScreen> {
  Map data = {};

  @override
  void initState() {
    super.initState();

    String? token = html.window.localStorage['token'];

    lntoHome(token).then((value) {
      //print("");
      Map data1 = value["data1"];
      //print("data1$data1");
      data = data1[widget.label];
      setState(() {});
      //data = json.decode(data1.replaceAll("'", "\""))[widget.label];
      //print("source label: ${widget.label}");
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
              height: 250,
              color: const Color.fromARGB(255, 254, 79, 52),
            ),
            Expanded(
                child: Container(
              color: Colors.white,
            ))
          ],
        ),
        Positioned(
            child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
          child: ListView(
            children: [
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 25,
                          ))),
                  Expanded(
                      child: Text(
                    "${data["name"]}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  )),
                  Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.transparent,
                        size: 20,
                      ))
                ],
              ),
              Container(
                padding: const EdgeInsets.only(top: 45),
                margin: const EdgeInsets.only(top: 35, left: 5, right: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(color: Colors.black26, blurRadius: 5)
                    ],
                    borderRadius: BorderRadius.circular(10)),
                width: 500,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "总余额",
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                        Icon(
                          Icons.visibility,
                          size: 16,
                          color: Colors.black45,
                        )
                      ],
                    ),
                    Text(
                      "${data["balance"]}",
                      style: const TextStyle(
                          fontFamily: "Yu Gothic UI",
                          height: 2.5,
                          color: Colors.black87,
                          fontSize: 27,
                          fontWeight: FontWeight.w400),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(199, 205, 205, 205),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text(
                        "收益明细",
                        style: TextStyle(
                            height: 1.8,
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Text(
                      "当前利率：${data["interest"]}%",
                      style: const TextStyle(
                          height: 1.4,
                          color: Colors.black54,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        children: [
                          Expanded(
                              child: Column(
                            children: [
                              const Text(
                                "总金额（￥）",
                                style: TextStyle(
                                    height: 1.3,
                                    color: Colors.black54,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "${data["total"]}",
                                style: const TextStyle(
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
                              const Text(
                                "可转出金额（￥）",
                                style: TextStyle(
                                    height: 1.3,
                                    color: Colors.black54,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "${data["enout"]}",
                                style: const TextStyle(
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
                              const Text(
                                "当前收益（￥）",
                                style: TextStyle(
                                    height: 1.3,
                                    color: Colors.black54,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "${data["current"]}",
                                style: const TextStyle(
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
                            color: const Color.fromARGB(255, 254, 79, 52),
                            borderRadius: BorderRadius.circular(8)),
                        height: 80,
                        width: 500,
                        margin: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "    最低转入金额：${data["top"]}",
                                style: const TextStyle(
                                    height: 1,
                                    color: Colors.white,
                                    fontSize: 15,
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
                                style: const TextStyle(
                                    //fontFamily: "MS Gothic",
                                    height: 1,
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                              ),
                            )),
                          ],
                        )),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)),
                      width: 500,
                      height: 40,
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
                              color: const Color.fromARGB(255, 254, 79, 52),
                              child: const Center(
                                child: Text(
                                  "转入",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ),
                          )),
                          Expanded(
                              child: GestureDetector(
                                  onTap: () {
                                    //print(widget.label);
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
                                    color: const Color.fromARGB(
                                        255, 253, 239, 232),
                                    child: const Center(
                                      child: Text(
                                        "转出",
                                        style: TextStyle(
                                          fontSize: 20,
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
              Container(
                  margin: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(color: Colors.black12, blurRadius: 5)
                      ]),

                  //clipBehavior: Clip.hardEdge,
                  padding: const EdgeInsets.all(10),
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      child: Text(
                        "        ${discreption[widget.label]}",
                        style: const TextStyle(height: 2.2, fontSize: 17),
                      ),
                    ),
                  ))
            ],
          ),
        ))
      ],
    ));
  }

  Map discreption = {
    "4":
        "短期中银宝是蚂蚁财富推出的一种理财产品低风险、高收益、短期灵活的理财产品，它的出现旨在让投资者以较低的风险获得更高的收益，追求更稳定的资产增值效果，这种理财产品的特点是资金随时可取，没有固定期限，可以灵活调整资产配置，通过合理地分散资产，降低风险，中银宝可为投资者带来更多的收益。 短期中银宝活期存款利率为5.85%，投资时长1H，利息=存款余额*5.85%。",
    "5":
        "短期余额宝是蚂蚁集团旗下的余额增值服务和活期资金管理服务产品，于2013年6月推出，余额宝特点是操作简便、低门槛、零手续费、可随取随用，是中国用户数最多的货币基金。 短期余额宝活期存款利率为8.95%，投资时长3H，利息=存款余额*8.95%",
    "6":
        "短期余利宝是蚂蚁集团旗下的一款货币基金产品，由阿里巴巴旗下的支付平台——支付宝推出。其只要目的是为用户提供便捷、快速、高收益的理财服务。余利宝投资于货币市场工具和银行存款等低风险金融产品，用户可以随时买入或赎回，没有任何费用和锁定时间。 短期余额宝活期存款利率为11.75%，投资时长7H，利息=存款余额*11.75%",
    "7":
        "长期中银宝是蚂蚁财富推出的一种理财产品低风险、高收益、短期灵活的理财产品，它的出现旨在让投资者以较低的风险获得更高的收益，追求更稳定的资产增值效果，这种理财产品的特点是资金随时可取，没有固定期限，可以灵活调整资产配置，通过合理地分散资产，降低风险，中银宝可为投资者带来更多的收益。 短期中银宝活期存款利率为14.67%，投资时长24H，利息=存款余额*14.67%",
    "8":
        "长期余额宝是蚂蚁集团旗下的余额增值服务和活期资金管理服务产品，于2013年6月推出，余额宝特点是操作简便、低门槛、零手续费、可随取随用，是中国用户数最多的货币基金。 长期余额宝活期存款利率为21.53%，投资时长72H，利息=存款余额*21.53%",
    "9":
        "长期余利宝是蚂蚁集团旗下的一款货币基金产品，由阿里巴巴旗下的支付平台——支付宝推出。其只要目的是为用户提供便捷、快速、高收益的理财服务。余利宝投资于货币市场工具和银行存款等低风险金融产品，用户可以随时买入或赎回，没有任何费用和锁定时间。 长期余利宝活期存款利率为25.83%，投资时长360H，利息=存款余额*25.83%"
  };
}
