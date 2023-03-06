import 'package:flutter/material.dart';
import 'package:bookstore_app/database_helper.dart';
import 'package:bookstore_app/product.dart';

class AddProductScreen extends StatefulWidget {
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  late DatabaseHelper _databaseHelper;
  late TextEditingController _titleController;
  late TextEditingController _authorController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;
  late TextEditingController _imageController;

  @override
  void initState() {
    super.initState();
    _databaseHelper = DatabaseHelper.instance;
    _titleController = TextEditingController();
    _authorController = TextEditingController();
    _descriptionController = TextEditingController();
    _priceController = TextEditingController();
    _imageController = TextEditingController();
  }

  @
