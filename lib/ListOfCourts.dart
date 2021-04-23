import 'package:badminton/CommonHelpers.dart';
import 'package:flutter/material.dart';

import 'CourtTimeListingPage.dart';

class CourtLayoutPage extends StatefulWidget {
  CourtLayoutPage({Key key, this.court}) : super(key: key);
  final Map<String, dynamic> court;
  @override
  _CourtLayoutPageState createState() => _CourtLayoutPageState();
}

Widget cardCourt(String courtName, String assestName) {
  return Container(
      padding: EdgeInsets.only(top: 10.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.green[500],
        ),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(
            assestName,
          ),
          ListTile(
            title: Text(courtName),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ],
      )
      //color: Colors.teal[100],
      );
}

class _CourtLayoutPageState extends State<CourtLayoutPage> {
  CommonHelper commonHelper = CommonHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: commonHelper.buildAppBar(context, 'Choose a court'),
        body: GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CourtTimeListingPage(
                          court: widget.court,
                          courtName: "Court 1",
                        ) //ListCourt(
                    // court: widget.court,
                    //)
                    ));
          },
          child: cardCourt("Court 1", "assets/images/ABC/greenCourt.png"),
        ),
        cardCourt("Court 2", "assets/images/ABC/redCourt.jpg"),
        cardCourt("Court 3", "assets/images/ABC/greenCourt.png"),
        cardCourt("Court 4", "assets/images/ABC/redCourt.jpg"),
      ],
    ));
  }
}

