import 'package:flui/flui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mai_na/config/style_config.dart';
import 'package:flutter_mai_na/models/gloabalVar.dart';
import 'package:flutter_mai_na/service/webdata_service.dart';
import 'package:flutter_mai_na/widgets/bar/common_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TransAppPage extends StatefulWidget {
  @override
  _TransAppPageState createState() => _TransAppPageState();
}

class _TransAppPageState extends State<TransAppPage> {
  ScrollController _scrollController = new ScrollController();
  Widget raisedButton() {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 40, 0, 50),
        width: 200,
        child: FLGradientButton.linear(
            textColor: Colors.white,
            child: Text(
              '提交申请',
              style: textStyleBold_16,
            ),
            colors: [Colors.deepOrange, Colors.orange],
            onPressed: () {
              String bitAcountUrl = txtAddressController.text.trim();
              if (bitAcountUrl == null || bitAcountUrl.length <= 3) {
                //支付宝账号
                Fluttertoast.showToast(
                    msg: "请填写对方钱包地址",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    textColor: Colors.white,
                    fontSize: 14.0);
                return;
              }
              double amount = 0.0;
              amount = double.tryParse(txtAmountController.text.trim());
              if (amount == null || amount <= 0.0) {
                Fluttertoast.showToast(
                    msg: "请填写提现金额",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    textColor: Colors.white,
                    fontSize: 14.0);
                return;
              }

              commitTransApp(
                GloabVar.memid,
                bitAcountUrl,
                amount.toStringAsFixed(8),
              ).then((v) {
                if (v.resultmsg == "SUCCESS") {
                  //申请成功
                  Fluttertoast.showToast(
                      msg: "提交成功",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 2,
                      textColor: Colors.white,
                      fontSize: 14.0);
                  txtAmountController.text = "";
                  txtAddressController.text = "";
                  Future.delayed(Duration(seconds: 2), () {
                    if (Navigator.canPop(context)) {
                      FocusScope.of(context).requestFocus(new FocusNode());
                      Navigator.pop(context);
                    }
                  });
                } else {
                  //申请成功
                  Fluttertoast.showToast(
                      msg: "提交失败",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 2,
                      textColor: Colors.white,
                      fontSize: 14.0);
                }
              });
            })
        //银行

        );
  }

  Widget restPannel() {
    return Container(
        child: Row(
      children: <Widget>[
        Container(
            margin: EdgeInsets.fromLTRB(30, 20, 0, 0),
            child: Text(
              "余额:",
              style: textStyle_16,
            )),
        Container(
            margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
            child: Icon(
                IconData(
                  0xe63a,
                  fontFamily: "Myicons",
                ),
                size: 35,
                color: Colors.orange)),
        Container(
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Text(
              bitWalletBalance,
              style: textStyleOrange_22,
            )),
        Container(
            margin: EdgeInsets.fromLTRB(5, 30, 0, 0),
            child: Text(
              "≈ $bitWalletCNY CNY",
              style: textStyleOrange_13,
            )),
      ],
    ));
  }

  String bitWalletBalance = "0.00";
  String bitWalletCNY = "0.00";
  @override
  void initState() {
    getWalletBalance(GloabVar.memid).then((v) {
      if (mounted) {
        setState(() {
          if (v != null) {
            if (v.bitwallet != null) bitWalletBalance = v.bitwallet;
            if (v.bitrmb != null) bitWalletCNY = v.bitrmb;
          }
        });
      }
    });
    super.initState();
  }

  TextEditingController txtAmountController = TextEditingController();
  TextEditingController txtAddressController = TextEditingController();
  Widget transAppTextField() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
            width: ScreenUtil().setWidth(900),
            child: TextField(
              controller: txtAddressController,
              textAlign: TextAlign.center, //文本对齐方式
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.orange,
              ), //输入文
              decoration: InputDecoration(
                fillColor: Colors.grey.shade100,
                filled: true,
                prefixIcon: Icon(
                  Icons.contact_mail,
                  color: Colors.blue,
                ),
                hintText: '钱包地址',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
            width: ScreenUtil().setWidth(900),
            child: TextField(
              controller: txtAmountController,
              keyboardType: TextInputType.number,

              textAlign: TextAlign.center, //文本对齐方式
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.orange,
              ), //输入文
              decoration: InputDecoration(
                fillColor: Colors.grey.shade100,
                filled: true,
                prefixIcon: Icon(
                  Icons.crop_rotate,
                  color: Colors.blue,
                ),
                hintText: '转账金额',
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ComMomBar(title: "转账申请"),
        body: Center(
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                restPannel(),
                transAppTextField(),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 60, 0, 0),
                  child: Text(
                    '''温馨提示：最少需要0.01个比特币才能实行转账''',
                    style: textStyleGrey_13,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Text(
                    '''每转账一笔收取0.0005个比特币的费用''',
                    style: textStyleGrey_13,
                  ),
                ),
                raisedButton(),
              ],
            ),
          ),
        ));
  }
}
