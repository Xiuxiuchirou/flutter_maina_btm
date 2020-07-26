import 'package:flui/flui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mai_na/common/fileIO.dart';
import 'package:flutter_mai_na/config/style_config.dart';
import 'package:flutter_mai_na/models/gloabalVar.dart';
import 'package:flutter_mai_na/models/viewModel.dart';
import 'package:flutter_mai_na/service/webdata_service.dart';
import 'package:flutter_mai_na/widgets/bar/common_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MemberCodePage extends StatefulWidget {
  @override
  _MemberCodePageState createState() => _MemberCodePageState();
}

class _MemberCodePageState extends State<MemberCodePage> {
  String strAddress = "";
  //  strAddress=readConfig("index");
  @override
  void initState() {
    super.initState();
  }

  String curCode;

  Widget getQRCodeImg() {
    return FutureBuilder(
      future: getMemberCode(GloabVar.memid),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print(GloabVar.memid);
          MemCodeData memcodeData = snapshot.data as MemCodeData;
          String memcode = memcodeData.memcode;
          print(memcode);
          curCode = memcode;
          addressController.text = memcode;
          if (memcode.length > 0) {
            return Container(
              margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: QrImage(
                data: curCode,
                size: 200.0,
              ),
            );
          } else {
            return Container(
                margin: EdgeInsets.fromLTRB(0, 50, 0, 0), child: Text("生成失败"));
          }
        } else {
          return Container(
              margin: EdgeInsets.fromLTRB(0, 50, 0, 0), child: Text("暂无数据"));
        }
      },
    );
  }

  Widget addressText() {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
        width: ScreenUtil().setWidth(800),
        child: TextField(
          style: textStyleBlueBold_13,
          controller: addressController,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                Icons.content_copy,
                color: Colors.orange,
              ),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: addressController.text));
                Fluttertoast.showToast(
                    msg: "复制成功",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    textColor: Colors.white,
                    fontSize: 14.0);
              },
            ),
            filled: true,
          ),
        ));
  }

  Widget raisedButton() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
      width: 200,
      child: FLGradientButton.linear(
        textColor: Colors.white,
        child: Text(
          '生成邀请码',
          style: textStyleBold_16,
        ),
        colors: [Colors.deepOrange, Colors.orange],
        onPressed: () async {
          getMemberCode(GloabVar.memid).then((v) {
            print("getMemberCode");
            print(v.memcode);
            addressController.text = v.memcode;
            setState(() {
              if(mounted)
              curCode = v.memcode;
            });
          });
        },
      ),
    );
  }

  TextEditingController addressController = TextEditingController();
  FocusNode nodeAddress = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ComMomBar(title: "邀请好友"),
        body: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[getQRCodeImg(), addressText(), raisedButton()],
        )));
  }
}
