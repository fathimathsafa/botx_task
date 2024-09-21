
import 'package:flutter/material.dart';
import 'package:oreo_app/presentation/bottom_navigation_screen/view/bottom_navigation_screen.dart';
import 'package:oreo_app/presentation/scanner_screen/view/scanner_screen.dart';

class SuccessScreen extends StatelessWidget {

  const SuccessScreen(
      {super.key, }); // Constructor to accept email

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SingleChildScrollView(
        // Wrap with SingleChildScrollView
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
            Container(
              height: size.height * .4,
              width: size.width * .4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/verified_8948343 1.png"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Text(
              "Item Added Successfully",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Container(
              height: 100,
              width: 200,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          BottomNavigationScreen(email: '',),
                    ),
                  );
                },
                child: Image(image: AssetImage("assets/3rd.png")),
              ),
            ),
            TextButton(
              onPressed: () {
                 Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ScannerScreen(),
                    ),
                  );
              },
              child: Text(
                "Add more",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
