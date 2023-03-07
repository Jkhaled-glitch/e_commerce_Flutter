import 'package:flutter/material.dart';

class BookDetails extends StatelessWidget {
  final String title;
  final String image;
  final double price;

  BookDetails({required this.title, required this.image, required this.price});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(image),
          SizedBox(height: 16.0),
          Text(title, style: TextStyle(fontSize: 24.0)),
          SizedBox(height: 16.0),
          Text("\$${price.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 20.0)),
        ],
      ),
    );
  }
}
