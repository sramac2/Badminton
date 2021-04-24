import 'package:badminton/CommonHelpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionsPage extends StatefulWidget {
  State<StatefulWidget> createState() => TransactionsState();
}

class TransactionsState extends State<TransactionsPage> {
  CommonHelper commonHelper = CommonHelper();
  List<String> transactions = ['23', '12', '32', '8', '9', '122'];
  List<String> imagePaths = [
    'assets/images/ARC/logo.jpg',
    'assets/images/ARC/logo.jpg',
    'assets/images/ABC/logo.png',
    'assets/images/ABC/logo.png',
    'assets/images/ARC/logo.jpg',
    'assets/images/ABC/logo.png',
  ];

  List<String> titles = [
    'Atlanta Recreation Club- ARC',
    'Atlanta Recreation Club- ARC',
    'Atlanta Badminton Club- ABC',
    'Atlanta Badminton Club- ABC',
    'Atlanta Recreation Club- ARC',
    'Atlanta Badminton Club- ABC'
  ];

  List<String> subtitles = [
    'Played on 4/22',
    'Played on 4/2',
    'Played on 4/12',
    'Played on 4/23',
    'Played on 4/20',
    'Played on 4/29',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Transcation'),
        ),
        body: buildTransactionsList(),
      ),
    );
  }

  Widget buildTransactionsList() {
    return ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TranscationDetails(
                            imagePath: imagePaths[index],
                            transactions: transactions[index],
                            playedOn: subtitles[index])));
              },
              child: ListTile(
                trailing: Text(
                  '\$' + transactions[index],
                ),
                leading: CircleAvatar(
                  child: Image.asset(imagePaths[index]),
                ),
                title: Text(titles[index]),
                subtitle: Text(subtitles[index]),
              ));
        });
  }
}

class TranscationDetails extends StatefulWidget {
  TranscationDetails(
      {Key key, this.imagePath, this.transactions, this.playedOn})
      : super(key: key);
  String imagePath, transactions, playedOn;
  @override
  _TranscationDetailsState createState() => _TranscationDetailsState();
}

class _TranscationDetailsState extends State<TranscationDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
              child: Icon(Icons.arrow_back, color: Colors.black),
              onTap: () {
                Navigator.pop(context);
              }),
          title: Text(
            'Transactions details',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 20.0),
              height: 200.0,
              child: Card(
                elevation: 20.0,
                child: Image.asset(widget.imagePath),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text("Payment method: Card"),
            SizedBox(
              height: 10.0,
            ),
            Text("Date of game:" + widget.playedOn),
            SizedBox(
              height: 10.0,
            ),
            Text("Booked fee : " + widget.transactions + "\$"),
            SizedBox(
              height: 10.0,
            ),
            // ignore: missing_required_param
            // ignore: deprecated_member_use
            RaisedButton(onPressed: () {}, child: Text("Re-book my court")),
          ],
        )));
  }
}
