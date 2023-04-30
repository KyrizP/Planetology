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
          Center(
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Text(
                  "ASTRONOMY PICTURE OF THE DAY",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Title of Astronomy Picture",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                      'https://images.unsplash.com/photo-1419242902214-272b3f66ee7a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YXN0cm9ub215fGVufDB8fDB8fA%3D%3D&w=1000&q=80'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
