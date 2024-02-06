import 'package:app/interfaces/i.place.dart';
import 'package:app/widgets/ui/home.title.dart';
import 'package:app/widgets/ui/like.button.dart';
import 'package:flutter/material.dart';

class PlacesItem extends StatefulWidget {
  final IPlace place;
  PlacesItem({required this.place});
  bool _liked = false;

  @override
  State<StatefulWidget> createState() => PlacesItemState(place: this.place);
}

class PlacesItemState extends State<PlacesItem> {
  final IPlace place;
  PlacesItemState({required this.place});
  bool _liked = false;

  void handleLike() {
    setState(() {
      _liked = !_liked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(this.place.image),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LikeButton(active: _liked, handleClick: handleLike),
                  ),
                ],
              ),
              Expanded(child: SizedBox()),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 200, // Adjust the height based on your needs
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      colors: [
                        Colors.black.withOpacity(0.6),
                        Colors.transparent
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 47,
            left: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.white,
                  size: 15,
                ),
                SizedBox(width: 5),
                HomeTitle(
                  text: this.place.state,
                  color: Colors.white,
                  size: 14,
                )
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: HomeTitle(
              text: this.place.name,
              size: 25,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
