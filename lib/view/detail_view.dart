import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../utils/widget/detail_container.dart';
import '../view_model/planet_provider.dart';

class DetailView extends StatefulWidget {
  final int indexPlanet;

  const DetailView({super.key, required this.indexPlanet});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PlanetProvider>(context, listen: false);
    final planet = provider.planets[widget.indexPlanet];
    final planetImg = provider.planetImg[widget.indexPlanet];
    final planetNickname = provider.planetNickname[widget.indexPlanet];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: LikeButton(),
          ),
        ],
      ),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              "assets/images/bg.png",
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 35),
                SizedBox(
                  height: MediaQuery.of(context).padding.top,
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.2),
                        blurRadius: 30,
                        spreadRadius: 3,
                      )
                    ],
                  ),
                  child: Text(
                    planet.name!.toUpperCase(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  planetNickname,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: 15),
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(planetImg),
                      fit: BoxFit.contain,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 41, 78, 152)
                            .withOpacity(0.6),
                        blurRadius: 150,
                        spreadRadius: 10,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 41, 78, 152)
                            .withOpacity(0.6),
                        blurRadius: 150,
                        spreadRadius: 10,
                      )
                    ],
                  ),

                  // er
                  height: MediaQuery.of(context).size.height * 0.55,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, left: 15, right: 15),
                    child: Column(
                      children: [
                        Text(
                          textAlign: TextAlign.justify,
                          provider.planets[widget.indexPlanet].description!,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 136, 178, 246),
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 30),

                        //Planet Order
                        DetailContainer(
                          planet: planet.planetOrder!.toString(),
                          detailTitle: "Planet's Order",
                          icon: Icons.auto_mode_rounded,
                        ),
                        const SizedBox(height: 20),

                        //Volume
                        DetailContainer(
                          planet: planet.basicDetails!.volume!,
                          detailTitle: "Volume",
                          icon: Icons.rotate_left_rounded,
                        ),
                        const SizedBox(height: 20),

                        //Mass
                        DetailContainer(
                          planet: planet.basicDetails!.mass!,
                          detailTitle: "Mass",
                          icon: Icons.scale_rounded,
                        ),
                        const SizedBox(height: 30),

                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Row(
                            children: [
                              const Text(
                                'Source: ',
                                style: TextStyle(color: Colors.white),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  try {
                                    await launchUrlString(planet.wikiLink!);
                                  } catch (err) {
                                    debugPrint('Something bad happened');
                                  }
                                },
                                child: Text(
                                  planet.wikiLink!,
                                  style: const TextStyle(
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
