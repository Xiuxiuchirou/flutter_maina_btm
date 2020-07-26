import 'package:flui/flui.dart';
import 'package:flutter/material.dart';
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

class WalletAddressPage extends StatefulWidget {
  @override
  _WalletAddressPageState createState() => _WalletAddressPageState();
}

class _WalletAddressPageState extends State<WalletAddressPage> {
  String strAddress = "";
  //  strAddress=readConfig("index");
  @override
  void initState() {
    super.initState();
    readConfig("member_address").then((v) {
      if (v != null && v.length > 10) {
        setState(() {
          addressController.text = v;
          strAddress = v;
        });
      }
    });
  }

  Widget getAddressPage() {
    return Column();
  }

  Future<String> getAddress() async {
    String result = await readConfig("member_address");
    if (result == null || result.length < 10) {
      //访问API
      MemberAddrData md = await getMemberAddr(GloabVar.memid);
      result = md.address;
    }
    return result;
  }

  Widget getQRCodeImg() {
    return FutureBuilder(
      future: getAddress(),
      builder: (context, snapshot) {
        print("snapshot.dataaa");
        if (snapshot.hasData) {
          print("snapshot.dataaa");
          print(snapshot.data);
          String address = snapshot.data as String;
          if (address.length > 10) writeConfig("member_address", address);
          return Container(
            margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: QrImage(
              data: address,
              size: 200.0,
            ),
          );
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
        child:
            // strAddress.length > 0
            //     ? Container(
            //         child: Text(
            //           strAddress,
            //           style: textStyleBlueBold_13,
            //           textAlign: TextAlign.center,
            //         ),
            //       )
            //     :
            TextField(
          maxLines: 2,
          style: textStyleBlueBold_13,
          controller: addressController,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.add_to_home_screen,
              color: Colors.orange,
            ),
            filled: true,
            hintText: '点击修改钱包地址',
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
          '      保 存      ',
          style: textStyleBold_16,
        ),
        colors: [Colors.deepOrange, Colors.orange],
        onPressed: () async {
          print("保存");
          String address = addressController.text.trim();
          if (address.length < 10) {
            Fluttertoast.showToast(
                msg: "地址格式错误",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 2,
                textColor: Colors.white,
                fontSize: 14.0);
            return;
          }

          postCommitMemberAddr(GloabVar.memid, address).then((v) {
            print("postCommitMemberAddr完成");
            print(v.resultmsg);
            if (v.resultmsg == "SUCCESS") {
              writeConfig("member_address", address);
              Fluttertoast.showToast(
                  msg: "保存成功",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
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
        appBar: ComMomBar(title: "钱包地址"),
        body: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[getQRCodeImg(), addressText(), raisedButton()],
        )));
  }
}
