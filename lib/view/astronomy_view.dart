import 'package:flutter/material.dart';

class AstronomyView extends StatefulWidget {
  const AstronomyView({super.key});

  @override
  State<AstronomyView> createState() => _AstronomyViewState();
}

class _AstronomyViewState extends State<AstronomyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
