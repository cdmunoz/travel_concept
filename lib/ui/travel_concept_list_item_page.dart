import 'package:flutter/material.dart';
import 'package:travel_concept/model/LocationCard.dart';
import 'package:travel_concept/ui/travel_concept_details_page.dart';

class TravelItem extends StatefulWidget {
  final int itemIndex;
  final int totalItems;
  final LocationCard locationCard;

  const TravelItem(
      {Key key, this.itemIndex, this.totalItems, this.locationCard})
      : super(key: key);

  @override
  _TravelItemState createState() => _TravelItemState();
}

class _TravelItemState extends State<TravelItem> {
  bool _selected = false;

  void _onTap() {
    if (_selected) {
      _changeSelectedStatus();
    } else {
      _changeSelectedStatus();
    }
  }

  void _changeSelectedStatus() {
    setState(() {
      _selected = !_selected;
    });
  }

  void _onVerticalDrag(DragUpdateDetails dragUpdateDetails) {
    if (dragUpdateDetails.primaryDelta >= 3 && _selected) {
      _changeSelectedStatus();
    } else {
      if (_selected) {
        final detailsPage = TravelConceptDetailsPage(
          locationCard: widget.locationCard,
        );
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => detailsPage));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 250);

    return LayoutBuilder(builder: (context, constraints) {
      final itemWidth = constraints.maxWidth * 0.85;
      final itemHeight = constraints.maxHeight * 0.5;

      final backItemWidth = _selected ? itemWidth * 1.1 : itemWidth;
      final backItemHeight = _selected ? itemHeight * 1.05 : itemHeight;

      final itemBorderRadius = BorderRadius.circular(4.0);

      List<Widget> _buildStars(int numberOfStars) {
        List<Widget> _stars = [];
        final _maxStars = 5;
        for (var indexColoured = 0;
            indexColoured < numberOfStars;
            indexColoured++) {
          _stars.add(Icon(
            Icons.star,
            size: 18,
            color: Color(0xFF3F7783),
          ));
        }
        final _noColoredIcons = _maxStars - numberOfStars;
        if (_noColoredIcons >= 1) {
          for (var indexNoColor = 0;
              indexNoColor < _noColoredIcons;
              indexNoColor++) {
            _stars.add(Icon(
              Icons.star,
              size: 22,
              color: Colors.grey,
            ));
          }
        }
        return _stars;
      }

      return Container(
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: _onTap,
          onVerticalDragUpdate: _onVerticalDrag,
          child: Stack(children: [
            Center(
              child: AnimatedContainer(
                duration: duration,
                width: backItemWidth,
                height: backItemHeight,
                margin: EdgeInsets.only(top: _selected ? itemHeight * 0.3 : 0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: itemBorderRadius,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10.0,
                        spreadRadius: 6.0,
                        color: Color(0xFF939FAD),
                      ),
                    ]),
                child: Column(
                  children: [
                    Flexible(
                      flex: 2,
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 18, horizontal: 10),
                            child: Text(
                                widget.locationCard.detailsTitle.toUpperCase(),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                style: TextStyle(
                                  color: Color(0xFFB3B3B3),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                )),
                          ),
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 12),
                                child: Text(widget.locationCard.codeData,
                                    style: TextStyle(
                                      color: Color(0xFFBEBEBE),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    )),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.topRight,
                                  padding: EdgeInsets.only(right: 16),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children:
                                        _buildStars(widget.locationCard.stars),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Center(
              child: AnimatedContainer(
                duration: duration,
                margin:
                    EdgeInsets.only(bottom: _selected ? itemHeight * 0.4 : 0),
                decoration:
                    BoxDecoration(borderRadius: itemBorderRadius, boxShadow: [
                  BoxShadow(
                    offset: const Offset(0.0, 1.0),
                    blurRadius: 10.0,
                    spreadRadius: 6.0,
                    color: Color(0xFF939FAD),
                  ),
                ]),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4.0),
                        child: Hero(
                          tag: widget.locationCard.name,
                          child: Image.network(
                            widget.locationCard.imageUrl,
                            fit: BoxFit.cover,
                            width: _selected ? itemWidth * 1.05 : itemWidth,
                            height: _selected ? itemHeight * 1.05 : itemHeight,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10.0),
                      child: Text(
                        widget.locationCard.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFDDE2E6),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      );
    });
  }
}
