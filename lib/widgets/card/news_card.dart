import 'package:flutter/material.dart';
import 'package:flutter_mai_na/common/common_check.dart';
import 'package:flutter_mai_na/common/win_media.dart';
import 'package:flutter_mai_na/models/viewModel.dart';
import 'package:flutter_mai_na/pages/_2price_page.dart';
import 'package:flutter_mai_na/widgets/webview_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nav_router/nav_router.dart';

class NewsCard extends StatelessWidget {
  final NewslistItem model;
  final EdgeInsetsGeometry padding;
  final bool isNew;

  NewsCard(
    this.model, {
    @required this.padding,
    this.isNew = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1, color: Colors.grey[200]))),
      // padding: padding,
      alignment: Alignment.centerLeft,
      width: winWidth(context),
      height: ScreenUtil().setHeight(300),
      child: new FlatButton(
          onPressed: () {
            print("跳转URL${model.url}");
            routePush(
                new WebViewPage(
                    model?.url ?? 'https://m.bitmixc.com/information/bw/',
                    '${model?.title ?? '未知'}'),
                RouterType.scaleRotate);
          },
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child: Row(
            children: <Widget>[
              Container(
                width: winWidth(context) - ScreenUtil().setWidth(360),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        new Visibility(
                          visible: isNew,
                          child: new Container(
                            decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0))),
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 3.0, vertical: 2),
                            margin: EdgeInsets.only(right: 5.0),
                            child: new Text(
                              '最新',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        new SizedBox(
                          width: isNew
                              ? ScreenUtil().setWidth(600)
                              : ScreenUtil().setWidth(670),
                          child: new Text(
                            '${model?.title ?? '未知'}',
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.w300),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                    new Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: new Text(
                        '${model?.text ?? '未知'}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Color(0xff999999),
                            fontSize: ScreenUtil().setSp(40)),
                      ),
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text(
                          '${model?.editor ?? '未知'}',
                          style: TextStyle(
                              color: Color(0xff999999),
                              fontSize: ScreenUtil().setSp(40)),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 10),
                          child: Text(
                            '${model?.date ?? '未知'}',
                            style: TextStyle(
                                color: Color(0xff999999),
                                fontSize: ScreenUtil().setSp(40)),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: 100,
                height: 70,
                child: Image.network(
                  model
                      .imgsrc, //http://www.chinabite.com/access/images/noneImg.png
                  fit: BoxFit.cover,
                ),
              )
            ],
          )),
    );
  }
}
