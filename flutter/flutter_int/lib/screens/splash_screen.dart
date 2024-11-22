import 'dart:async';
import 'package:flutter/material.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    // Set up the animation controller and animation
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5), // Bounce duration
    )..repeat(reverse: true); // Loop the animation back and forth

    _animation = Tween<Offset>(
      begin: Offset(0, 0), // Start position
      end: Offset(0, -0.2), // End position for bounce
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // Timer to navigate to the HomeScreen
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of animation controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Watermark background
          Positioned.fill(
            child: Opacity(
              opacity: 0.1,
              child: Center(
                child: Text(
                  "\$",
                  style: TextStyle(
                    fontSize: 200,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
          ),
          // Foreground content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Title
                Text(
                  "Welcome to CoinSwipe",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                // Bouncing dollar sign
                SlideTransition(
                  position: _animation,
                  child: Text(
                    "\$",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Subtitle text
                Text(
                  "Let's see some coins and their prices.",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
