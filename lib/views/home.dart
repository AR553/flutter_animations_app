import 'package:animations_app/views/ball_animation.dart';
import 'package:flutter/material.dart';

import 'explicit_animation.dart';
import 'implicit_animation.dart';
import 'lottie_animation.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animations'), centerTitle: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImplicitAnimationPage(),
                  )),
              child: Container(
                  color: Colors.indigo,
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Implicit Animation',
                    style: TextStyle(color: Colors.white),
                  ))),
          SizedBox(height: 15),
          TextButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExplicitAnimationPage(),
                  )),
              child: Container(
                  color: Colors.indigo,
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Explicit Animation',
                    style: TextStyle(color: Colors.white),
                  ))),
          SizedBox(height: 15),
          TextButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BallAnimationPage(),
                  )),
              child: Container(
                  color: Colors.indigo,
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Bouncy Animation',
                    style: TextStyle(color: Colors.white),
                  ))),
          SizedBox(height: 15),
          TextButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LottieAnimationPage(),
                  )),
              child: Container(
                  color: Colors.indigo,
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    '3rd party Animation',
                    style: TextStyle(color: Colors.white),
                  ))),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
