import 'package:flutter/material.dart';
import 'package:planetology/view/astronomy/screen/astronomy_view.dart';
import 'package:planetology/view/favorite/screen/favorite_view.dart';
import '../widget/card_widget.dart';
import '../widget/list_drawer.dart';
import '../../planet/screen/planets_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      endDrawer: Drawer(
        backgroundColor: Colors.black,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 41, 78, 152).withOpacity(0.5),
                blurRadius: 150,
                spreadRadius: 10,
              ),
            ],
          ),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Hero(
                tag: "AppIcon",
                child: Image.asset(
                  "assets/images/app_icon.png",
                  width: 200,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Divider(
                  thickness: 2,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              const ListDrawer(
                title: 'Favorite Planet',
                icon: Icons.favorite_outline_rounded,
                page: FavoriteView(),
              ),
              const SizedBox(height: 10),
              const ListDrawer(
                title: 'Feedback Form',
                icon: Icons.message_rounded,
                page: FavoriteView(),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Hero(
              tag: "LogoTag",
              child: Image.asset(
                "assets/images/app_icon2.png",
                width: 40,
              ),
            ),
            const SizedBox(width: 5),
            const Text(
              "PLANETOLOGY",
              style: TextStyle(
                  fontFamily: 'BrunoAce',
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                SizedBox(height: 60),

                // Card for planets page
                CardWidget(
                  imageCard: "assets/images/card_planet.png",
                  pages: PlanetsView(),
                  title1: 'EXPLORE',
                  title2: 'SOLAR',
                  title3: 'SYSTEM',
                ),

                // Card for astronomy picture page
                CardWidget(
                  imageCard: "assets/images/card_astronomy.jpg",
                  pages: AstronomyView(),
                  title1: 'NASA',
                  title2: 'ASTRONOMY',
                  title3: 'PICTURE OF THE DAY',
                ),
                SizedBox(height: 20),
              ],
            ),
          )
        ],
      ),
    );
  }
}
