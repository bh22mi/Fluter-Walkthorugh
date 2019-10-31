import 'package:flutter/material.dart';
import 'package:flutter_walkthrough/flutter_walkthrough.dart';
import 'package:flutter_walkthrough/walkthorough.dart';

class TestScreen extends StatelessWidget {

  final List<WalkThrough> list = [
    WalkThrough(title: 'Title 1',content: 'Content 1',imgIcon: Icons.restaurant_menu,),
    WalkThrough(title: 'Title 2',content: 'Content 2',imgIcon: Icons.search,),
    WalkThrough(title: 'Title 3',content: 'Content 3',imgIcon: Icons.shopping_cart,),
    WalkThrough(title: 'Title 4',content: 'Content 4',imgIcon: Icons.verified_user,),
  ];


  @override
  Widget build(BuildContext context) {
    return IntroScreen(
      walkthorughList: list,
      pageRoute: MaterialPageRoute(builder: (context) => TestScreen()),
    );
  }
}
