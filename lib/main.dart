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
        image: "https://example.com/images/livre1.png",
        price: 10.99),
    Book(
        title: "Livre 2",
        image: "https://example.com/images/livre2.png",
        price: 14.99),
    Book(
        title: "Livre 3",
        image: "https://example.com/images/livre3.png",
        price: 9.99),
    Book(
        title: "Livre 4",
        image: "https://example.com/images/livre4.png",
        price: 12.99),
    Book(
        title: "Livre 5",
        image: "https://example.com/images/livre5.png",
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
              leading: Image.network(books[index].image),
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
