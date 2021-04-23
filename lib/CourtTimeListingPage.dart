
import 'package:flutter/material.dart';

import 'CommonHelpers.dart';
import 'ListOfCourts.dart';
import 'PaymentPage.dart';

class CourtTimeListingPage extends StatefulWidget {
  @override
  CourtTimeListingPage({Key key, this.court, this.courtName}) : super(key: key);
  final Map<String, dynamic> court;
  final String courtName;

  _CourtTimeListPageState createState() => _CourtTimeListPageState();
}

List<String> timing = [];

class _CourtTimeListPageState extends State<CourtTimeListingPage> {
  CommonHelper commonHelper = CommonHelper();
  void makeTimingList(String start, int limit) {
    int s = int.parse(start.substring(0, start.length - 2));
    String isAm =
        (start.substring(start.length - 2, start.length)).toUpperCase();
    for (int i = 0; i <= limit; i++) {
      if (s + i == 12) {
        if (isAm == "AM")
          isAm = "PM";
        else
          isAm = "AM";
        timing.add("12" + isAm);
      } else
        timing.add(((s + i) % 12).toString() + isAm);
    }
    print(timing);
  }

  @override
  Widget build(BuildContext context) {
    makeTimingList(widget.court['open'], widget.court['openingHour']);
    return Scaffold(
        appBar: commonHelper.buildAppBar(context, 'Choose a time'),
        body: ListView.builder(
          itemCount: widget.court['openingHour'],
          itemBuilder: (context, index) {
            String start = timing[index].toString();
            String end = timing[index + 1].toString();
            return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PaymentPage())); //ListCourt(
                  // court: widget.court,
                },
                child: ListTile(
                  leading: CircleAvatar(
                      child: Image.asset("assets/images/ARC/logo.jpg")),
                  trailing: Icon(Icons.arrow_forward_ios),
                  title: Text(start + " - " + end),
                  subtitle: Text(widget.courtName),
                ));
          },
        ));
  }
}