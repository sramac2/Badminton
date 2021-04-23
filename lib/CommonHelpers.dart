import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CommonHelper {
  Widget buildAddressRow(Map<String, dynamic> data, BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 8, bottom: 8),
      child: Row(
        children: [
          Icon(Icons.location_on),
          Flexible(
            child: Text(
              data['address'],
              style: TextStyle(fontSize: width * 0.04),
            ),
          )
        ],
      ),
    );
  }

  Widget buildLogoNameRow(Map<String, dynamic> data, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(data['logo']),
            radius: 35,
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                data['name'],
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.06),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCarousel(List<String> images, BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(),
      items: images
          .map((item) => Image.asset(
                item,
                fit: BoxFit.fill,
              ))
          .toList(),
    );
  }

  Widget buildSportPlayedTitle(
      Map<String, dynamic> data, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 8, bottom: 8),
      child: Text('Sports Played',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width * 0.06)),
    );
  }

  Widget buildSportDescription(Map<String, dynamic> data, double width) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.sports_tennis,
                size: width * 0.08,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Badminton',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.05),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Text(
                          'Badminton  is a racquet sport played using racquets to hit a shuttlecock across a net. Although it may be played with larger teams, the most common forms of the game are "singles" (with one player per side) and "doubles" (with two players per side).',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.sports_tennis,
                size: width * 0.08,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Table Tennis',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.05),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Text(
                          'Table tennis, also known as ping-pong and whiff-whaff, is a sport in which two or four players hit a lightweight ball, also known as the ping-pong ball, back and forth across a table using small rackets. ',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget drawLine() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        height: 2.0,
        color: Colors.black,
      ),
    );
  }

  Widget buildClubDescription(Map<String, dynamic> data, double width) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              data['description'],
              style: TextStyle(fontSize: width * 0.05),
            ),
          ),
        ),
      ],
    );
  }
}
