import 'package:flutter/material.dart';
import 'package:travel_concept/bloc/location_card_bloc.dart';
import 'package:travel_concept/data/repository/location_card_repository.dart';
import 'package:travel_concept/ui/travel_concept_list_item_page.dart';

class TravelConceptPage extends StatefulWidget {
  final LocationCardsRepository locationCardRepository;

  const TravelConceptPage({Key key, @required this.locationCardRepository})
      : super(key: key);

  @override
  _TravelConceptPageState createState() => _TravelConceptPageState();
}

class _TravelConceptPageState extends State<TravelConceptPage> {
  int _currentPage = 0;
  LocationCardBloc _locationCardBloc;

  @override
  void initState() {
    _locationCardBloc =
        LocationCardBloc(locationCardRepository: widget.locationCardRepository);
    _locationCardBloc.getAllLocations();
    super.initState();
  }

  @override
  void dispose() {
    _locationCardBloc.dispose();
    super.dispose();
  }

  void _onPageViewChanged(page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFC9CFD8),
                    Color(0xFF9DACBD),
                  ]),
            ),
          ),
        ),
        AnimatedBuilder(
            animation: _locationCardBloc,
            builder: (context, child) {
              final _locationsSize = _locationCardBloc.locationCards.length;

              return Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: Text('BEAUTIFUL PLACES'),
                  actions: [
                    IconButton(
                        icon: Icon(
                      Icons.location_searching,
                      color: Colors.white,
                    ))
                  ],
                ),
                body: PageView.builder(
                  controller: PageController(viewportFraction: 0.7),
                  itemCount: _locationsSize,
                  onPageChanged: _onPageViewChanged,
                  itemBuilder: (context, index) => AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: _currentPage == index ? 1.0 : 0.4,
                    child: TravelItem(
                      itemIndex: index,
                      totalItems: _locationsSize,
                      locationCard: _locationCardBloc.locationCards[index],
                    ),
                  ),
                ),
              );
            }),
      ],
    );
  }
}
