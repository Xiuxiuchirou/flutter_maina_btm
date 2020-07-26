import 'package:flutter/material.dart';
import 'package:flutter_mai_na/common/common_check.dart';
import 'package:flutter_mai_na/common/win_media.dart';
import 'package:flutter_mai_na/config/const_config.dart';
import 'package:flutter_mai_na/config/style_config.dart';
import 'package:flutter_mai_na/models/gloabalVar.dart';
import 'package:flutter_mai_na/models/viewModel.dart';
import 'package:flutter_mai_na/service/webdata_service.dart';
import 'package:flutter_mai_na/widgets/bar/common_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookCostPage extends StatefulWidget {
  @override
  _BookCostPageState createState() => _BookCostPageState();
}

class _BookCostPageState extends State<BookCostPage> {
  Widget getIconsBytype(String type) {
    switch (type) {
      case "TX":
        return Icon(
          FontAwesomeIcons.moneyBill,
          color: Colors.redAccent,
        );
        break;
      case "WK":
        return Icon(
          FontAwesomeIcons.connectdevelop,
          color: Colors.blueAccent,
        );
        break;
      case "YJ":
        return Icon(
          FontAwesomeIcons.sitemap,
          color: Colors.redAccent,
        );
        break;
      case "YQ":
        return Icon(
          FontAwesomeIcons.userPlus,
          color: Colors.orange,
        );
        break;
      case "QT":
        return Icon(
          FontAwesomeIcons.compass,
          color: Colors.redAccent,
        );
        break;
    }
    return Icon(
      FontAwesomeIcons.compass,
      color: Colors.redAccent,
    );
  }

  var data;
  @override
  void initState() {
    super.initState();
  }

  String getTypeNameBytype(String type) {
    switch (type) {
      case "TX":
        return "提现";
      case "WK":
        return "挖矿";
      case "QT":
        return "其他";
      case "YQ":
        return "邀请";
      case "YJ":
        return "佣金";
    }
    return "其他";
  }

  Widget balanceBookItemCard(
      String ptype, String memo, double profit, String moditime) {
    return Container(
      width: winWidth(context),
      height: ScreenUtil().setHeight(230),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          //图标
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                decoration: BoxDecoration(
                    // color: Colors.red,
                    ),
                child: getIconsBytype(ptype),
              ),
              //明细
              Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text(
                        getTypeNameBytype(ptype) +
                            (memo.trim().toString().length > 0
                                ? ("-" + memo)
                                : ""),
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ), //明细
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text(
                      moditime,
                      style: textStyleGrey_13,
                    ),
                  ) //时间
                ],
              )),
            ],
          ),

          Container(
            padding: EdgeInsets.only(right: 20),
            child: Text(
                profit > 0
                    ? "+" + profit.toStringAsFixed(2)
                    : profit.toStringAsFixed(2),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
          ),
        ],
      ),
    );
  }

  Widget getBalanceBook() {
//  <List<GoodsPack>>
    return FutureBuilder(
        future: postBookCostList(GloabVar.memid),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            BookcostData bookcostData = snapshot.data as BookcostData;
            if (bookcostData == null ||
                bookcostData.loglist == null ||
                bookcostData.loglist.length == 0)
              return Center(
                child: Text("暂无数据"),
              );
            else
              return Container(
                // padding: EdgeInsets.only(left: 5),
                child: ListView.builder(
                  itemCount: bookcostData.loglist.length,
                  itemBuilder: (BuildContext context, int index) {
                    return balanceBookItemCard(
                      bookcostData.loglist[index].ptype,
                      bookcostData.loglist[index].memo,
                      bookcostData.loglist[index].profit,
                      bookcostData.loglist[index].moditime,
                    );
                  },
                ),
              );
          } else {
            return Text("账单查询中...");
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ComMomBar(title: "收益账单"),
        body: Center(child: getBalanceBook()));
  }
}
