// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

// class WebDetails extends StatefulWidget {
//   final String sUrl;
//   final String sTitle;
//   WebDetails(this.sUrl, {this.sTitle = ""});

//   @override
//   State<WebDetails> createState() => _WWebDetailsState();
// }

// class _WWebDetailsState extends State<WebDetails> {
//   FlutterWebviewPlugin webview;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     webview?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     print('开始访问');
//     print(widget.sUrl);
//     String sTitle = '';
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(sTitle),
//         ),
//         body: Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height,
//             child: WebviewScaffold(
//               // withJavascript: true,
//               supportMultipleWindows: true,
//               // withLocalUrl: true,
//               // appCacheEnabled: false,
//               // clearCache: true,
//               // clearCookies: true,
//               url: widget.sUrl, // 加载的url
//             )));
//   }
// }
