import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BallAnimationPage extends StatefulWidget {
  const BallAnimationPage({Key? key}) : super(key: key);

  @override
  _BallAnimationPageState createState() => _BallAnimationPageState();
}

class _BallAnimationPageState extends State<BallAnimationPage> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 1))..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double curve(double value){
    return Curves.ease.transform(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Bouncy'),
        ),
        body: AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget? child) => Center(
            child: Container(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: 160 - curve(_controller.value)*10,
                    height: 140 + curve(_controller.value)*10,
                    transform: Transform.translate(offset: Offset(0, -curve(_controller.value)*300)).transform,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.redAccent,
                    ),
                    child: ClipOval(
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Image.network('https://static.vecteezy.com/system/resources/thumbnails/000/135/839/small/basketball-texture-free-vector.png',fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [BoxShadow(color: Colors.black38.withOpacity(curve(1-(_controller.value))),blurRadius: 10,offset: Offset(0,30))],
                      borderRadius: BorderRadius.all(Radius.elliptical(curve(_controller.value)*100+100, curve(_controller.value)*50+40)),

                    ),
                    width: 80 - curve(_controller.value)*80 + 30,
                    height: 40 - curve(_controller.value)*40 + 5,
                    margin: EdgeInsets.symmetric(horizontal: 100),
                    child: Container(),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
