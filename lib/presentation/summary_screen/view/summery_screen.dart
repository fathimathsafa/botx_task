import 'package:flutter/material.dart';
import 'package:oreo_app/presentation/success_screen/view/success_screen.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String logoPath;
  final List<Map<String, dynamic>> products; // List of scanned products

  ProductDetailsScreen({
    required this.logoPath,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    
    return Scaffold(
      body: Column(
        children: [
          // Logo Image
          Padding(
            padding: EdgeInsets.only(right: size.width * .5),
            child: Center(
              child: Image.asset(
                logoPath, // Use logoPath parameter
                width: size.width * .4,
                height: size.height * .2,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          // Date and Time Container
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 6.0,
                    spreadRadius: 1.0,
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        "Date",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Spacer(),
                      Text(
                        DateTime.now().toLocal().toString().split(' ')[0], // Date
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Time",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Spacer(),
                      Text(
                        DateTime.now().toLocal().toString().split(' ')[1].split('.')[0], // Time
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Container for all Product Details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.symmetric(vertical: 8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Raw Material Name',
                              style: TextStyle(fontSize: 18),
                            ),
                            Spacer(),
                            Text(
                              ' ${product['title']}',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * .03),
                        Row(
                          children: [
                            Text(
                              "Batch No",
                              style: TextStyle(fontSize: 18),
                            ),
                            Spacer(),
                            Text(
                              " AB1256",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * .03),
                        Row(
                          children: [
                            Text('Quantity', style: TextStyle(fontSize: 18)),
                            Spacer(),
                            Text(' ${product['subtitle']}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        SizedBox(height: 8),
                        Divider(height: 20, thickness: 1),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
          // Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SuccessScreen(), // Pass email here
                  ),
                );
              },
              textColor: Colors.white,
              child: Image(image: AssetImage("assets/Primary (1).png")),
              minWidth: double.infinity,
              height: 50,
            ),
          ),
        ],
      ),
    );
  }
}
