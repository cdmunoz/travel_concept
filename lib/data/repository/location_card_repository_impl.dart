import 'package:travel_concept/data/repository/location_card_repository.dart';
import 'package:travel_concept/model/LocationCard.dart';

class LocationCardsRepositoryImpl extends LocationCardsRepository {
  @override
  Future<List<LocationCard>> getLocations() {
    List<LocationCard> _locations = [
      LocationCard(
          name: 'New York',
          imageUrl:
              'https://image.freepik.com/foto-gratis/skyline-ciudad-nueva-york-centro-manhattan-rascacielos-al-atardecer-ee-uu_56199-56.jpg',
          detailsTitle: 'Manhattan, New York, NY, USA',
          stars: 5,
          codeData: 'L 2,999M'),
      LocationCard(
          name: 'San Francisco',
          imageUrl:
              'https://image.freepik.com/foto-gratis/puente-golden-gate-san-francisco_119101-1.jpg',
          detailsTitle: 'Golden Gate Bridge, San Francisco, CA, USA',
          stars: 4,
          codeData: 'L 2,347M'),
      LocationCard(
          name: 'Madrid',
          imageUrl:
              'https://image.freepik.com/foto-gratis/horizonte-ciudad-madrid-dia_119101-27.jpg',
          detailsTitle: 'Plaza del Sol, Madrid, Spain',
          stars: 4,
          codeData: 'L 2,086M'),
      LocationCard(
          name: 'Chicago',
          imageUrl:
              'https://image.freepik.com/foto-gratis/horizonte-chicago-ferrocarril_1426-1021.jpg',
          detailsTitle: 'Streeterville, Chicago, IL, USA',
          stars: 4,
          codeData: 'L 2,347M')
    ];

    return Future.delayed(Duration(milliseconds: 200), () => _locations);
  }
}
