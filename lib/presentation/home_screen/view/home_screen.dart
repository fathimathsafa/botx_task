import 'package:flutter/material.dart';
import 'package:oreo_app/presentation/filtering_screen/view/filtering_screen.dart';
import 'package:oreo_app/presentation/scanner_screen/view/scanner_screen.dart';

class HomeScreen extends StatelessWidget {
  final String email;
  HomeScreen({required this.email}); 

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> tileData = [
      {'title': 'Raw Material', 'subtitle': 'Today'},
      {'title': 'Products', 'subtitle': 'Today'},
      {'title': 'Raw Material', 'subtitle': 'Today'},
      {'title': 'Products', 'subtitle': 'Today'},
    ];
    var size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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

            ListTile(
              title: Text(
                "Hello",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(email), 
              trailing: CircleAvatar(
                backgroundImage:
                    AssetImage('assets/User image.png'),
                radius: 30,
              ),
            ),

            Padding(
              padding: EdgeInsets.only(
                  right: size.width * .01, left: size.width * .01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ScannerScreen()));
                      },
                      child: _buildGridItem(
                          "Scan New", "Scanned 0", 'assets/Vector.png')),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FilteringScreen()));
                      },
                      child: _buildGridItem(
                          "View All", "Checkouts 0", 'assets/Frame.png')),
                ],
              ),
            ),
            SizedBox(height: size.height * .02),
            Padding(
              padding: EdgeInsets.only(left: size.width * .05),
              child: Text(
                "Some Information",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: tileData.length,
              itemBuilder: (context, index) {
                final tile = tileData[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 16.0),
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tile['title'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            tile['subtitle'],
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildStadiumContainer('Report', Colors.red, false),
                          SizedBox(height: 5),
                          _buildStadiumContainer('6 Bags', Colors.white, true),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(String title, String subtitle, String imagePath) {
    return Container(
      height: 180,
      width: 140,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.pink[50],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(imagePath),
          ),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(subtitle),
        ],
      ),
    );
  }

  Widget _buildStadiumContainer(String text, Color color, bool isRed) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      decoration: BoxDecoration(
        color: isRed ? Colors.red : color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isRed ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
