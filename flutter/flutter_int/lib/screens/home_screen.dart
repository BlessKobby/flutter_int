import 'package:flutter/material.dart';
import '../widgets/coin_card.dart';
import '../widgets/image_swiper.dart';
import 'dart:math'; // For random positioning

class HomeScreen extends StatelessWidget {
  // Proper constructor syntax for a StatelessWidget with a key
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List of currency symbols
    final currencySymbols = ['€', '£', '¥', '₹', '₣', '₿'];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(color: Colors.black), // Black home inscription
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey, // Blue-grey background for the header
        elevation: 1,
        actions: [
          // Logout button in red
          IconButton(
            icon: Icon(Icons.logout),
            color: Colors.red, // Red color for the logout button
            onPressed: () {
              // Redirect to the login page
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height, // Full screen height
        color: Colors.grey[200], // Light gray background
        child: Stack(
          children: [
            // Watermark: Currency symbols randomly placed
            ...List.generate(30, (index) {
              final random = Random();
              final symbol =
                  currencySymbols[random.nextInt(currencySymbols.length)];
              final size = random.nextInt(10) + 18.0; // Random font size
              final opacity = random.nextDouble() * 0.2 + 0.1; // Random opacity

              // Random position within the screen
              final top =
                  random.nextDouble() * MediaQuery.of(context).size.height;
              final left =
                  random.nextDouble() * MediaQuery.of(context).size.width;

              return Positioned(
                top: top,
                left: left,
                child: Opacity(
                  opacity: opacity,
                  child: Text(
                    symbol,
                    style: TextStyle(
                      fontSize: size,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            }),

            // Main content: CoinCard and ImageSwiper
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CoinCard(), // Coin Card Widget
                    SizedBox(height: 20),
                    ImageSwiper(), // Image Swiper Widget
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
