import 'package:flutter/material.dart';
import 'package:hero_animation_tarea/pantallas/Listado.dart';

void main() {
  runApp(HeroAnimation());
}

class HeroAnimation extends StatefulWidget {
  HeroAnimation({Key? key}) : super(key: key);

  @override
  State<HeroAnimation> createState() => _HeroAnimationState();
}

class _HeroAnimationState extends State<HeroAnimation> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Listado(),
    );
  }
}
