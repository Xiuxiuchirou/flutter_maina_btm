import 'package:flui/flui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mai_na/config/style_config.dart';
import 'package:flutter_mai_na/models/gloabalVar.dart';
import 'package:flutter_mai_na/models/viewModel.dart';
import 'package:flutter_mai_na/service/webdata_service.dart';
import 'package:flutter_mai_na/widgets/bar/common_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MemWithDrawInfoPage extends StatefulWidget {
  @override
  _MemWithDrawInfoPageState createState() => _MemWithDrawInfoPageState();
}

class _MemWithDrawInfoPageState extends State<MemWithDrawInfoPage> {
  Widget stateBar(String all, String online, String offline, String invalid) {
    return Container(
      height: ScreenUtil().setHeight(220),
      margin: EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Container(
                // decoration:
                //     BoxDecoration(color: Colors.orange, border: Border()),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Text(
                        "全部",
                        style: textStyleWhite_15,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: Text(
                        all,
                        style: textStyleWhite_15,
                      ),
                    )
                  ],
                ),
              )),
          SizedBox(
            width: 1,
            height: ScreenUtil().setHeight(160),
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.white),
            ),
          ),
          Expanded(
              flex: 1,
              child: Container(
                // decoration:
                //     BoxDecoration(color: Colors.orange, border: Border()),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Text(
                        "在线",
                        style: textStyleWhite_15,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: Text(
                        online,
                        style: textStyleWhite_15,
                      ),
                    )
                  ],
                ),
              )),
          SizedBox(
            width: 1,
            height: ScreenUtil().setHeight(160),
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.white),
            ),
          ),
          Expanded(
              flex: 1,
              child: Container(
                // decoration:
                //     BoxDecoration(color: Colors.orange, border: Border()),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Text(
                        "离线",
                        style: textStyleWhite_15,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: Text(
                        offline,
                        style: textStyleWhite_15,
                      ),
                    )
                  ],
                ),
              )),
          SizedBox(
            width: 1,
            height: ScreenUtil().setHeight(160),
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.white),
            ),
          ),
          Expanded(
              flex: 1,
              child: Container(
                // decoration:
                //     BoxDecoration(color: Colors.orange, border: Border()),

                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Text(
                        "失效",
                        style: textStyleWhite_15,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: Text(
                        invalid,
                        style: textStyleWhite_15,
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
 
  Widget listViews(List<MemberWithdrawInfoDataItem> mlist) {
    if (mlist == null || mlist.length == 0) {
      return Center(child: Text('暂无数据'));
    } else {
      print("得到数据${mlist.length}");
      return Container(
        padding: EdgeInsets.fromLTRB(10, 5, 0, 10),
        height: ScreenUtil().setHeight(1300),
        child: ListView.builder(
          itemCount: mlist.length,
          itemBuilder: (BuildContext context, int index) {
            return machineListItem(mlist[index].name,mlist[index].mobile,mlist[index].status,mlist[index].inputtime,mlist[index].amount,mlist[index].bcd);
                
          },
        ),
      );
    }
  }
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

  Widget machineListItem(
      String mName, String mobile, String status, String subtime,String amount,String bcd) {
    return Container(
      height: ScreenUtil().setHeight(190),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.all( Radius.circular(3.0))
      ),
      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: Column(
        children: <Widget>[ 
          Container(
            margin: EdgeInsets.only(bottom:8,top: 5),
            child:Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              child: Text(
                mName,
                style: textStyleBlueBold_13,
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Container(
                child: Text(
                  mobile,
                  style: textStyleGrey_13,
                ),
              )), 
                 Expanded(
              flex: 3,
              child: Container(
                child: Text(
                  amount==null?'':amount,
                  style: textStyleOrange_13,
                ),
              )),
        ],
      ),),    
 Row(children: <Widget>[
           Expanded(
              flex: 2,
              child: Container(
                child: Text(
                  bcd,
                  style: textStyleGrey_13,
                ),
              )),
          Expanded(
              flex: 2,
              child: Container(
                child: Text(
                  status,
                  style: textStyleGrey_13,
                ),
              )),
          Expanded(
            flex: 3,
            child: Container(
                child: Text(
              subtime,
              style: textStyleGrey_13,
            )),
          ),
        ],
      ),


        ],
      ),
    );
  }

  Widget memberMachinePannel() {
    return FutureBuilder(
      future: getMemberWithDrawInfo(GloabVar.memid),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          MemberWithdrawInfoData mechineData = snapshot.data as MemberWithdrawInfoData;
 
          return Container(
            child: Column(
              children: <Widget>[
                // stateBar(all, online, offline, invalid),
                // titleBar(),
                listViews(mechineData.mlist),raisedButton(context)
              ],
            ),
          );
        } else {
          return Center(child: Text("提现数据加载中..."));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ComMomBar(
          title: "提现记录",
        ),
        body: Center(child: memberMachinePannel()));
  }
}
