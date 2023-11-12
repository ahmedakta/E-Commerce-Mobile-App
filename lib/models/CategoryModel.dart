import 'package:flutter/material.dart';

class CategoryModel {
  String photo;
  String name;
  Color borderColor;

  CategoryModel({
    required this.photo,
    required this.name,
    required this.borderColor,
  });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

// Shoes Category
    categories.add(
      CategoryModel(
        photo: 'assets/categories_photos/shoes.png',
        name: 'SHOES',
        borderColor: Colors.black,
      ),
    );

// Accesories Category
    categories.add(
      CategoryModel(
        photo: 'assets/categories_photos/accesories.png',
        name: 'ACCESORIES',
        borderColor: Color.fromARGB(170, 87, 88, 7),
      ),
    );

// Clothes Category
    categories.add(
      CategoryModel(
        photo: 'assets/categories_photos/clothes.png',
        name: 'CLOTHES',
        borderColor: Colors.cyan,
      ),
    );

// Extra category
    categories.add(
      CategoryModel(
        photo: 'assets/categories_photos/shoes.png',
        name: 'SHOES',
        borderColor: Colors.black,
      ),
    );

    return categories;
  }
}
