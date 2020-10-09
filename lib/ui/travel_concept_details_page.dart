import 'package:flutter/material.dart';
import 'package:travel_concept/model/LocationCard.dart';

class TravelConceptDetailsPage extends StatelessWidget {
  final LocationCard locationCard;
  final String avatarUrl = "https://www.fillmurray.com/320/180";

  const TravelConceptDetailsPage({Key key, this.locationCard})
      : super(key: key);

  void _onVerticalDrag(
      DragUpdateDetails dragUpdateDetails, BuildContext context) {
    if (dragUpdateDetails.primaryDelta >= 3) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          GestureDetector(
            onVerticalDragUpdate: (dragUpdateDetails) =>
                _onVerticalDrag(dragUpdateDetails, context),
            child: Hero(
              tag: locationCard.name,
              child: Image.network(
                locationCard.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          ...List.generate(20, (index) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 18,
                  backgroundImage: NetworkImage(avatarUrl),
                ),
                title: Text("Bill Murray - Official"),
                subtitle: Text("Best city in the the entire world.\n In my top 1000 of the cities this is the number ${index+1}"),
              ),
            );
          })
        ],
      ),
    );
  }
}
