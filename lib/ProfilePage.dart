import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                child: Center(
                    child: Column(
                  children: <Widget>[
                    Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: <Widget>[
                        CircleAvatar(
                            radius: 50.0,
                            child: Icon(Icons.person, size: 50.0)),
                        Icon(Icons.add_a_photo),
                      ],
                    ),
                    ListTile(
                      leading: Icon(Icons.person, color: Colors.blue),
                      title: Text("ssFriends"),
                      subtitle: Text("Name"),
                      trailing: Icon(Icons.edit),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone, color: Colors.blue),
                      title: Text("+1 225 678 2038"),
                      subtitle: Text("Phone"),
                      trailing: Icon(Icons.edit),
                    ),
                    ListTile(
                      leading: Icon(Icons.location_on, color: Colors.blue),
                      title: Text("Here is my address"),
                      subtitle: Text("Address"),
                      trailing: Icon(Icons.edit),
                    ),
                    ListTile(
                      leading: Icon(Icons.fireplace_sharp, color: Colors.blue),
                      title: Text("457kcal"),
                      subtitle: Text("Total Calories Burnt"),
                    )
                  ],
                )))));
  }
}
