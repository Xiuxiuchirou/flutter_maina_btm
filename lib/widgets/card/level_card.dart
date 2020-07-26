import 'package:flutter/material.dart';
import 'package:flutter_mai_na/config/const_config.dart';
import 'package:flutter_mai_na/models/gloabalVar.dart';
import 'package:flutter_mai_na/models/viewModel.dart';
import 'package:flutter_mai_na/service/webdata_service.dart';
import 'package:shimmer/shimmer.dart';

class MyGroup extends StatefulWidget {
  @override
  _MyGroupState createState() => _MyGroupState();
}

class _MyGroupState extends State<MyGroup> with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;
  List<Widget> listExpansion(String memid) {
    List<Widget> list = [];

    FutureBuilder(
        future: getLowerMemberList(memid),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            LowerMemberData lowerData = snapshot.data as LowerMemberData;
            List<LowerMemberItem> memberList = lowerData.memberlist;

            if (lowerData == null || lowerData.memberlist == null) {
              return Center(
                child: Text("暂无数据..."),
              );
            }
            return ListView.builder(
              itemCount: memberList.length,
              itemBuilder: (BuildContext context, int index) {
                return ExpansionTile(
                    title: Text('${memberList[index].memid}'),
                    backgroundColor: Colors.blueAccent.withOpacity(0.1),
                    initiallyExpanded: true,
                    leading: Icon(
                      Icons.whatshot,
                      color: Colors.redAccent,
                    ),
                    children: <Widget>[]);
              },
            );
          } else {
            return Text("收益查询中...");
          }
        });
    return list;
  }

//二级
  Widget buildMyExpansionTile2(String title) {
    return ExpansionTile(
        title: const Text('Sublist'),
        leading: Icon(
          Icons.whatshot,
          color: Colors.deepPurpleAccent,
        ),
        backgroundColor: Theme.of(context).accentColor.withOpacity(0.025),
        children: const <Widget>[
          ListTile(title: Text('3One')),
          ListTile(title: Text('3Two')),
          ListTile(title: Text('3Free')),
          ListTile(title: Text('3Four'))
        ]);
  }

  bool hasLoad = false;
  var list1;
  @override
  void initState() {
    print(hasLoad);
    print(hasLoad);
    print(hasLoad);
    print(hasLoad);
    super.initState();
  }

  Widget _rowDataWidget(String memid, String memcount, String busisum) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('${memid}'),
        Text('${memcount}'),
        Text('${busisum}'),
      ],
    );
  }

  Widget _listExpansion1(String memid) {
    List<Widget> listChildren = [];
    bool hasloadChild = true;
    return FutureBuilder(
        future: getLowerMemberList(memid),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            LowerMemberData lowerData = snapshot.data as LowerMemberData;
            List<LowerMemberItem> memberList = lowerData.memberlist;
            // list.clear();
            if (lowerData == null || lowerData.memberlist == null) {
              return Center(
                child: Text("暂无数据..."),
              );
            }
            return ListView.builder(
              itemCount: memberList.length,
              itemBuilder: (BuildContext context, int index) {
                return StatefulBuilder(
                  builder: (BuildContext context, setState) {
                    return ExpansionTile(
                        initiallyExpanded: false,
                        title: InkWell(
                          child: _rowDataWidget(
                              memberList[index].memid,
                              memberList[index].memcount,
                              memberList[index].busisum),
                          onTap: () {
                            print("触发tap");
                          },
                        ),
                        onExpansionChanged: (isExpand) {
                          print('isExpand====$isExpand');
                          if (isExpand && hasloadChild) {
                            hasloadChild = true;
                            listChildren.clear();
                            setState(() {
                              listChildren.add(
                                  _listExpansion2(memberList[index].memid));
                            });
                          }
                        },
                        backgroundColor: Colors.blueAccent.withOpacity(0.1),
                        leading: Shimmer.fromColors(
                          baseColor: Colors.redAccent,
                          highlightColor: Colors.yellowAccent,
                          child: Icon(
                            Icons.whatshot,
                          ),
                        ),
                        children: listChildren);
                  },
                );
              },
            );
          } else {
            return Text("查询中...");
          }
        });
  }

  Widget _listExpansion2(String memid) {
    return FutureBuilder(
        future: getLowerMemberList(memid),
        builder: (context, snapshot) {
          List<Widget> listwX = [];
          List<Widget> listChildren = [];
          if (snapshot.hasData) {
            LowerMemberData lowerData = snapshot.data as LowerMemberData;
            List<LowerMemberItem> memberList = lowerData.memberlist;
            if (lowerData == null || lowerData.memberlist == null) {
              return Center(
                child: Text("暂无数据..."),
              );
            }
            for (int i = 0; i < memberList.length; i++) {
              listwX.add(
                  StatefulBuilder(builder: (BuildContext context, setState) {
                return ExpansionTile(
                  children: listChildren,
                  onExpansionChanged: (isExpand) {
                    if (isExpand) {
                      listChildren.clear();
                      setState(() {
                        listChildren.add(_listExpansion33(memberList[i].memid));
                      });
                    }
                  },
                  initiallyExpanded: false,
                  title: InkWell(
                    child: _rowDataWidget(memberList[i].memid,
                        memberList[i].memcount, memberList[i].busisum),
                    onTap: () {
                      print("触发tap");
                    },
                  ),
                  backgroundColor: Colors.blueAccent.withOpacity(0.1),
                  leading: Icon(
                    Icons.whatshot,
                    color: Colors.green,
                  ),
                );
              }));
            }
            return Column(
              children: listwX,
            );
          } else {
            return Text("查询中...");
          }
        });
  }

  //三级标签
  Widget _listExpansion33(String memid) {
    return FutureBuilder(
        future: getLowerMemberList(memid),
        builder: (context, snapshot) {
          List<Widget> listwX = [];
          if (snapshot.hasData) {
            LowerMemberData lowerData = snapshot.data as LowerMemberData;
            List<LowerMemberItem> memberList = lowerData.memberlist;
            if (lowerData == null || lowerData.memberlist == null) {
              return Center(
                child: Text("暂无数据..."),
              );
            }
            for (int i = 0; i < memberList.length; i++) {
              listwX.add(
                ListTile(
                  leading: Icon(
                    Icons.whatshot,
                    color: Colors.deepPurpleAccent,
                  ),
                  title: _rowDataWidget(memberList[i].memid,
                      memberList[i].memcount, memberList[i].busisum),
                ),
              );
            }
            return Column(
              children: listwX,
            );
          } else {
            return Text("查询中...");
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _listExpansion1(GloabVar.memid),
      ),
    );
  }
}
