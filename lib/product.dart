class Product {
  final int id;
  final String title;
  final String author;
  final String description;
  final String image;
  final double price;

  Product(
      {required this.id,
      required this.title,
      required this.author,
      required this.description,
      required this.image,
      required this.price});

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json['id'],
        title: json['title'],
        author: json['author'],
        description: json['description'],
        image: json['image'],
        price: json['price'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'author': author,
        'description': description,
        'image': image,
        'price': price,
      };
}
