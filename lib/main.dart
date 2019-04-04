import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:wx/found/found.dart';
import 'package:wx/search.dart';
import './app.dart';
import './loading.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: defaultTheme,
    home:LoadingPage(),

      routes: <String,WidgetBuilder>{
        "app":(context)=>new App(),
        "friend":(context)=> new Found(),
        "search":(context)=>new Search(),
      },
    );
  }
}

final ThemeData defaultTheme=  new ThemeData(
  primaryColor: Color(0xff303030),//原色
  scaffoldBackgroundColor: Color(0xffebebeb),
  cardColor: Color(0xff393a3f),


);
