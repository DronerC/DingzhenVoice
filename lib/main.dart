import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'page1.dart';
import 'page2.dart';
import 'page3.dart';

void main() {
  runApp(Tabs());
}

class Tabs extends StatefulWidget{
  Tabs({Key? key}):super(key:key);
  _TabsState createState()=>_TabsState();
}

class _TabsState extends State<Tabs>{
  int _currentIndex=0;
  //下面的三个方法都是三个界面的方法
  List<Widget> _pageList=[
    CategoryPage(),
    MyApp(),
    page3(),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('一言鼎真',style: TextStyle(color: Colors.white),),centerTitle: true,backgroundColor: Color.fromRGBO(69, 90, 100, 1),
        ),
        //body: this._pageList[this._currentIndex],
        body: IndexedStack(
          index: _currentIndex,
          children:_pageList,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromRGBO(69, 90, 100, 1),
          currentIndex: this._currentIndex,
          onTap: (int index){
            setState(() {
              this._currentIndex=index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.ac_unit),label: '传世佳作',),
            BottomNavigationBarItem(icon: Icon(Icons.accessibility),label: '专属DJ'),
            BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet_outlined),label: '经典语录'),
          ],
          selectedItemColor: Colors.white,
          unselectedItemColor: Color.fromRGBO(207, 216, 220,1),
        ),

      ),
    );

  }
}
