import 'package:flutter/material.dart';
import 'package:travel_concept/data/repository/location_card_repository.dart';
import 'package:travel_concept/data/repository/location_card_repository_impl.dart';
import 'package:travel_concept/model/LocationCard.dart';

class LocationCardBloc extends ChangeNotifier {
  final LocationCardsRepository locationCardRepository;
  List<LocationCard> locationCards = [];

  LocationCardBloc({this.locationCardRepository});

  void getAllLocations() async {
    locationCards = await locationCardRepository.getLocations();
    notifyListeners();
  }
}
