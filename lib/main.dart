import 'package:flutter/material.dart';
import 'package:flutter_mai_na/config/const_config.dart';
import 'package:flutter_mai_na/pages/_2price_page.dart';
import 'package:flutter_mai_na/pages/_3level_page.dart';
import 'package:flutter_mai_na/pages/_5login_page.dart';
import 'package:flutter_mai_na/pages/member/_40memberInfo_page.dart';
import 'package:flutter_mai_na/providers/sys_provider.dart';
import 'package:flutter_mai_na/widgets/card/level_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nav_router/nav_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);
    // ScreenUtil.init(context);‘
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounteDownTimeProvider(60, 1))
      ],
      child: MaterialApp(
        navigatorKey: navGK,
        title: 'ZJCC',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: MyGroup(),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        indicatorColor: appBarColor,
        scaffoldBackgroundColor: bgColor,
        hintColor: Colors.grey.withOpacity(0.3),
        splashColor: Colors.transparent,
        // canvasColor: Colors.transparent,
      ),
      home: LoginPage(),
    );
  }
}
