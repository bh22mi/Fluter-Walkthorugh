library flutter_walkthrough;

import 'package:flutter/material.dart';
import 'walkthorough.dart';

/// Introscreen class
///
class IntroScreen extends StatefulWidget {
  final List<WalkThrough> walkthorughList;
  final MaterialPageRoute pageRoute;

  IntroScreen({@required this.walkthorughList, @required this.pageRoute});

  void skipPage(BuildContext context) {
    Navigator.push(context, pageRoute);
  }

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController controller = new PageController();
  int currentPage = 0;
  bool lastPage = false;

  void _onPageChanged(int page) {
    setState(() {
      currentPage = page;
      if (currentPage == widget.walkthorughList.length-1) {
        lastPage = true;
      } else {
        lastPage = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFEEEEEE),
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(),
            flex: 1,
          ),
          Expanded(
            child: PageView(
              children: widget.walkthorughList,
              controller: controller,
              onPageChanged: _onPageChanged,
            ),
            flex: 3,
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text(
                  lastPage ? "" : 'SKIP',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                ),
                onPressed: () => lastPage ? null : widget.skipPage(context),
              ),
              FlatButton(
                child: Text(
                  lastPage ? 'GOT IT' : 'NEXT',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                ),
                onPressed: () => lastPage ? widget.skipPage(context) : controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn),
              )
            ],
          ))
        ],
      ),
    );
  }
}
