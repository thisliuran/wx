import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {




  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset("images/loading.jpeg",fit: BoxFit.fill,),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2),(){
      print("微信启动中…………");
      Navigator.pushReplacementNamed(context, 'app');
    });
  }
}
