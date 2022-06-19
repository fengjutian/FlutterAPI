import 'package:flutter/material.dart';

import 'view/view_home.dart';
import 'view/view_forum.dart';
import 'view/view_mine.dart';
import 'view/view_news.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int lastTime = 0;
  PageController pageController;
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: PageView(
            children: <Widget>[
              HomePage(),
              ForumPage(),
              NewsPage(),
              MinePage()
            ],
            onPageChanged: onPageChanged,
            controller: pageController,
          ),
          floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(
          Icons.add,
          color: Colors.white,
          ),
          ),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomNavigationBar(
        items: [
        BottomNavigationBarItem(
        icon: Icon(Icons.home), title: Text('首页')),
        BottomNavigationBarItem(
        icon: Icon(Icons.store), title: Text('论坛')),
        BottomNavigationBarItem(
        icon: Icon(Icons.home), title: Text('发布')),
        BottomNavigationBarItem(
        icon: Icon(Icons.home), title: Text('消息')),
        BottomNavigationBarItem(
        icon: Icon(Icons.home), title: Text('我的')),
        ],
        type: BottomNavigationBarType.fixed,
        fixedColor: Theme.of(context).primaryColor,
        onTap: onTap,
        currentIndex: page)
    ),
        onWillPop: () {
          int newTime = DateTime.now().millisecondsSinceEpoch;
          int result = newTime - lastTime;
          lastTime = newTime;

          return null;
        });
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: this.page);
  }

  void onPageChanged(int value) {
    if (value >= 2) {
      value = value + 1;
    }
    setState(() {
      this.page = value;
    });
  }
  void onTap(int value) {
    if (value == 2) return;
    if (value > 2) {
      value = value - 1;
    }
    pageController.animateToPage(value,
        duration: const Duration(milliseconds: 100), curve: Curves.ease);
  }
}



