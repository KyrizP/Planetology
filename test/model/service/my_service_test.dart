import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:planetology/model/planet_model.dart';
import 'package:planetology/model/service/my_service.dart';

import 'my_service_test.mocks.dart';

@GenerateMocks([MyService])
void main() {
  group(
    'MyService',
    () {
      MyService myService = MockMyService();
      test(
        'get planet api return data',
        () async {
          when(myService.fetchPlanet()).thenAnswer(
            (_) async => <PlanetModel>[
              PlanetModel(
                  id: 9,
                  planetOrder: 9,
                  basicDetails: BasicDetails(volume: '500 cm2', mass: '500 kg'),
                  description: "This is a planet test",
                  imgSrc: ImgSrc(
                      img: "TestImage", imgDescription: "This test image"),
                  name: 'Planetology',
                  source: "wikipedia.com",
                  wikiLink: 'wikipedia.com'),
            ],
          );

          var planet = await MyService().fetchPlanet();
          expect(planet.isNotEmpty, true);
        },
      );
    },
  );
}
