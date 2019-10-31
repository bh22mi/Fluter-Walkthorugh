import 'package:flutter/material.dart';

class WalkThrough extends StatefulWidget {

  final title;
  final content;
  final imgIcon;
  final imgColor;


  WalkThrough({this.title, this.content, this.imgIcon, this.imgColor = Colors.redAccent});

  @override
  _WalkThroughState createState() => _WalkThroughState();
}

class _WalkThroughState extends State<WalkThrough> with SingleTickerProviderStateMixin {

  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = new AnimationController(vsync: this,duration: new Duration(milliseconds: 500));
    animation = new Tween(begin: -250.0,end: 0.0).animate(new CurvedAnimation(parent: animationController, curve: Curves.easeInOut));

    animation.addListener(() => setState(() {}));

    animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Material(
        animationDuration: Duration(milliseconds: 500),
        elevation: 2.0,
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Transform(transform: Matrix4.translationValues(animation.value, 0.0, 0.0),
            child: Text(widget.title, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),),),
            Transform(transform: Matrix4.translationValues(animation.value, 0.0, 0.0),
              child: Text(widget.content, style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal, color: Colors.black),),),
            Icon(widget.imgIcon,size: 100.0,color: widget.imgColor,)
          ],
        ),
      ),
    );
  }
}
