import 'package:flutter/material.dart';
import 'package:oreo_app/presentation/bottom_navigation_screen/view/bottom_navigation_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    var size = MediaQuery.sizeOf(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: size.height * .45,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/Vector 2 (1).png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    "assets/png-clipart-oreo-logo-sandwich-cookie-birthday-cake-biscuits-others-miscellaneous-food_1-removebg-preview.png",
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(right: size.width * .3),
            child: Text(
              "Welcome Back",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),
          ),
          SizedBox(height: size.height * .01),
          Padding(
            padding: EdgeInsets.only(right: size.width * .8),
            child: Text(
              "Email",
              style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: size.height * .02),
          Padding(
            padding: EdgeInsets.only(left: size.width * .05, right: size.width * .05),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextFormField(
                controller: emailController,
                textInputAction: TextInputAction.next,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  filled: true,
                  hintText: "Enter Email",
                  hintStyle: TextStyle(color: Colors.grey),
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: size.height * .02),
          Padding(
            padding: EdgeInsets.only(right: size.width * .7),
            child: Text(
              "Password",
              style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: size.height * .02),
          Padding(
            padding: EdgeInsets.only(left: size.width * .05, right: size.width * .05),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextFormField(
                controller: passwordController,
                textInputAction: TextInputAction.done,
                obscureText: true,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  filled: true,
                  hintText: "Enter the Password",
                  hintStyle: TextStyle(color: Colors.grey),
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: size.height * .05),
          InkWell(
            onTap: () {
              String email = emailController.text;
              String password = passwordController.text;

              // Validate email and password
              if (email.isEmpty || password.isEmpty) {
                // Show an alert dialog if validation fails
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Error'),
                    content: Text('Please enter both email and password.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );
              } else {
                // Navigate to BottomNavigationScreen if both fields are filled
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomNavigationScreen(email: email),
                  ),
                );
              }
            },
            child: Container(
              height: size.height * .085,
              width: size.width * .9,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/login.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
