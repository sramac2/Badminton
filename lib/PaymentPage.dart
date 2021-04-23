import 'package:flutter/material.dart';

import 'CommonHelpers.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  CommonHelper commonHelper = CommonHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: commonHelper.buildAppBar(context, 'Confirm and Pay'),
        body: Container(
          padding: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
          child: Column(
            children: <Widget>[
              ListTile(title: Text("Your court : Court 3")),
              ListTile(title: Text("Your timing : 11AM - 12 PM")),
              ListTile(title: Text("Payment Method")),
              ListTile(title: Text("Pay by PayPal")),
              TextField(
                decoration: InputDecoration(hintText: "example@example.com"),
              ),
              ListTile(title: Text("Pay by Card")),
              TextField(
                decoration: InputDecoration(hintText: "xxxx xxxx xxxx 2334"),
              ),
              // ignore: deprecated_member_use
              RaisedButton(onPressed: () {}, child: Text("Book my Court"))
            ],
          ),
        ));
  }
}
