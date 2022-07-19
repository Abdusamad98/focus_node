import 'package:flutter/material.dart';
import 'package:focus_node/my_home_page.dart';

class MyPageView extends StatefulWidget {
  const MyPageView({Key? key}) : super(key: key);

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  int currentPageIndex = 0;
  String buttonText = "Next";
  PageController controller = PageController(initialPage: 0);
  List<Widget> screens = [
    Container(
        color: Colors.pink,
        child: Center(
          child: Text("page 1"),
        )),
    Container(
        color: Colors.yellow,
        child: Center(
          child: Text("page 2"),
        )),
    Container(
        color: Colors.green,
        child: Center(
          child: Text("page 3"),
        )),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page View"),
      ),
      body: Column(
        children: [
          Expanded(
              child: PageView(
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: (pageIndex) {
              print(pageIndex);
            },
            controller: controller,
            children: screens,
          )),
          TextButton(
              onPressed: () {
                setState(() {
                  if (currentPageIndex < 2) {
                    currentPageIndex++;
                    controller.jumpToPage(currentPageIndex);
                  } else {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (BuildContext c) {
                      return MyHomePage();
                    }));
                  }
                  if (currentPageIndex == 2) {
                    buttonText = "Let's start";
                  }
                });
              },
              child: Container(
                height: 55,
                child: Center(
                  child: Text(buttonText),
                ),
              ))
        ],
      ),
    );
  }
}
