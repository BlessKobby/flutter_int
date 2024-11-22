import 'package:flutter/material.dart';
import '../services/api_service.dart';

class CoinCard extends StatefulWidget {
  const CoinCard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CoinCardState createState() => _CoinCardState();
}

class _CoinCardState extends State<CoinCard> {
  Map<String, dynamic>? _coinData;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final data = await APIService.fetchCoinPrice();
    setState(() {
      _coinData = data['bpi'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: _coinData == null
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: _coinData!.entries.map((entry) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      '${entry.key}: ${entry.value['rate']}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                  );
                }).toList(),
              ),
      ),
    );
  }
}
