import 'package:flui/flui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mai_na/config/style_config.dart';
import 'package:flutter_mai_na/models/gloabalVar.dart';
import 'package:flutter_mai_na/service/webdata_service.dart';
import 'package:flutter_mai_na/widgets/bar/common_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WalletBalance extends StatefulWidget {
  @override
  _WalletBalanceState createState() => _WalletBalanceState();
}

class _WalletBalanceState extends State<WalletBalance> {
  String memWallet = "0.00";
  String bitWallet = "0.00";
  String bitDollor = "0.00";

  Widget raisedButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 60, 0, 0),
      width: 200,
      child: FLGradientButton.linear(
        textColor: Colors.white,
        child: Text(
          '     返 回      ',
          style: textStyleBold_16,
        ),
        colors: [Colors.deepOrange, Colors.orange],
        onPressed: () {
          print("返 回");
          if (Navigator.canPop(context)) {
            FocusScope.of(context).requestFocus(new FocusNode());
            Navigator.pop(context);
          }
        },
      ),
    );
  }

  Widget walletPannel() {
    return Container(
      height: ScreenUtil().setHeight(1000),
      decoration: BoxDecoration(
        color: Colors.orange,
      ),
      child: Column(
        children: <Widget>[
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(10, 30, 20, 0),
                  child: Text("账户余额(推广账户)", style: textStyleWhite_13),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(15, 20, 20, 0),
                  child: Text("¥  $memWallet 元", style: textStyleWhite_22),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 20, 20, 0),
                  child: Text(
                    "比特币账户(BTC)",
                    style: textStyleWhite_13,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
                        child: Icon(
                            IconData(
                              0xe63a,
                              fontFamily: "Myicons",
                            ),
                            size: 35,
                            color: Colors.white)),
                    Container(
                        margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Text(
                          bitWallet,
                          style: textStyleWhite_22,
                        )),
                    Container(
                        margin: EdgeInsets.fromLTRB(5, 30, 0, 0),
                        child: Text(
                          "≈$bitDollor CNY",
                          style: textStyleWhite_13,
                        )),
                  ],
                )
              ],
            ),
          ),
          Container()
        ],
      ),
    );
  }

  @override
  void initState() {
     getWalletBalance(GloabVar.memid).then((onValue) {
      if (mounted) {
        setState(() {
          if (onValue != null) {
            print("xx12");
            if (onValue.bitrmb != null) bitDollor = onValue.bitrmb;
            print("xx13");
            if (onValue.bitwallet != null) bitWallet = onValue.bitwallet;
            print("xx14");
            if (onValue.memwallet != null) memWallet = onValue.memwallet;
            print("xx15");
          }
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ComMomBar(title: "钱包余额"),
        body: Container(
            child: Column(
          children: <Widget>[walletPannel(), raisedButton(context)],
        )));
  }
}
