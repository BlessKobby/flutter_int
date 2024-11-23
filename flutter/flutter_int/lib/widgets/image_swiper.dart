import 'dart:math';
import 'package:flutter/material.dart';

class ImageSwiper extends StatefulWidget {
  const ImageSwiper({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ImageSwiperState createState() => _ImageSwiperState();
}

class _ImageSwiperState extends State<ImageSwiper> {
  String _imageUrl = 'https://robohash.org/c45.png';

  void _fetchNewImage() {
    final randomString = Random().nextInt(1000).toString();
    setState(() {
      _imageUrl = 'https://robohash.org/$randomString.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onHorizontalDragEnd: (details) {
            if (details.primaryVelocity! < 0) {
              _fetchNewImage();
            } else if (details.primaryVelocity! > 0) {
              _fetchNewImage();
            }
          },
          child: Dismissible(
            key: Key(_imageUrl),
            direction: DismissDirection.horizontal,
            onDismissed: (direction) {
              _fetchNewImage();
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white, // White background
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
                image: DecorationImage(
                  image: NetworkImage(_imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _fetchNewImage,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 4,
            shadowColor: Colors.blueAccent.withOpacity(0.3),
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 32),
          ),
          child: Text(
            'Tap',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
