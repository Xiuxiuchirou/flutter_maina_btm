 

import 'dart:io';
import 'package:flui/flui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mai_na/common/OssUtil.dart';
import 'package:flutter_mai_na/common/fileIO.dart'    ;
import 'package:flutter_mai_na/config/style_config.dart';
import 'package:flutter_mai_na/models/gloabalVar.dart';
import 'package:flutter_mai_na/service/webdata_service.dart';
import 'package:flutter_mai_na/widgets/bar/common_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImagePickerPage extends StatefulWidget {
  ImagePickerPage({Key key}) : super(key: key);

  _ImagePickerPageState createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  //记录选择的照片
    File _imageA;
    File _imageB;
  //当图片上传成功后，记录当前上传的图片在服务器中的位置
  String _imgServerPath;
  bool hasIDA = false;
  bool hasIDB = false;
  Future _hasImageFromNet() async {
    var imageName = await readConfig('IDA');
    if (imageName != null && imageName != '') {
      setState(() {
        hasIDA = true;
      });
    }
    var imageNameB = await readConfig('IDB');
    if (imageNameB != null && imageNameB != '') {
      setState(() {
        hasIDB = true;
      });
    }

    return '';
  }

  @override
  void initState() {
    super.initState();
    _hasImageFromNet();
    nameController.text = GloabVar.userName;
  }

  //拍照
  Future _getImageFromCamera() async {
    var image =
        await ImagePicker.pickImage(source: ImageSource.camera, maxWidth: 400);

    setState(() {
      _imageA = image;
    });
  }

  //相册选择
  Future _getImageFromGallery(String aorb) async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (aorb == "A")
        _imageA = image;
      else
        _imageB = image;
    });
  }

  Widget idCardAddB() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      width: ScreenUtil().setWidth(700),
      height: ScreenUtil().setHeight(450),
      child: InkWell(
        child:  
         CachedNetworkImage(
            placeholder: (context, url) => Container(
              child:_imageB == null
                ? Container(
                    child: Icon(
                        IconData(
                          0xe600,
                          fontFamily: "Myicons",
                        ),
                        size: 150,
                        color: Colors.grey),
                  )
                : Image.file(
                    _imageB,
                    fit: BoxFit.cover,
                  ),
            ),
                imageUrl: 'https://pos-new-test.oss-cn-hangzhou.aliyuncs.com/IDB' +
                    GloabVar.memid +
                    '.jpg',
              ),  
        onTap: () {
          _getImageFromGallery("B");
        },
      ),
    );
  }
 


  Widget idCardAddA() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 30, 0, 20),
      width: ScreenUtil().setWidth(700),
      height: ScreenUtil().setHeight(450),
      child: InkWell(
        child: Container(
          child:  
          CachedNetworkImage(
            placeholder: (context, url) => Container(
              child: (_imageA == null
                  ? Container(
                      child: Icon(
                          IconData(
                            0xe611,
                            fontFamily: "Myicons",
                          ),
                          size: 140,
                          color: Colors.grey),
                    )
                  : Image.file(
                      _imageA,
                      fit: BoxFit.cover,
                    )),
            ),
                imageUrl: 'https://pos-new-test.oss-cn-hangzhou.aliyuncs.com/IDA' +
                      GloabVar.memid +
                      '.jpg',
              ), 
         ),
        onTap: () {
          _getImageFromGallery("A");
        },
      ),
    );
  }

  Widget tips() {
    return Container();
  }

  TextEditingController nameController = TextEditingController();
  FocusNode nodeAddress = FocusNode();
  Widget raisedButton() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
      width: 200,
      child: FLGradientButton.linear(
        textColor: Colors.white,
        child: Text(
          '保 存',
          style: textStyleBold_16,
        ),
        colors: [Colors.deepOrange, Colors.orange],
        onPressed: () async {
          print("上传信息");
          String name = nameController.text.trim();
          if (name.length < 2) {
            Fluttertoast.showToast(
                msg: "请填写姓名",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 2,
                textColor: Colors.white,
                fontSize: 14.0);
            return;
          }
          postCommitMemberName(GloabVar.memid, name).then((v) {
            print("postCommitMemberName");
            print(v.resultmsg);
            if (v.resultmsg == "SUCCESS") {
              writeConfig("username", name);
              GloabVar.userName = name;
              Fluttertoast.showToast(
                  msg: "会员信息更新成功",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          });
          if (_imageA == null || _imageB == null) {
            // Fluttertoast.showToast(
            //     msg: "请上传身份证图片",
            //     toastLength: Toast.LENGTH_SHORT,
            //     gravity: ToastGravity.CENTER,
            //     timeInSecForIosWeb: 2,
            //     textColor: Colors.white,
            //     fontSize: 14.0);
            return;
          }
          uploadDataToOss(_imageA, "IDA" + GloabVar.memid + ".jpg");
          writeConfig("IDA", "IDA" + GloabVar.memid + ".jpg");
          uploadDataToOss(_imageB, "IDB" + GloabVar.memid + ".jpg");
          writeConfig("IDB", "IDB" + GloabVar.memid + ".jpg");
        },
      ),
    );
  }

  Widget nameText() {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
        width: ScreenUtil().setWidth(600),
        child: TextField(
          controller: nameController,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.person,
              color: Colors.orange,
            ),
            filled: true,
            hintText: '您的姓名',
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: ComMomBar(title: "信息修改"),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[ nameText(),
            idCardAddA(),
            idCardAddB(),
            // RaisedButton(
            //   onPressed: () {
            //     _getImageFromCamera();
            //   },
            //   child: Text("照相机"),
            // ),
            SizedBox(height: 20),
           
            raisedButton(),

            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
