import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view/home_view.dart';
import 'view_model/astro_provider.dart';
import 'view_model/planet_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PlanetProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AstroProvider(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}
