import 'package:badminton/ListOfCourts.dart';

import 'CommonHelpers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

main() {}

class FullCourtPage extends StatefulWidget {
  FullCourtPage({Key key, this.court}) : super(key: key);

  final Map<String, dynamic> court;

  @override
  State<StatefulWidget> createState() => FullCourtState();
}

class FullCourtState extends State<FullCourtPage> {
  CommonHelper commonHelper = CommonHelper();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: buildCourtPage(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.transparent,
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.close),
        ),
      ),
    );
  }

  Widget buildCourtPage(BuildContext context) {
    var images = widget.court['images'] as List<String>;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          commonHelper.buildCarousel(images, context),
          commonHelper.buildLogoNameRow(widget.court, context),
          commonHelper.buildAddressRow(widget.court, context),
          Center(
            child: MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CourtLayoutPage(
                        court: widget.court,
                      ),
                    ));
              },
              color: Colors.red,
              child: Text(
                'Reserve',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          commonHelper.drawLine(),
          commonHelper.buildSportPlayedTitle(widget.court, context),
          commonHelper.buildSportDescription(widget.court, width),
          commonHelper.drawLine(),
          commonHelper.buildClubDescription(widget.court, width),
          commonHelper.drawLine()
        ],
      ),
    );
    // Row(
    //   children: [
    //     Text(widget.court['price'].toString() + '/Hr.'),
    //     MaterialButton(
    //       onPressed: () {},
    //       child: Text('Reserve'),
    //       color: Colors.red,
    //     )
    //   ],
    // )
  }
}
