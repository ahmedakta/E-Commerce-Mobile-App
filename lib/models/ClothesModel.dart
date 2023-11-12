import 'dart:ffi';

import 'package:flutter/material.dart';

class ClothesModel {
  String photo;
  String title;
  int rate;

  ClothesModel({
    required this.photo,
    required this.title,
    required this.rate,
  });

  static List<ClothesModel> getClothes() {
    List<ClothesModel> clothes = [];

// Shoes Category
    clothes.add(
      ClothesModel(
        photo: 'assets/categories_photos/shoes.png',
        title: 'SHOES',
        rate: 4,
      ),
    );

// Accesories Category
    clothes.add(
      ClothesModel(
        photo: 'assets/categories_photos/shoes.png',
        title: 'SHOES',
        rate: 4,
      ),
    );

// Clothes Category
    clothes.add(
      ClothesModel(
        photo: 'assets/categories_photos/shoes.png',
        title: 'SHOES',
        rate: 4,
      ),
    );

// Extra category
    clothes.add(
      ClothesModel(
        photo: 'assets/categories_photos/shoes.png',
        title: 'SHOES',
        rate: 4,
      ),
    );

    return clothes;
  }
}
