import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flui/flui.dart';
import 'package:flutter_mai_na/common/animate_route.dart';
import 'package:flutter_mai_na/common/common_check.dart';
import 'package:flutter_mai_na/common/fileIO.dart';
import 'package:flutter_mai_na/config/style_config.dart';
import 'package:flutter_mai_na/models/gloabalVar.dart';
import 'package:flutter_mai_na/pages/_6webview_page.dart';
import 'package:flutter_mai_na/service/webdata_service.dart';
import 'package:flutter_mai_na/widgets/webview_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nav_router/nav_router.dart';

import '_0index_page.dart';
import '_1news_page.dart';
import 'member/_41contract_page.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userIdController = TextEditingController();

  TextEditingController userInviteCodeController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  FocusNode nodeUserId = FocusNode();
  FocusNode nodePwd = FocusNode();
  bool bRegister = false;

  //账号输入框
  Widget userIdInputWidget() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
      width: ScreenUtil().setWidth(900),
      child: TextField(
        onSubmitted: (val) {},
        keyboardType: TextInputType.number,
        focusNode: nodeUserId,
        controller: userIdController,
        autofocus: true,
        textAlign: TextAlign.center,
        style: textStyle_16,
        maxLength: 11,
        decoration: InputDecoration(
          fillColor: Colors.grey[200],
          filled: true,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.grey[400])),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.grey[300])),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.clear,
              color: Color.fromARGB(255, 126, 126, 126),
            ),
            onPressed: () {
              //清除输入手机号
              userIdController.clear();
            },
          ),
          prefixIcon: Container(
            padding: EdgeInsets.all(15),
            child: Text(
              "+86",
              style: textStyle_16,
            ),
          ),
          hintText: '请输入手机号',
          // labelText: '账号',
          // labelStyle: TextStyle(color: Color.fromARGB(255, 126, 126, 126))
        ),
      ),
    );
  }

  Widget userInviteCodeInputWidget() {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
        width: ScreenUtil().setWidth(900),
        child: Offstage(
          offstage: bRegister,
          child: TextField(
            onSubmitted: (val) {},
            keyboardType: TextInputType.number,
            focusNode: nodeUserId,
            controller: userInviteCodeController,
            autofocus: true,
            textAlign: TextAlign.center,
            style: textStyle_16,
            decoration: InputDecoration(
              fillColor: Colors.grey[200],
              filled: true,
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.grey[400])),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.grey[300])),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.clear,
                  color: Color.fromARGB(255, 126, 126, 126),
                ),
                onPressed: () {
                  userInviteCodeController.clear();
                },
              ),
              prefixIcon: Container(
                  padding: EdgeInsets.all(15), child: Icon(Icons.person_add)),
              hintText: '请输入邀请码',
              // labelText: '账号',
              // labelStyle: TextStyle(color: Color.fromARGB(255, 126, 126, 126))
            ),
          ),
        ));
  }

  bool checkCodeBtnEnable = true;
  bool inSubmit = false;
  Timer _timer;
  int curTimeCount = 60;
  timerTickMethod() {
    if (curTimeCount >= 0) {
      if (mounted) {
        setState(() {
          curTimeCount--;
        });
      } else {
        _timer.cancel();
        _timer = null;
      }
    } else {
      if (mounted) {
        setState(() {
          checkCodeBtnEnable = true;
        });
      } else {
        _timer.cancel();
        _timer = null;
      }
      _timer.cancel();
      _timer = null;
    }
  }

  Widget pwdInputWidget() {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: Container(
          width: ScreenUtil().setWidth(900),
          child: TextField(
            onSubmitted: (val) {
              //输入提交
            },
            textAlign: TextAlign.center,
            style: textStyle_16,
            keyboardType: TextInputType.number,
            focusNode: nodePwd,
            controller: pwdController,
            autofocus: true,
            // obscureText: true,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                fillColor: Colors.grey[200],
                filled: true,
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.grey[400])),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.grey[300])),
                // contentPadding: EdgeInsets.all(10),
                hintText: bRegister ? "  邀请码" : "",
                suffixIcon: Container(
                  child: Offstage(
                      offstage: bRegister,
                      // padding: EdgeInsets.all(6),
                      child: FLLoadingButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            checkCodeBtnEnable
                                ? '获取验证码'
                                : "${curTimeCount}s重新获取",
                            style: checkCodeBtnEnable
                                ? textStyleBlue_15
                                : textStyleBlue_15,
                          ),
                          // color: checkCodeBtnEnable ? Colors.blue : Colors.grey,
                          disabledColor: Color(0xFF0F4C81),
                          indicatorColor: Colors.white,
                          disabledTextColor: Colors.grey.withAlpha(40),
                          textColor: Colors.white,
                          minWidth: 100,
                          height: 10,
                          onPressed: () {
                            if (!isMobilePhoneNumber(userIdController.text)) {
                              Fluttertoast.showToast(
                                  msg: "请输入正确的手机号",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 2,
                                  textColor: Colors.white,
                                  fontSize: 14.0);
                              return;
                            }
                            if (curTimeCount > 0 && curTimeCount < 60) {
                              print('正在获取验证码，请勿重复获取');
                              return;
                            }
                            generateCheckCode(userIdController.text);
                            print('获取验证码按钮按下');
                            curTimeCount = 60;
                            setState(() {
                              checkCodeBtnEnable = false;
                            });
                            _timer =
                                Timer.periodic(Duration(seconds: 1), (timer) {
                              print('获取验证码按钮按下1$curTimeCount');
                              timerTickMethod();
                            });
                          })),
                )
                // labelText: "",
                // labelStyle:
                //     TextStyle(color: Color.fromARGB(255, 126, 126, 126))
                ),
          ),
        ));
  }

  Widget appLogoWidget() {
    return Container(
      height: ScreenUtil().setWidth(180),
      width: ScreenUtil().setHeight(180),
      margin: EdgeInsets.only(top: 50),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Image.asset(
          "assets/login_logo.png",
        ),
      ),
    );
  }

  Widget appLogoTitleWidget() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Text(
        '迈钠科技',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }

  Widget loginButton() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
      width: 200,
      child: FLLoadingButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          bRegister ? "注册" : "登录",
          textAlign: TextAlign.center,
        ),
        color: ifChecked ? Colors.blue : Colors.grey,
        disabledColor: Colors.blue,
        indicatorColor: Colors.white,
        disabledTextColor: Colors.grey.withAlpha(40),
        textColor: Colors.white,
        loading: inSubmit,
        minWidth: ScreenUtil().setWidth(200),
        onPressed: () {
          loginCheck();
        },
      ),
    );
  }

  bool ifChecked = true;
  Widget contractTip() {
    return Container(
        margin: EdgeInsets.only(top: 60),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Center(
                  child: InkWell(
                onTap: () {
                  setState(() {
                    ifChecked = !ifChecked;
                  });
                },
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ifChecked
                        ? Icon(
                            Icons.check_box,
                            color: Colors.blue,
                            size: 25.0,
                          )
                        : Icon(
                            Icons.check_box_outline_blank,
                            size: 25.0,
                            color: Colors.white,
                          ),
                  ),
                ),
              )),
            ),
            Container(
              child: Text(
                '有阅读并同意',
                style: textStyleWhite_13,
              ),
            ),
            Container(
              child: InkWell(
                  onTap: () {
                    routePush(ContractPage());
                  },
                  child: Text(
                    '迈钠科技用户协议',
                    style: textStyleBlueUnderline_13,
                  )),
            )
          ],
        ));
  }

  Widget registerTip() {
    return Container(
      alignment: Alignment.center,
      child: InkWell(
        child: Text(
          !bRegister ? "没有账号?点我注册" : "已有账号，点我登录",
          style: textStyleWhite_13,
        ),
        onTap: () {
          setState(() {
            bRegister = !bRegister;
          });
        },
      ),
    );
  }

  quickLogin() async {
    //检查本地是否有数据
    String localMemid = await readConfig("memid");
    print("localMemid=$localMemid");
    String localUserName = await readConfig("username");
    print("localUserName=$localUserName");
    String localApptime = await readConfig("usertime");
    print("localApptime=$localApptime");
    String localTime = await readConfig("loctime");
    print("localTime=$localTime");
    if (localTime != null &&
        localTime.length > 3 &&
        localMemid != null &&
        localMemid.length > 3) {
      DateTime old = DateTime.tryParse(localTime);
      var difference = daysBetween(old, DateTime.now());
      print("距离上次登录difference$difference");
      if (difference < 45) {
        GloabVar.memid = localMemid;
        GloabVar.userName = localUserName == null ? "" : localUserName;
        GloabVar.regTime = localApptime == null ? "" : localApptime;
        //登录成功
        Navigator.of(context).pushAndRemoveUntil(
            new MaterialPageRoute(builder: (context) => new MaiNaAPP()),
            (route) => route == null);
      }
    }
  }

  loginCheck() async {
    if (!ifChecked) {
      Fluttertoast.showToast(
          msg: "请先勾选同意协议须知",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          textColor: Colors.white,
          fontSize: 14.0);
      return;
    }
    if (!isMobilePhoneNumber(userIdController.text)) {
      Fluttertoast.showToast(
          msg: "请输入正确的手机号",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          textColor: Colors.white,
          fontSize: 14.0);
      return;
    }
    if (pwdController.text == "" || pwdController.text == null) {
      Fluttertoast.showToast(
          msg: "请输入验证码或邀请码",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          textColor: Colors.white,
          fontSize: 14.0);
      return;
    }
    //请求查询账号密码是否正确
    var checkLoginData =
        await postLoginCheck(userIdController.text, pwdController.text);
    if (checkLoginData.memid != null && checkLoginData.memid != "") {
      //登录成功 更新gloabVar
      GloabVar.memid = checkLoginData.memid;
      print("memid登录成功${GloabVar.memid}");
      GloabVar.userName =
          checkLoginData.name == null ? "" : checkLoginData.name;
      GloabVar.regTime =
          checkLoginData.inputtime == null ? "" : checkLoginData.inputtime;
      writeConfig("memid", GloabVar.memid);
      writeConfig("username", GloabVar.userName);
      writeConfig("usertime", GloabVar.regTime);
      writeConfig("loctime", DateTime.now().toString());
      Fluttertoast.showToast(
          msg: "登录成功",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          textColor: Colors.white,
          fontSize: 14.0);
      //登录成功
      Navigator.of(context).pushAndRemoveUntil(
          new MaterialPageRoute(builder: (context) => new MaiNaAPP()),
          (route) => route == null);
    } else {
      //验证码过去
      Fluttertoast.showToast(
          msg: "登录验证失败",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          textColor: Colors.white,
          fontSize: 14.0);
      return;
    }
    //正确则进入系统
  }

  bool firstCheck = true;
  Widget buildLoginForm() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          appLogoWidget(),
          appLogoTitleWidget(),
          userIdInputWidget(),
          pwdInputWidget(),
          loginButton(),
          contractTip(),
          registerTip(),
          // InkWell(
          //   child: Text(
          //     "测试",
          //     style: TextStyle(color: Colors.white),
          //   ),
          //   onTap: () {
          //     routePush(WebDetails(
          //         "http://m.huobi.io/zh-cn/market/chart/?s=eth_usdt"));
          //   },
          // ),
          // TextField(
          //   decoration: InputDecoration(
          //       contentPadding: EdgeInsets.all(10.0),
          //       border: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(15.0),
          //       )),
          // )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    if (firstCheck) {
      quickLogin();
      firstCheck = false;
    }
    return Scaffold(
        body: Container(
      child: buildLoginForm(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/login12.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    ));
  }
}
