import 'package:flutter/material.dart';
import 'package:flutter_mai_na/common/win_media.dart';
import 'package:flutter_mai_na/models/viewModel.dart';
import 'package:flutter_mai_na/pages/_6webview_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nav_router/nav_router.dart';

import '../webview_page.dart';

class PriceCard extends StatelessWidget {
  final CurrencylistItem model;
  PriceCard(this.model);
  Widget rateCard() {
    return Container(
      width: 80,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: model.rate.startsWith("-") ? Colors.red : Colors.green),
      child: Text(model.rate,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1, color: Colors.grey[200]))),
      alignment: Alignment.centerLeft,
      width: winWidth(context),
      height: 50, //ScreenUtil().setHeight(200),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(left: 20, top: 10),
                      child: Container(
                          // child: InkWell(
                          //     onTap: () {
                          //       print(model.memo);
                          //       routePush(new WebViewPage(
                          //           model.memo, model.name.toUpperCase()));
                          //       // routePush(WebDetails(
                          //       //     'https://m.huobi.io/zh-cn/market/chart/?s=${model.name}_usdt'));
                          //     },
                          child: Row(
                        children: <Widget>[
                          InkWell(
                            child: Text(model.name.toUpperCase()),
                            onTap: () {
                              routePush(new WebViewPage(
                                  model.memo, model.name.toUpperCase()));
                            },
                          ),
                          Text(
                            " /USDT",
                            style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 8,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ))
                      // ),
                      ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                      padding: EdgeInsets.only(
                        left: 20,
                      ),
                      child: Text(
                        "24HVol ${model.vol24}",
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 10,
                            fontWeight: FontWeight.w400),
                      )),
                ],
              ),
            ),
            Expanded(
                child: Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("\$${model.dollor}"),
                        SizedBox(
                          height: 5,
                        ),
                        Text("¥${model.rmb}",
                            style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 10,
                                fontWeight: FontWeight.w400))
                      ],
                    ))),
            Container(
              child: InkWell(
                child: rateCard(),
                onTap: () {
                  routePush(
                      new WebViewPage(model.memo, model.name.toUpperCase()));
                },
              ),
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
      ),
    );
  }
}
