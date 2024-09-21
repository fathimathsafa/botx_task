import 'package:flutter/material.dart';
import 'package:oreo_app/presentation/summary_screen/view/summery_screen.dart';

class ScannedProductsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> scannedItems; // List of scanned items

  ScannedProductsScreen({required this.scannedItems});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Column(
        children: [
          // Logo Image
          Padding(
            padding: EdgeInsets.only(right: size.width * .5),
            child: Image.asset(
              'assets/png-clipart-oreo-logo-sandwich-cookie-birthday-cake-biscuits-others-miscellaneous-food_1-removebg-preview.png',
              width: 100,
              height: 100,
            ),
          ),
          // Title Text
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Item',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Add more",
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              ],
            ),
          ),
          // List of Scanned Products
          Expanded(
            child: scannedItems.isNotEmpty
                ? ListView.builder(
                    itemCount: scannedItems.length,
                    itemBuilder: (context, index) {
                      final item = scannedItems[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: Colors.white,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            leading: Image.network(
                              item['image']!,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(Icons.error);
                              },
                            ),
                            title: Text(item['title']!),
                            subtitle: Text(item['subtitle']!),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    // Handle quantity decrement
                                  },
                                ),
                                Text(
                                  '${item['quantity']}',
                                  style: TextStyle(fontSize: 18),
                                ),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    // Handle quantity increment
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text('No products scanned yet!'),
                  ),
          ),
          // Material Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: MaterialButton(
              onPressed: () {
                // Navigate to the ProductDetailsScreen with all products
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsScreen(
                      logoPath:
                          'assets/png-clipart-oreo-logo-sandwich-cookie-birthday-cake-biscuits-others-miscellaneous-food_1-removebg-preview.png',
                      products: scannedItems,  // Pass the list of scanned items
                    ),
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
