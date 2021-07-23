import 'package:flutter/material.dart';
import 'package:flutter_custom_painter/pages/headers_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HeadersPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
