import 'package:flutter/material.dart';
import 'package:flutter_mai_na/config/style_config.dart';
import 'package:flutter_mai_na/widgets/bar/common_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key key}) : super(key: key);

  Widget getCompanyCard() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
      color: Colors.white,
      height: ScreenUtil().setHeight(270),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(5, 5, 0, 5),
            width: ScreenUtil().setWidth(240),
            height: ScreenUtil().setHeight(240),
            // decoration: BoxDecoration(color: Colors.orange),
            child: Image.asset(
              "assets/login_logo.png",
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  // padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                  child:
                      Text("浙江迈钠信息技术服务有限公司(BTM)", style: textStyleBlackBold_22),
                ),
                Container(
                  // padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                  child: Text(
                    "超算技术服务商",
                    style: textStyleGrey_15,
                  ),
                ),
                Container(
                  // padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: Text(
                    "浙江  舟山",
                    style: textStyleGrey_15,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget gemCompanyDescribText() {
    return Container(
      height: ScreenUtil().setHeight(1286),
      color: Colors.white,
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(5, 3, 0, 5),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 1, color: Colors.grey))),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.assignment,
                  color: Colors.orange,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text("公司介绍"),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: Text(
              '''       BTM是一家运用区块链技术来进行专业的数字货币‘开采’和超算服务器资产管理与技术服务公司。公司主旨将那些希望通过超算服务器来获取主流数字货币的人们聚集在一起，打造一座超级的大算力
        用户通过BTM公司购买超算服务器，来赚取一定的比特币等主流数字货币。省去个人‘挖矿’所带来的超算服务器购买、超算服务器场地建设、托管场地的电力供应、托管场地的噪音和降温处理、超算服务器日常运行和维护等一系列繁琐问题。
        现在您只需要向BTM公司订购超算服务器，即可开启您的数字货币‘挖矿’之旅!''',
              style: textStyleGrey_15,
              strutStyle:
                  StrutStyle(forceStrutHeight: true, height: 1.7, leading: 0.5),
            ),
          )
        ],
      ),
    );
  }

  Widget gemCompanyDescribView() {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Column(
        children: <Widget>[
          //公司信息
          Container(
            padding: EdgeInsets.fromLTRB(5, 3, 0, 5),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 1, color: Colors.grey))),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.account_balance,
                  color: Colors.blue,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text("公司信息"),
                )
              ],
            ),
          ),

          //公司全称
          Container(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Row(
              children: <Widget>[
                Container(
                  child: Text(
                    '公司全称:',
                    style: TextStyle(
                        color: Colors.black, fontSize: ScreenUtil().setSp(45)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text('浙江迈钠信息技术服务有限公司(BTM)',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: ScreenUtil().setSp(45))),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Row(
              children: <Widget>[
                Container(
                  child: Text(
                    '公司规模:',
                    style: TextStyle(
                        color: Colors.black, fontSize: ScreenUtil().setSp(45)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text('50-100 人',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: ScreenUtil().setSp(45))),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Row(
              children: <Widget>[
                Container(
                  child: Text(
                    '公司网站:',
                    style: TextStyle(
                        color: Colors.black, fontSize: ScreenUtil().setSp(45)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text('https://www.cloudpool.com/',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: ScreenUtil().setSp(45))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ComMomBar(
          title: "关于我们",
        ),
        body: Container(
            child: Column(
          children: <Widget>[
            getCompanyCard(),
            gemCompanyDescribText(),
            // gemCompanyDescribView()
          ],
        )));
  }
}
