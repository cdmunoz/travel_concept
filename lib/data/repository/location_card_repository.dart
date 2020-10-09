import 'package:travel_concept/model/LocationCard.dart';

abstract class LocationCardsRepository {
  Future<List<LocationCard>> getLocations();
}
