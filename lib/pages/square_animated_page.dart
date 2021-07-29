import 'package:flutter/material.dart';

class SquareAnimatedPage extends StatelessWidget {
  const SquareAnimatedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SquareAnimated()),
    );
  }
}

class SquareAnimated extends StatefulWidget {
  const SquareAnimated({Key? key}) : super(key: key);

  @override
  _SquareAnimatedPageState createState() => _SquareAnimatedPageState();
}

class _SquareAnimatedPageState extends State<SquareAnimated>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> moveRight;
  late Animation<double> moveUp;
  late Animation<double> moveDown;
  late Animation<double> moveLeft;

  @override
  void initState() {
    animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 4500));

    moveRight = new Tween(begin: 0.0, end: 120.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.0, 0.25, curve: Curves.bounceOut)));

    moveLeft = new Tween(begin: 0.0, end: 120.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 0.75, curve: Curves.bounceOut)));

    moveUp = new Tween(begin: 0.0, end: -120.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.25, 0.5, curve: Curves.bounceOut)));

    moveDown = new Tween(begin: 0.0, end: -120.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.75, 1.0, curve: Curves.bounceOut)));

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationController.forward();

    return AnimatedBuilder(
      animation: animationController,
      child: _Rectangle(),
      builder: (_, child) {
        return Transform.translate(
            offset: Offset(moveRight.value - moveLeft.value,
                moveUp.value - moveDown.value),
            child: child!);
      },
    );
  }
}

class _Rectangle extends StatelessWidget {
  const _Rectangle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
