import 'package:flutter/material.dart';

class ImplicitAnimationPage extends StatefulWidget {
  const ImplicitAnimationPage({Key? key}) : super(key: key);

  @override
  _ImplicitAnimationPageState createState() => _ImplicitAnimationPageState();
}

class _ImplicitAnimationPageState extends State<ImplicitAnimationPage> {
  double _width = 150;
  double _height = 150;
  Color _color = Colors.deepPurple;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Implicit Animations'), centerTitle: true),
      body: Center(
        child: AnimatedContainer(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_width * .2),
            color: _color,
          ),
          width: _width,
          height: _height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlutterLogo(),
          ),
          curve: Curves.easeInExpo,
          duration: Duration(milliseconds: 500),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => setState(() {
                _width = _height = _width == 150 ? 300 : 150;
                _color = _color == Colors.deepPurple ? Colors.teal : Colors.deepPurple;
              })),
    );
  }
}
