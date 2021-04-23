import 'dart:ui';
import 'package:badminton/CommonHelpers.dart';
import 'package:badminton/FullCourtPage.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

main() {}

class CourtListingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CourtListingState();
}

class CourtListingState extends State<CourtListingPage> {
  CommonHelper commonHelper = CommonHelper();
  Map<String, dynamic> ABC = {
    'name': 'Atlanta Badminton Club- ABC',
    'logo':
        'https://lh4.googleusercontent.com/-MFZW452kjUM/AAAAAAAAAAI/AAAAAAAAAAA/apgIe64fl7M/s66-p-k-no-ns-nd/photo.jpg',
    'images': [
      'assets/images/ABC/4.jpg',
      'assets/images/ABC/1.jpg',
      'assets/images/ABC/2.jpg',
      'assets/images/ABC/3.jpg',
    ],
    'address': '3975 Lakefield Ct #102, Suwanee, GA 30024',
    'open': '6AM',
    'close': '11pm',
    'price': 13,
    'description':'ABC started in 11/11/2011. But it took its roots to grow in 2013. SVC – Souther VolleyBall Center gave us the platform and their facility to start playing only on the weekends, Saturday Evenings and Sunday Mornings, which bought in all the badminton lovers near and far. In a year we had grown more member’s and we had find a new facility. But the facility was too away from the crowd. Finally ABC got its roots growing back in Suwanee. Welcomes Badminton Lover’s. We'
  };

  Map<String, dynamic> ARC = {
    'name': 'Atlanta Recreation Club- ARC',
    'logo':
        'https://lh4.googleusercontent.com/-lZ_ZP4CpY98/AAAAAAAAAAI/AAAAAAAAAAA/YKGZFFUqMtA/s44-p-k-no-ns-nd/photo.jpg',
    'images': [
      'assets/images/ARC/logo.jpg',
      'assets/images/ARC/2.jpg',
      'assets/images/ARC/3.jpg',
      'assets/images/ARC/4.jpg'
    ],
    'address': '2711 Pine Grove Rd, Cumming, GA 30041',
    'open': '4PM',
    'close': '10pm',
    'price': 10,
    
  };

  List<Map<String, dynamic>> data;

  @override
  void initState() {
    data = [ABC, ARC];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        
        body: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return buildCourtCard(index);
            }),
      ),
    );
  }

  Widget buildCourtCard(int index) {
    //List<Widget> result = [];

    var images = parseImages(data[index]);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FullCourtPage(
                court: data[index],
              ),
            ),
          );
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 8,
          child: Column(
            children: [
              Container(
                child: commonHelper.buildCarousel(images, context)
              ),
              Row(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(data[index]['logo']),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    data[index]['name'],
                    style: DefaultTextStyle.of(context)
                        .style
                        .apply(fontSizeFactor: 1.6),
                  ),
                ),
              ]),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                child: Row(
                  children: [
                    Icon(Icons.map),
                    Text(data[index]['address'] + '   '),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '\$' + data[index]['price'].toString() + '/Hr.',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [],
              )
            ],
          ),
        ),
      ),
    );
  }

  List<String> parseImages(Map<String, dynamic> court) {
    return court['images'];
  }
}
