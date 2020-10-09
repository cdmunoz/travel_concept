import 'package:flutter/material.dart';
import 'package:travel_concept/data/repository/location_card_repository_impl.dart';
import 'package:travel_concept/ui/travel_concept_list_page.dart';

import 'data/repository/location_card_repository.dart';

void main() {
  final _locationCardRepository = LocationCardsRepositoryImpl();
  runApp(LocationCardsApp(
    locationCardRepository: _locationCardRepository,
  ));
}

class LocationCardsApp extends StatelessWidget {
  final LocationCardsRepository locationCardRepository;

  const LocationCardsApp({Key key, this.locationCardRepository})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Concept App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TravelConceptPage(
        locationCardRepository: locationCardRepository,
      ),
    );
  }
}
