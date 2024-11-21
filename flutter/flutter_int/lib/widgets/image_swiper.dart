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
        Image.network(_imageUrl,
            height: 200, width: double.infinity, fit: BoxFit.cover),
        ElevatedButton(onPressed: _fetchNewImage, child: Text('Swipe')),
      ],
    );
  }
}
