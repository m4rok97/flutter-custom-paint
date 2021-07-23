import 'package:flutter/material.dart';
import 'package:flutter_custom_painter/widgets/headers.dart';

class HeadersPage extends StatelessWidget {
  const HeadersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SquareHeader());
  }
}
