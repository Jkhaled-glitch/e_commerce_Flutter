import 'package:flutter/material.dart';
import 'package:bookstore_app/product_details_screen.dart';
import 'package:bookstore_app/product.dart';
import 'package:bookstore_app/database_helper.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late List<Product> _products;
  late DatabaseHelper _databaseHelper;

  @override
  void initState() {
    super.initState();
    _databaseHelper = DatabaseHelper.instance;
    _refreshProductList();
  }

  void _refreshProductList() async {
    List<Product> x = await _databaseHelper.getProducts();
    setState(() {
      _products = x;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookstore App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/addProduct');
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductDetailsScreen(
                      product: _products[index],
                    ),
                  ),
                ).then((value) {
                  _refreshProductList();
                });
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      _products[index].image,
                      width: 100,
                      height: 100,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _products[index].title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          _products[index].author,
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          _products[index].description,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${_products[index].price.toStringAsFixed(2)} €',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
