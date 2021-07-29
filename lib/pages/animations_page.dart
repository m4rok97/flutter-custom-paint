import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimationsPage extends StatelessWidget {
  const AnimationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedRectangle(),
      ),
    );
  }
}

class AnimatedRectangle extends StatefulWidget {
  const AnimatedRectangle({Key? key}) : super(key: key);

  @override
  _AnimatedRectangleState createState() => _AnimatedRectangleState();
}

class _AnimatedRectangleState extends State<AnimatedRectangle>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> rotation;
  late Animation<double> opacity;
  late Animation<double> translation;
  late Animation<double> scale;
  late Animation<double> opacityOut;

  @override
  void initState() {
    animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));

    rotation = Tween(begin: 0.0, end: 2 * math.pi).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));

    opacity = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0, 0.25, curve: Curves.easeOut)));

    translation = Tween(begin: 0.0, end: 100.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));

    scale = Tween(begin: 0.0, end: 2.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));

    opacityOut = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.75, 1.0, curve: Curves.easeOut)));

    animationController.addListener(() {
      if (animationController.status == AnimationStatus.completed) {
        print('Status: ${animationController.status}');
        animationController.reverse();
      }
      if (animationController.status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });

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
      builder: (BuildContext context, Widget? child) {
        print(translation.value);
        return Transform.scale(
          scale: scale.value,
          child: Transform.translate(
            offset: Offset(translation.value, 0),
            child: Transform.rotate(
                angle: rotation.value,
                child: Opacity(
                  child: child!,
                  opacity: opacity.value - opacityOut.value,
                )),
          ),
        );
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
