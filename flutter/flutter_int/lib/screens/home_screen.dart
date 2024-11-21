import 'package:flutter/material.dart';
import '../widgets/coin_card.dart';
import '../widgets/image_swiper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CoinCard(),
            ImageSwiper(),
          ],
        ),
      ),
    );
  }
}
