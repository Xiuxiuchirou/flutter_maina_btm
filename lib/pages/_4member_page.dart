import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mai_na/common/fileIO.dart';
import 'package:flutter_mai_na/common/win_media.dart';
import 'package:flutter_mai_na/config/const_config.dart';
import 'package:flutter_mai_na/models/gloabalVar.dart';
import 'package:flutter_mai_na/pages/_5login_page.dart';
import 'package:flutter_mai_na/pages/member/_49about_page.dart';
import 'package:flutter_mai_na/service/webdata_service.dart';
import 'package:flutter_mai_na/widgets/webview_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nav_router/nav_router.dart';
import 'package:shimmer/shimmer.dart';

import 'member/_40memberInfo_page.dart';
import 'member/_41contract_page.dart';
import 'member/_42walletaddress_page.dart';
import 'member/_43bookcost_page.dart';
import 'member/_44walletbalance_page.dart';
import 'member/_45membercode_page.dart';
import 'member/_46memberWithdraw_page.dart';
import 'member/_47transWallet_page.dart';
import 'member/_48memmachine_page.dart';
import 'member/_491memberWithdrawData.dart';

class MemberPage extends StatefulWidget {
  @override
  _MemberPage createState() => new _MemberPage();
}

class _MemberPage extends State {
  Widget buildHeaderBox() {
    return Container(
      decoration: new BoxDecoration(
        gradient: const LinearGradient(
            colors: [Colors.black54, Colors.black87, Colors.black54]),
        // border: Border.all(width: 5.0, color: Colors.green),
      ),
      padding: EdgeInsets.fromLTRB(15, 13, 20, 20),
      width: winWidth(context),
      height: 130,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(19)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(56.0),
                  child: Icon(
                    Icons.account_circle,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 18),
                child: InkWell(
                    child: Shimmer.fromColors(
                      period: Duration(milliseconds: 3000),
                      baseColor: Colors.white,
                      highlightColor: Colors.white54,
                      child: Text(
                        "迈钠科技-" + GloabVar.userName,
                        style: mainWhiteTextStyle,
                      ),
                    ),
                    onTap: () {
                      navigateByFunc("MEMNAME");
                    }),
              ),
              Container(
                  margin: EdgeInsets.only(left: 40),
                  child: IconButton(
                      onPressed: () {
                        navigateByFunc("MEMNAME");
                      },
                      icon: Icon(
                        Icons.settings,
                        color: Colors.grey,
                      )))
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 8, top: 18),
            child: Text(
              "注册时间 ${GloabVar.regTime}",
              style: subWhiteTextStyle,
            ),
          )
        ],
      ),
    );
  }

  navigateByFunc(String funcName) {
    switch (funcName) {
      case "MEMNAME":
        routePush(
          ImagePickerPage(),
        );
        break;
      case "BOOKCOST":
        print('BOOKCOST');
        routePush(
          BookCostPage(),
        );
        break;
      case "WALLETADDR":
        routePush(WalletAddressPage());
        break;
      case "WALLETBALANCE":
        routePush(WalletBalance());
        break;
      case "MEMBERCODE":
        routePush(MemberCodePage());
        break;
      case "MEMCONTRACT":
        routePush(ContractPage());
        break;
      case "WITHDRAWAPP":
        routePush(WithDrawPage());
        break;
      case "TRANSAPP":
        routePush(TransAppPage());
        break;
      case "MEMMACHINE":
        routePush(MemMachinePage());
        break;
      case "ABOUT":
        routePush(AboutPage());
        break;
      case"WITH_INFO":
      routePush(MemWithDrawInfoPage());
      break; 
      case "EXIT":
        GloabVar.memid = "";
        writeConfig('memid', "");
        routePush(LoginPage());
    }
  }

  Widget buildMenuBar(
      String menuName, String dealFunc, IconData icon, Color color,
      {bool topMargin = false,bool hide=false,String sTag}) {
        if(hide){   print("大厅因"+menuName+sTag.toString());
        return Container();
        }
        else{ 
          print("大厅因"+menuName+sTag.toString());
    return Container(
      padding: EdgeInsets.only(top: topMargin ? 18 : 0),
      child: new Container(
        child: new ListTile(
          leading: Icon(
            icon,
            color: color,
          ),
          trailing:  Icon(Icons.navigate_next, color: Colors.grey), 
          title: new Container(child: Row(children: <Widget>[Text(menuName),sTag==null?Container():
          Container(
            width: 20,
            height: 20,
             margin:  EdgeInsets.only(left:30),
             decoration:   BoxDecoration(color: Colors.red, // 底色
             borderRadius: new BorderRadius.circular((20.0)),    ) ,
            child:
            Center(child:Text(sTag,style: TextStyle(color: Colors.white),)) 
          )],)) ,
          onTap: () {
            navigateByFunc(dealFunc);
          },
        ),
        color: Colors.white,
        height: 50.0,
      ),
      color: Colors.grey[200],
    );}
  }
  @override
  void initState() { 
    getMemberWithDrawInfo(GloabVar.memid).then((onValue) {
      if (mounted) {
        setState(() {
          if (onValue != null) {
          if(onValue.mlist!=null&&onValue.mlist.length>0)
          { 
               withDrawTag="${onValue.mlist.length}";
          } 
          }
        });
      }
    });
    super.initState();
  }
 String withDrawTag;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
       print(GloabVar.memid=="00000024");
    return new Scaffold(
        body: new ListView(
      children: <Widget>[
        buildHeaderBox(),
        // buildMenuBar("协议须知", "MEMCONTRACT",
        //     IconData(0xe6a3, fontFamily: "Myicons"), Colors.deepOrange,
        //     topMargin: true),
        buildMenuBar(
          "钱包地址",
          "WALLETADDR",
          Icons.account_balance_wallet,
          Colors.blueAccent,
        ),

        buildMenuBar("钱包余额", "WALLETBALANCE",
            IconData(0xe644, fontFamily: "Myicons"), Colors.deepOrange),

        //空格
        buildMenuBar("提现申请", "WITHDRAWAPP", Icons.assignment, Colors.blue,
            topMargin: true),
        buildMenuBar(
          "收益账单",
          "BOOKCOST",
          Icons.collections_bookmark,
          Colors.redAccent,
        ),
        buildMenuBar(
          "转账申请",
          "TRANSAPP",
          IconData(0xe79f, fontFamily: "Myicons"),
          Colors.blueAccent,
        ),
        buildMenuBar("邀请好友", "MEMBERCODE", Icons.group_add, Colors.deepOrange),
        buildMenuBar("我的矿机", "MEMMACHINE", Icons.tram, Colors.blue),
        buildMenuBar("关于我们", "ABOUT", Icons.help_outline, Colors.blueGrey),

        buildMenuBar("退出", "EXIT", Icons.exit_to_app, Colors.blueGrey),
     
        buildMenuBar("提现信息", "WITH_INFO", Icons.info, Colors.blueGrey,hide: (GloabVar.memid!="00000024"&&GloabVar.memid!="00000014"),sTag: withDrawTag),
        
      ],
    ));
  }
}
