import 'package:flutter/material.dart';
import 'package:flutter_mai_na/common/win_media.dart';
import 'package:flutter_mai_na/config/const_config.dart';
import 'common_ui.dart';

class LoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      width: winWidth(context),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new CircularProgressIndicator(),
          new Space(),
          new Text(
            '加载中',
            style: TextStyle(color: mainTextColor),
          ),
        ],
      ),
    );
  }
}
