import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class ExplicitAnimationPage extends StatefulWidget {
  const ExplicitAnimationPage({Key? key}) : super(key: key);

  @override
  _ExplicitAnimationPageState createState() => _ExplicitAnimationPageState();
}

class _ExplicitAnimationPageState extends State<ExplicitAnimationPage> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _isTurnedOn = false;

  // late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 1))..forward();
    // _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOutExpo);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Explicit Animations'), centerTitle: true),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height - 84,
            child: StreamBuilder(
                stream: accelerometerEvents,
                builder: (context, AsyncSnapshot<AccelerometerEvent> snapshot) {
                  double x = snapshot.data?.x ?? 0;
                  double y = snapshot.data?.y ?? 0;
                  if (!_isTurnedOn) x = y = 0;
                  // print(x.abs().toString() + ' '+ y.abs().toString());
                  return Stack(
                    children: <Widget>[
                      PositionedTransition(
                        rect: RelativeRectTween(
                          begin: RelativeRect.fromLTRB(0, 0, 0, 0),
                          end: RelativeRect.fromLTRB(x < 0 ? x.abs() * 40 : 0, y > 0 ? y.abs() * 80 : 0, x > 0 ? x.abs() * 40 : 0,
                              y < 0 ? y.abs() * 80 : 0),
                        ).animate(_controller),
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.indigo.shade200,
                            ),
                            padding: EdgeInsets.all(20),
                            child: FlutterLogo(size: 50),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(_isTurnedOn ? Icons.sensors_off : Icons.sensors),
        onPressed: () => setState(() {
          _isTurnedOn = !_isTurnedOn;
        }),
      ),
    );
  }
}
