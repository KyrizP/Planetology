import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../model/planet_model.dart';
import '../model/service/my_service.dart';
import '../utils/state/my_state.dart';

class PlanetProvider extends ChangeNotifier {
  final MyService service = MyService();

  List<PlanetModel> planets = [];

  MyState myState = MyState.loading;

  final List<String> planetImg = [
    "assets/images/planets/1mercury.png",
    "assets/images/planets/2venus.png",
    "assets/images/planets/3earth.png",
    "assets/images/planets/4mars.png",
    "assets/images/planets/5jupiter.png",
    "assets/images/planets/6saturn.png",
    "assets/images/planets/7uranus.png",
    "assets/images/planets/8neptune.png",
  ];
  final List<String> planetNickname = [
    "Swift Planet",
    "Morning Star & Evening Star",
    "Our Blue Planet",
    "Red Planet",
    "Giant Planet",
    "Ringed Planet",
    "Ice Giant",
    "Big Blue Planet",
  ];

  Future fetchPlanet() async {
    try {
      myState = MyState.loading;
      notifyListeners();

      planets = await service.fetchPlanet();

      myState = MyState.success;
      notifyListeners();
    } catch (e) {
      if (e is DioError) {
        e.response!.statusCode;
      }

      myState = MyState.failed;
      notifyListeners();
    }
  }
}
