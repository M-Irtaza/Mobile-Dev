import 'package:flutter/material.dart';

import 'utab_navigation.dart';
import 'btab_navigation.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static const route = '/profile';
  @override
  State<StatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(color: Colors.white),
        child: Center(
          child: Column(children: <Widget>[
            Container(
              child: CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/catProfile.png'),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              child: Text(
                "John Smith",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            SizedBox(
              height: 45,
            ),
            Container(
              width: 350,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.phone),
                          SizedBox(
                            width: 7,
                          ),
                          Text("Phone"),
                        ],
                      ),
                      Text("01234567"),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.email),
                          SizedBox(
                            width: 7,
                          ),
                          Text("Email"),
                        ],
                      ),
                      Text("youremail@gmail.com"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.fingerprint),
                          SizedBox(
                            width: 7,
                          ),
                          Text("Biometric"),
                        ],
                      ),
                      Switch(value: false, onChanged: null),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.location_on),
                          SizedBox(
                            width: 7,
                          ),
                          Text("Address"),
                        ],
                      ),
                      Text(
                        "fort suit - 30, LA",
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
                width: 200,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(UtabNavigation.route);
                    },
                    child: Text("Top Tab Navigation"))),
            SizedBox(
                width: 200,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(BtabNavigation.route);
                    },
                    child: Text("Bottom Tab Navigation"))),
          ]),
        ),
      ),
    );
  }
}
