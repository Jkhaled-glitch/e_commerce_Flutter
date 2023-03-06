class Book {
  int id;
  String title;
  String image;

  Book({this.id, this.title, this.image});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'image': image,
    };
  }

  static Book fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'],
      title: map['title'],
      image: map['image'],
    );
  }
}
