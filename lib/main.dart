import 'package:flutter/material.dart';
import 'package:flutter_custom_painter/pages/animations_page.dart';
import 'package:flutter_custom_painter/pages/headers_page.dart';
import 'package:flutter_custom_painter/pages/square_animated_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: SquareAnimatedPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
