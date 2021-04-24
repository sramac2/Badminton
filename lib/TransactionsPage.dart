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
          title: Text(
            'Transactions',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: buildTransactionsList(),
      ),
    );
  }

  Widget buildTransactionsList() {
    return ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          return ListTile(
            
            trailing: Text(
              '\$' + transactions[index],
            ),
            leading: CircleAvatar(
              child: Image.asset(imagePaths[index]),
            ),
            title: Text(titles[index]),
            subtitle: Text(subtitles[index]),
          );
        });
  }
}
