import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import '../astro_model.dart';
import '../planet_model.dart';

class MyService {
  final Dio dio = Dio();
  DateTime date = DateTime.now();

  Future<List<PlanetModel>> fetchPlanet() async {
    try {
      List<PlanetModel> listPlanet = [];
      final response = await dio.get(
        'https://planets-info-by-newbapi.p.rapidapi.com/api/v1/planets/',
        options: Options(
          headers: {'X-RapidAPI-Key': keyPlanet},
        ),
      );

      for (var element in response.data) {
        listPlanet.add(PlanetModel.fromJson(element));
      }
      return listPlanet;
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<AstroModel> fetchAstroDay() async {
    try {
      final response = await dio.get(
        'https://api.nasa.gov/planetary/apod?api_key=$keyAstro&date=${DateFormat('yyy-MM-dd').format(date)}',
      );

      return AstroModel.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }

  ///AstronomyDay API Key
  String keyAstro = "eXes0AYQPdea8nCm68yLf2lcrow3IjWiaxSNw5QM";

  ///AstronomyDay API Key
  String keyPlanet = "96fceaad73msh67eb1ab57234972p15c4d3jsn5bb6bfbd8dd0";
}
