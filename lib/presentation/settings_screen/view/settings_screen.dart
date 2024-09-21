import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isSwitched = false;

  final List<Map<String, dynamic>> listTileData = [
    {
      "image": "assets/Profile.png",
      "title": "My Account",
      "subtitle": "Make changes to your account",
    },
    {
      "image": "assets/Profile.png",
      "title": "Saved Beneficiary",
      "subtitle": "Manage your saved account",
    },
    {
      "image": "assets/Lock.png",
      "title": "Face ID/Touch ID",
      "subtitle": "Manage your device security",
    },
    {
      "image": "assets/Shield Done.png",
      "title": "Two Facror Authentication",
      "subtitle": "Further secure your account safety",
    },
    {
      "image": "assets/Logout.png",
      "title": "Log Out",
      "subtitle": "Further secure your account for safety",
    },
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: size.width * .5),
              child: Center(
                child: Image.asset(
                  'assets/png-clipart-oreo-logo-sandwich-cookie-birthday-cake-biscuits-others-miscellaneous-food_1-removebg-preview.png',
                  width: size.width * .4,
                  height: size.height * .2,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: size.width * .7),
              child: Text(
                "Profile",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            SizedBox(
              height: size.height * .01,
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: size.width * .07, left: size.width * .07),
              child: Container(
                height: size.height * .15,
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                    color: Colors.blue[900],
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/User image.png',
                      width: size.width * .15,
                      height: size.height * .15,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: size.width * .06),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Arun',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '@arun',
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 5 ListTiles with CircleAvatar
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: listTileData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child:
                        Image(image: AssetImage(listTileData[index]['image'])),
                  ),
                  title: Text(
                    listTileData[index]['title'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(listTileData[index]['subtitle'],
                      style: TextStyle(color: Colors.grey)),
                  trailing: index == 3
                      ? Switch(
                          value: _isSwitched,
                          onChanged: (value) {
                            setState(() {
                              _isSwitched = value;
                            });
                          },
                        )
                      : Icon(Icons.arrow_forward_ios_rounded,
                          color: Colors.grey),
                );
              },
            ),

            // "Write More" text
            Padding(
              padding: EdgeInsets.only(right: size.width * .7),
              child: Text(
                'More',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            // 2 more ListTiles with title, subtitle, and action icons
            ListTile(
              leading: CircleAvatar(
                  child: Image(image: AssetImage("assets/Notification.png"))),
              title: Text('Help & Support',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              trailing:
                  Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey),
            ),
            ListTile(
              leading: CircleAvatar(
                  child: Image(image: AssetImage("assets/Heart.png"))),
              title: Text('About App'),
              trailing:
                  Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
