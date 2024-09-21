import 'dart:convert'; // For JSON encoding/decoding
import 'package:flutter/material.dart';
import 'package:oreo_app/presentation/bottom_navigation_screen/view/bottom_navigation_screen.dart';
import 'package:oreo_app/presentation/product_adding_screen/view/product_adding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mobile_scanner/mobile_scanner.dart'; // For QR scanning

class ScannerScreen extends StatefulWidget {
  @override
  _ScannerScreenState createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  List<Map<String, dynamic>> scannedItems = [];

  @override
  void initState() {
    super.initState();
    _loadScannedItems(); // Load scanned items when screen is opened
  }

  // Load scanned items from local storage
  Future<void> _loadScannedItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedData = prefs.getString('scannedItems');
    if (storedData != null) {
      setState(() {
        scannedItems = List<Map<String, dynamic>>.from(jsonDecode(storedData));
      });
    }
  }

  // Save scanned items to local storage
  Future<void> _saveScannedItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('scannedItems', jsonEncode(scannedItems));
  }

  // Handle QR code detection and add the product to the list
  void _onDetect(BarcodeCapture barcodeCapture) {
    final List<Barcode> barcodes = barcodeCapture.barcodes;
    final String? rawValue =
        barcodes.isNotEmpty ? barcodes.first.rawValue : null;

    if (rawValue != null) {
      try {
        final Map<String, dynamic> qrData = jsonDecode(rawValue);

        // Ensure the scanned QR code contains image, title, and subtitle
        final String? imageUrl = qrData['image'];
        final String? title = qrData['title'];
        final String? subtitle = qrData['subtitle'];

        if (imageUrl != null && title != null && subtitle != null) {
          setState(() {
            // Check if the product already exists in the list
            final existingItem = scannedItems.firstWhere(
              (item) => item['title'] == title,
              orElse: () =>
                  {'quantity': 0}, // Return an empty map with quantity 0
            );

            if (existingItem['quantity'] != 0) {
              // If it exists, increase the quantity
              existingItem['quantity']++;
            } else {
              // If it doesn't exist, add a new product
              scannedItems.add({
                'image': imageUrl,
                'title': title,
                'subtitle': subtitle,
                'quantity': 1,
              });
            }
          });
          // Save the updated scanned items list locally
          _saveScannedItems();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Invalid QR code format')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to parse QR code')),
        );
      }
    }
  }

  // Navigate to the screen that displays the scanned products
  void _showScannedProductsScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ScannedProductsScreen(scannedItems: scannedItems),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BottomNavigationScreen(email: "")));
            },
            child: Icon(
              Icons.arrow_back,
            )),
        title: Text('Scan Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.list),
            onPressed:
                _showScannedProductsScreen, // Go to scanned products screen
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: MobileScanner(onDetect: _onDetect),
          ),
          // Button to go to the list of scanned products
          ElevatedButton(
            onPressed: _showScannedProductsScreen,
            child: Text('View Scanned Products'),
          ),
        ],
      ),
    );
  }
}

// Scanned products screen that shows the list of scanned items
