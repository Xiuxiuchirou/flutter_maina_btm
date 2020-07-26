import 'package:flutter/material.dart';
import 'package:flutter_mai_na/config/style_config.dart';
import 'package:flutter_mai_na/models/gloabalVar.dart';
import 'package:flutter_mai_na/models/viewModel.dart';
import 'package:flutter_mai_na/service/webdata_service.dart';
import 'package:flutter_mai_na/widgets/bar/common_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MemMachinePage extends StatefulWidget {
  @override
  _MemMachinePageState createState() => _MemMachinePageState();
}

class _MemMachinePageState extends State<MemMachinePage> {
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

  Widget titleBar() {
    return Container(
        margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
        height: ScreenUtil().setHeight(150),
        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(width: 0.5, color: Colors.grey),
                bottom: BorderSide(width: 0.5, color: Colors.grey))),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Text(
                  '矿工',
                  style: textStyleGrey_15,
                ),
              ),
              flex: 1,
            ),
            Expanded(
              child: Container(
                child: Text(
                  '实时算力',
                  style: textStyleGrey_15,
                ),
              ),
              flex: 1,
            ),
            Expanded(
              child: Container(
                child: Text(
                  '24H算力',
                  style: textStyleGrey_15,
                ),
              ),
              flex: 1,
            ),
            Expanded(
              child: Container(
                child: Text(
                  '提交时间',
                  style: textStyleGrey_15,
                ),
              ),
              flex: 1,
            ),
          ],
        ));
  }

  Widget listViews(List<MlistItem> mlist) {
    if (mlist == null || mlist.length == 0) {
      return Center(child: Text('暂无矿机'));
    } else {
      print("得到数据${mlist.length}");
      return Container(
        padding: EdgeInsets.fromLTRB(10, 5, 0, 10),
        height: ScreenUtil().setHeight(1200),
        child: ListView.builder(
          itemCount: mlist.length,
          itemBuilder: (BuildContext context, int index) {
            return machineListItem(
                mlist[index].name,
                mlist[index].computcalcNow,
                mlist[index].computcalc24,
                mlist[index].subtime);
          },
        ),
      );
    }
  }

  Widget machineListItem(
      String mName, String calcCur, String calc24, String subtime) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 3,
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
                  calcCur,
                  style: textStyleGrey_13,
                ),
              )),
          Expanded(
              flex: 2,
              child: Container(
                child: Text(
                  calc24,
                  style: textStyleGrey_13,
                ),
              )),
          Expanded(
            flex: 4,
            child: Container(
                child: Text(
              subtime,
              style: textStyleGrey_13,
            )),
          ),
        ],
      ),
    );
  }

  Widget memberMachinePannel() {
    return FutureBuilder(
      future: getMemberMachine(GloabVar.memid),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          MemMachinesData mechineData = snapshot.data as MemMachinesData;
          String status = mechineData.mstate;
          List<String> strArr = status.split('|');
          String all = "0", online = "0", offline = "0", invalid = "0";
          if (strArr != null && strArr.length == 4) {
            all = strArr[0];
            online = strArr[1];
            offline = strArr[2];
            invalid = strArr[3];
          }
          return Container(
            child: Column(
              children: <Widget>[
                stateBar(all, online, offline, invalid),
                titleBar(),
                listViews(mechineData.mlist)
              ],
            ),
          );
        } else {
          return Center(child: Text("矿机数据加载中..."));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ComMomBar(
          title: "我的矿机",
        ),
        body: Center(child: memberMachinePannel()));
  }
}
