import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mai_na/common/common_check.dart';
import 'package:flutter_mai_na/models/viewModel.dart';
import 'package:flutter_mai_na/service/webdata_service.dart';
import 'package:flutter_mai_na/widgets/bar/common_bar.dart';
import 'package:flutter_mai_na/widgets/card/price_card.dart';
import 'package:flutter_mai_na/widgets/loadingView.dart';
import 'package:flutter_mai_na/widgets/webview_page.dart'; 
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
// import 'package:webview_media/webview_flutter.dart';


class PricePage extends StatefulWidget {
  @override
  _PricePageState createState() => _PricePageState();
}

class _PricePageState extends State<PricePage> {
  List<CurrencylistItem> data;
  bool hasRequest = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() {
    getPriceList().then((val) {
      print(val);
      if (mounted) {
        setState(() {
          data = val.currencylist;
          hasRequest = true;
        });
      }
    });
  }
// JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
//     return JavascriptChannel(
//         name: 'Toaster',
//         onMessageReceived: (JavascriptMessage message) {
//           Scaffold.of(context).showSnackBar(
//             SnackBar(content: Text(message.message)),
//           );
//         });
//   }
//   webViewWiget()
  
//   {  final Completer<WebViewController> _controller =
//       Completer<WebViewController>();
//      return  WebView(
//           initialUrl: 'https://m.huobi.me/zh-cn/market/chart/?s=btc_usdt',
//           javascriptMode: JavascriptMode.unrestricted,
//           onWebViewCreated: (WebViewController webViewController) {
//             _controller.complete(webViewController);
//           },
//           // TODO(iskakaushik): Remove this when collection literals makes it to stable.
//           // ignore: prefer_collection_literals
//           javascriptChannels: <JavascriptChannel>[
//             _toasterJavascriptChannel(context),
//           ].toSet(),
//           navigationDelegate: (NavigationRequest request) {
//             if (request.url.startsWith('https://www.youtube.com/')) {
//               print('blocking navigation to $request}');
//               return NavigationDecision.prevent;
//             }
//             print('allowing navigation to $request');
//             return NavigationDecision.navigate;
//           },
//           onPageStarted: (String url) {
//             print('Page started loading: $url');
//           },
//           onPageFinished: (String url) {
//             print('Page finished loading: $url');
//           },
//           gestureNavigationEnabled: true,
//         );
// }
 



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: ComMomBar(title: "MaiNa Technology Trade"),
        body:
            // Center(
            //   child: hasRequest
            //       ? listNoEmpty(data)
            //           ? new ListView.builder(
            //               itemBuilder: (context, index) {
            //                 return PriceCard(data[index]);
            //               },
            //               itemCount: data.length,
            //             )
            //           : Center(
            //               child: Text('暂无数据'),
            //             )
            //       : new LoadingView(),
            // )
            Center(
      child:
      
      
      hasRequest
          ? listNoEmpty(data)
              ?  WebViewPage(data[0].memo, "MaiNa Technology Trade")
              : Center(
                  child: Text('暂无数据'),
                )
          : new LoadingView(),
    ));

    // Center(
    //     child: WebViewPage(
    //         "https://www.binancezh.com/cn/tradeng/btc_USDT", "BTC")));

    // );
  }
}
