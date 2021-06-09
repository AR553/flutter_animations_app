import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimationPage extends StatefulWidget {
  const LottieAnimationPage({Key? key}) : super(key: key);

  @override
  _LottieAnimationPageState createState() => _LottieAnimationPageState();
}

class _LottieAnimationPageState extends State<LottieAnimationPage> with SingleTickerProviderStateMixin {
  late final AnimationController _controller1;

  @override
  void initState() {
    super.initState();
    _controller1 = AnimationController(vsync: this, duration: Duration(seconds: 2))..repeat();
  }

  @override
  void dispose() {
    _controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height - 84;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Lottie Animations'),
      ),
      body: Container(
        height: _height,
        width: _width,
        child: Column(
          children: [
            Lottie.asset(
              'assets/happy-swinging-boy.json',
              alignment: Alignment.topCenter,
              fit: BoxFit.contain,
              width: _width,
              height: _height / 2,
              controller: _controller1,
            ),
            Lottie.asset('assets/developer.json', fit: BoxFit.contain, height: _height / 2, width: _width, controller: _controller1),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(_controller1.isAnimating ? Icons.pause : Icons.play_arrow),
        onPressed: () => setState(() {
          _controller1.isAnimating ? _controller1.stop() : _controller1.repeat();
        }),
      ),
    );
  }
}
