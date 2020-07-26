import 'package:flutter/material.dart';
import 'package:flutter_mai_na/common/common_check.dart';
import 'package:flutter_mai_na/config/const_config.dart';
import 'package:flutter_mai_na/models/viewModel.dart';
import 'package:flutter_mai_na/service/webdata_service.dart';
import 'package:flutter_mai_na/widgets/bar/common_bar.dart';
import 'package:flutter_mai_na/widgets/card/news_card.dart';
import 'package:flutter_mai_na/widgets/loadingView.dart';

class NewsPage extends StatefulWidget {
  get title => null;

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<NewslistItem> data;
  bool hasRequest = false;

  @override
  void initState() {
    super.initState();
    // Notice.addListener(NCOVActions.toTabBarIndex(), (index) {
    //   if (!listNoEmpty(data)) getData();
    // });
    getData();
  }

  getData() {
    getNewsList('').then((val) {
      print(val);
      if (mounted) {
        setState(() {
          data = val.newslist;
          hasRequest = true;
        });
      }
    });
  }

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new ComMomBar(title: menu_newsTitle),
        body: Center(
          child: hasRequest
              ? listNoEmpty(data)
                  ? new ListView.builder(
                      itemBuilder: (context, index) {
                        NewslistItem model = data[index];
                        bool isNew = model.title == data[0].title;
                        return NewsCard(
                          model,
                          padding: EdgeInsets.only(
                              left: 20.0,
                              right: 20.0,
                              top: isNew ? 10.0 : 10,
                              bottom: 10
                              // model.id == data[data.length - 1].id ? 20.0 : 10,
                              ),
                          isNew: isNew,
                        );
                      },
                      itemCount: data.length,
                    )
                  : new Center(child: Text('暂无数据'))
              : new LoadingView(),
        ));
  }
}
