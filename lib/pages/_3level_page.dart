import 'package:flutter/material.dart';
import 'package:flutter_mai_na/config/const_config.dart';
import 'package:flutter_mai_na/models/viewModel.dart';
import 'package:flutter_mai_na/service/webdata_service.dart';
import 'package:flutter_mai_na/widgets/bar/common_bar.dart';
import 'package:flutter_mai_na/widgets/card/level_card.dart';

class LevelPage extends StatefulWidget {
  @override
  _LevelPageState createState() => _LevelPageState();
}

int sumMember = 0;

class _LevelPageState extends State<LevelPage> {
  Widget getProfit() {
//  <List<GoodsPack>>
    return FutureBuilder(
        future: getProfitByType("YQ"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            ProfitSumData profitData = snapshot.data as ProfitSumData;
            String amount =
                profitData.amount == null ? "0.0" : profitData.amount;
            String summember =
                profitData.summember == null ? "0.0" : profitData.summember;
            print(
                "summemberX$summember  profitData.summember${profitData.summember}");
            return Container(
              padding: EdgeInsets.only(left: 5),
              child: Row(
                children: <Widget>[
                  headerDecoration(summember),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.monetization_on,
                    color: Colors.orange,
                  ),
                  Text(
                    "推广收益:",
                    style: mainTextStyle,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    amount,
                    style: TextStyle(fontSize: 16, color: Colors.red[500]),
                  ),
                ],
              ),
            );
          } else {
            return Text("收益查询中...");
          }
        });
  }

  Widget headerDecoration(String summember) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.group,
            color: Colors.orange,
          ),
          Text(
            '我的邀请${summember} 人',
            style: mainTextStyle,
          )
        ],
      ),
    );
  }

  Widget headerTitleBar() {
    return Container(
      // decoration: BoxDecoration(
      //     border: Border(bottom: BorderSide(width: 1, color: Colors.grey))),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              '会员ID',
              textAlign: TextAlign.center,
              style: mainTextStyle,
            ),
            flex: 3,
          ),
          Expanded(
            child: Text(
              '会员人数',
              textAlign: TextAlign.center,
              style: mainTextStyle,
            ),
            flex: 2,
          ),
          Expanded(
            child: Text(
              '购机金额',
              textAlign: TextAlign.center,
              style: mainTextStyle,
            ),
            flex: 3,
          ),
        ],
      ),
    );
  }

  ScrollController _scrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ComMomBar(
          title: "我的B圈",
        ),
        body: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                  child: Row(
                    children: <Widget>[
                      getProfit(),
                    ],
                  ),
                ),
                headerTitleBar(),
                SingleChildScrollView(
                    controller: _scrollController,
                    child: Container(
                      height: 350,
                      child: MyGroup(),
                    )),
              ],
            ),
          ),
        ));
  }
}
