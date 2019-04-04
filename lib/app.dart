import 'package:flutter/material.dart';
import 'package:wx/chat/message_page.dart';
import 'package:wx/contacts/contacts.dart';
import 'package:wx/found/found.dart';
import 'package:wx/personal/personal.dart';
import 'package:flutter/cupertino.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  Contacts _contacts;
  Personal _personal;
  Found _found;
  MessagePage _messagePage;
  int _curIndex = 0;
  Widget _curpage() {
    switch (_curIndex) {
      case 0:
        if (_messagePage == null) _messagePage = MessagePage();
        return _messagePage;
      case 1:
        if (_contacts == null) _contacts = Contacts();
        return _contacts;
      case 2:
        if (_found == null) _found = Found();
        return _found;
      case 3:
        if (_personal == null) _personal = Personal();
        return _personal;
    }
  }

  List _choices = [];


  PopupMenuItem _popMenuItem(title,
      {String imagePath,
      IconData icon = Icons.not_interested,
      String url = 'app'}) {
    return PopupMenuItem(
        child: GestureDetector(
      child: Row(
        children: <Widget>[
          imagePath != null
              ? Image.asset(
                  imagePath,
                  height: 32,
                  width: 32,
                )
              : SizedBox(
                  height: 32,
                  width: 32,
                  child: Icon(
                    icon,
                    color: Colors.white,
                  ),
                ),
          Padding(
            padding: EdgeInsets.only(left: 18),
            child: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      onTap: () {
        Navigator.pushNamed(context, url);
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("微信"),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "search");
            },
            child: Icon(Icons.search),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: GestureDetector(
              child: Icon(Icons.add_circle_outline),
              onTap: () {
                showMenu(
                    context: context,
                    position: RelativeRect.fromLTRB(800.0, 76.0, 10.0, 0.0),
                    items: <PopupMenuEntry>[
                      _popMenuItem("发起群聊",
                          icon: Icons.chat_bubble, url: "search"),
                      _popMenuItem("添加朋友",
                          icon: Icons.person_add, url: "friend"),
                      _popMenuItem("扫一扫",
                          imagePath: "images/icon_menu_scan.png",
                          url: "search"),
                      _popMenuItem("收付款",
                          icon: Icons.attach_money, url: "search"),

                    ]);
              },
            ),
          ),
          PopupMenuButton(
              itemBuilder:(context){

              },
            child: Icon(Icons.menu),
            onSelected: (index){

            },
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _curIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text(
              "微信",
              style: TextStyle(
                color: _curIndex == 0 ? Color(0xFF46c01b) : Color(0xff999999),
              ),
            ),
            icon: _curIndex == 0
                ? Icon(
                    Icons.chat,
                    color: Color(0xFF46c01b),
                  )
                : Icon(
                    Icons.chat_bubble_outline,
                    color: Color(0xff999999),
                  ),
          ),
          BottomNavigationBarItem(
            title: Text(
              "通讯录",
              style: TextStyle(
                color: _curIndex == 1 ? Color(0xFF46c01b) : Color(0xff999999),
              ),
            ),
            icon: _curIndex == 1
                ? Icon(
                    Icons.contacts,
                    color: Color(0xFF46c01b),
                  )
                : Icon(
                    Icons.contacts,
                    color: Color(0xff999999),
                  ),
          ),
          BottomNavigationBarItem(
            title: Text(
              "发现",
              style: TextStyle(
                color: _curIndex == 2 ? Color(0xFF46c01b) : Color(0xff999999),
              ),
            ),
            icon: _curIndex == 2
                ? Icon(
                    Icons.face,
                    color: Color(0xFF46c01b),
                  )
                : Icon(
                    Icons.face,
                    color: Color(0xff999999),
                  ),
          ),
          BottomNavigationBarItem(
            title: Text(
              "我",
              style: TextStyle(
                color: _curIndex == 3 ? Color(0xFF46c01b) : Color(0xff999999),
              ),
            ),
            icon: _curIndex == 3
                ? Icon(
                    Icons.person,
                    color: Color(0xFF46c01b),
                  )
                : Icon(
                    Icons.person_outline,
                    color: Color(0xff999999),
                  ),
          ),
        ],
        onTap: (_index) {
          setState(() {
            _curIndex = _index;
          });
        },
      ),
      body: _curpage(),
    );
  }
}
