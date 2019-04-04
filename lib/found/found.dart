import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Found extends StatefulWidget {
  @override
  _FoundState createState() => _FoundState();
}

class _FoundState extends State<Found> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(title: Text("发现"),),
      url: "https://www.baidu.com",
        withLocalStorage:true,
        withZoom:true
    );
  }
}
