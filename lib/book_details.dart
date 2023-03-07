import 'package:flutter/material.dart';

class BookDetails extends StatefulWidget {
  final String title;
  final String image;
  final double price;

  const BookDetails({Key? key, required this.title, required this.image, required this.price})
      : super(key: key);

  @override
  _BookDetailsState createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  int _quantity = 1;

  void _addToCart() {
    // Ajouter le contenu dans le panier avec la quantité sélectionnée
    print('Ajouté au panier: ${widget.title}, $_quantity, ${widget.price * _quantity}\$');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(widget.image),
          SizedBox(height: 20),
          Text(
            widget.title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            "\$${widget.price}",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Quantité:'),
              SizedBox(width: 10),
              Container(
                width: 50,
                child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      _quantity = int.tryParse(value) ?? 1;
                    });
                  },
                  controller: TextEditingController(text: '1'),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _addToCart,
            child: Text('Ajouter au panier'),
          ),
        ],
      ),
    );
  }
}


  