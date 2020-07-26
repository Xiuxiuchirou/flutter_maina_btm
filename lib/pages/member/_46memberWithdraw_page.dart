import 'package:flui/flui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mai_na/config/style_config.dart';
import 'package:flutter_mai_na/models/gloabalVar.dart';
import 'package:flutter_mai_na/models/viewModel.dart';
import 'package:flutter_mai_na/service/webdata_service.dart';
import 'package:flutter_mai_na/widgets/bar/common_bar.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WithDrawPage extends StatefulWidget {
  @override
  _WithDrawPageState createState() => _WithDrawPageState();
}

class _WithDrawPageState extends State<WithDrawPage> {
  String walletBalance = "0.00";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    getWalletBalance(GloabVar.memid).then((v) {
      if (mounted) {
        setState(() {
          if (v == null || v.memwallet == null) {
            walletBalance = "0.0";
          } else
            walletBalance = v.memwallet;
        });
      }
    });
    super.initState();
  }

  restBalancePanel() {
    return Container(
        child: Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(30, 30, 0, 10),
          child: Text("可提现收益:",
              style: TextStyle(fontSize: 16, color: Colors.black)),
        ),
        StatefulBuilder(
          builder: (BuildContext context, setState) {
            return Container(
              margin: EdgeInsets.fromLTRB(10, 30, 10, 10),
              child: Text(
                "¥ $walletBalance",
                style: TextStyle(fontSize: 16, color: Colors.orange),
              ),
            );
          },
        ),
      ],
    ));
  }

  editAmountPannel() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      width: ScreenUtil().setWidth(900),
      child: TextField(
        controller: txtAmountController,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center, //文本对齐方式
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.orange,
        ), //输入文
        decoration: InputDecoration(
          fillColor: Colors.grey.shade100,
          filled: true,
          prefixIcon: Icon(
            Icons.mode_edit,
            color: Colors.blue,
          ),
          hintText: '提现金额',
        ),
      ),
    );
  }

  aliAccountPannel() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Text('提现到支付宝'),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            width: ScreenUtil().setWidth(900),
            child: TextField(
              controller: txtAccAliController,
              textAlign: TextAlign.center, //文本对齐方式
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.orange,
              ), //输入文
              decoration: InputDecoration(
                fillColor: Colors.grey.shade100,
                filled: true,
                prefixIcon: Icon(
                  IconData(0xe60e, fontFamily: "Myicons"),
                  color: Colors.blue,
                ),
                hintText: '支付宝账号',
              ),
            ),
          )
        ],
      ),
    );
  }

  String selectBank = "";
  showPickerIcons(BuildContext context) {
    Picker(
      height: 340,
      itemExtent: 40,
      cancelText: "取消",
      confirmText: "确定",
      adapter: PickerDataAdapter(data: [
        PickerItem(text: Text("中国银行"), value: "中国银行"),
        PickerItem(text: Text("农业银行"), value: "农业银行"),
        PickerItem(text: Text("工商银行"), value: "工商银行"),
        PickerItem(text: Text("建设银行"), value: "建设银行"),
      ]),
      selectedTextStyle: TextStyle(color: Colors.blue),
      onConfirm: (Picker picker, List value) {
        print(picker.getSelectedValues());
        selectBank = picker.getSelectedValues().toString();
        txtAccBankNameController.text = selectBank;

        // selectBank = picker.getSelectedValues().toString();
      },
    ).show(_scaffoldKey.currentState);
  }

  bankAccountPannel() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Text('提现到银行卡'),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: InkWell(
                child: Container(
                  width: ScreenUtil().setWidth(900),
                  child: TextField(
                    controller: txtAccBankNameController,
                    enabled: false,
                    textAlign: TextAlign.center, //文本对齐方式
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.orange,
                    ), //输入文
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      prefixIcon: Icon(
                        Icons.account_balance,
                        color: Colors.blue,
                      ),
                      suffixIcon: Icon(
                        Icons.keyboard_arrow_right,
                      ),
                      hintText: '         银行选择',
                    ),
                  ),
                ),
                onTap: () {
                  showPickerIcons(context);
                },
              )),
          Container(
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            width: ScreenUtil().setWidth(900),
            child: TextField(
              controller: txtAccBankAddressController,
              textAlign: TextAlign.center, //文本对齐方式
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.orange,
              ), //输入文
              decoration: InputDecoration(
                fillColor: Colors.grey.shade100,
                filled: true,
                prefixIcon: Icon(
                  Icons.account_balance,
                  color: Colors.blue,
                ),
                hintText: '填写开户行',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
            width: ScreenUtil().setWidth(900),
            child: TextField(
              controller: txtAccBankAccountController,
              keyboardType: TextInputType.number,
              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
              textAlign: TextAlign.center, //文本对齐方式
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.orange,
              ), //输入文
              decoration: InputDecoration(
                fillColor: Colors.grey.shade100,
                filled: true,
                prefixIcon: Icon(
                  Icons.payment,
                  color: Colors.blue,
                ),
                hintText: '银行卡号',
              ),
            ),
          ),
          Container(
            width: ScreenUtil().setHeight(900),
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text(
              '温馨提示：提现金额将会在您提交申请后24小时内到账(法定休息日和节假日顺延)',
              textAlign: TextAlign.center,
              style: textStyleGrey_13,
            ),
          ),
        ],
      ),
    );
  }

  Widget raisedButton() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 50),
      width: 200,
      child: FLGradientButton.linear(
        textColor: Colors.white,
        child: Text(
          '立即提现',
          style: textStyleBold_16,
        ),
        colors: [Colors.deepOrange, Colors.orange],
        onPressed: () {
          double amount = 0.0;
          amount = double.tryParse(txtAmountController.text.trim());
          if (amount == null || amount <= 0.0) {
            Fluttertoast.showToast(
                msg: "请填写提现金额",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                textColor: Colors.white,
                fontSize: 14.0);
            return;
          }
          String aliAcount = txtAccAliController.text.trim();
          String bankName = txtAccBankNameController.text.trim();
          String bankAddress = txtAccBankAddressController.text.trim();
          String bankAccount = txtAccBankAccountController.text.trim();
          
          if (aliAcount.length > 3) {
            //支付宝账号
            String accountType = "ALI";
            commitWithdrawApp(GloabVar.memid, accountType, aliAcount,
                    amount.toStringAsFixed(4))
                .then((v) {
              if (v.resultmsg == "SUCCESS") {
                //申请成功
                Fluttertoast.showToast(
                    msg: "提交成功",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 2,
                    textColor: Colors.white,
                    fontSize: 14.0);
                txtAccAliController.text = "";
                txtAccBankAccountController.text = "";
                txtAmountController.text = "";
                Future.delayed(Duration(seconds: 2), () {
                  if (Navigator.canPop(context)) {
                    FocusScope.of(context).requestFocus(new FocusNode());
                    Navigator.pop(context);
                  }
                });
              } else {
                Fluttertoast.showToast(
                    msg: "提交失败",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 2,
                    textColor: Colors.white,
                    fontSize: 14.0);
              }
            });

            return;
          } else if (bankName.length > 3) {
            //银行
            String accountType = "BANK";
            commitWithdrawApp(GloabVar.memid, accountType, bankAccount,
                    amount.toStringAsFixed(4),
                    accname: bankAddress, memo: bankAddress)
                .then((v) {
              if (v.resultmsg == "SUCCESS") {
                //申请成功
                Fluttertoast.showToast(
                    msg: "提交成功",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 2,
                    textColor: Colors.white,
                    fontSize: 14.0);
                txtAccAliController.text = "";
                txtAccBankAccountController.text = "";
                txtAmountController.text = "";
              } else {
                Fluttertoast.showToast(
                    msg: "提交失败",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 2,
                    textColor: Colors.white,
                    fontSize: 14.0);
              }
            });
          } else {
            Fluttertoast.showToast(
                msg: "请填写账号信息",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 2,
                textColor: Colors.white,
                fontSize: 14.0);
          }
        },
      ),
    );
  }

  TextEditingController txtAmountController = TextEditingController(); //金额
  TextEditingController txtAccAliController = TextEditingController(); //支付宝账号
  TextEditingController txtAccBankNameController = TextEditingController(); //银行
  TextEditingController txtAccBankAddressController =
      TextEditingController(); //开户行
  TextEditingController txtAccBankAccountController =
      TextEditingController(); //银行卡号
  ScrollController _scrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: ComMomBar(title: "提现申请"),
        body: Center(
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                restBalancePanel(),
                editAmountPannel(),
                aliAccountPannel(),
                bankAccountPannel(),
                raisedButton(),
              ],
            ),
          ),
        ));
  }
}
