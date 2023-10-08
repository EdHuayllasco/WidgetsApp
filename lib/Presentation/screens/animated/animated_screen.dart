import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedScreen extends StatefulWidget {
  static const name = 'animated_screen';
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadius = 10;
  void changeShape() {
    final random = Random();
    width = random.nextInt(300) + 120; // maximo 300 minimo 50
    height = random.nextInt(400) + 120;
    borderRadius = random.nextInt(100) + 20;
    int r = random.nextInt(255);
    int g = random.nextInt(255);
    int b = random.nextInt(255);
    color = Color.fromRGBO(
        r, //red
        g, //green
        b, //blue
        1 //opacity
        );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.elasticOut,
          width: width <= 0 ? 50 : width,
          height: height <= 0 ? 50 : height,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(borderRadius <= 0 ? 50 : borderRadius)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}
