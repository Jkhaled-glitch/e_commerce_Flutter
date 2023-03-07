import 'package:flutter/material.dart';

import 'book.dart';
import 'book_details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Book> books = [
    Book(
        title: "Livre 1",
        image: "livre.jpg",
        price: 10.99),
    Book(
        title: "Livre 2",
        image: "livre.jpg",
        price: 14.99),
    Book(
        title: "Livre 3",
        image: "livre.jpg",
        price: 9.99),
    Book(
        title: "Livre 4",
        image: "livre.jpg",
        price: 12.99),
    Book(
        title: "Livre 5",
        image: "livre.jpg",
        price: 8.99),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Liste de Livres',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Liste de Livres'),
        ),
        body: ListView.builder(
          itemCount: books.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Image.asset(books[index].image),
              title: Text(books[index].title),
              trailing: Text("\$${books[index].price}"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookDetails(
                        title: books[index].title,
                        image: books[index].image,
                        price: books[index].price),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

