import 'dart:ffi';

import 'package:flutter/material.dart';

class ClothesModel {
  String photo;
  String title;
  String category;
  int price;
  int oldPrice;
  int currency;
  int rate;

  ClothesModel({
    required this.photo,
    required this.title,
    required this.rate,
    required this.category,
    required this.currency,
    required this.price,
    required this.oldPrice,
  });

  static List<ClothesModel> getClothes() {
    List<ClothesModel> clothes = [];

// Shoes Category
    clothes.add(
      ClothesModel(
        photo: 'assets/categories_photos/product.png',
        title: 'Sparkle Blossom Dress',
        category: 'T-SHIRT',
        rate: 4,
        currency: 4,
        price: 45,
        oldPrice: 55,
      ),
    );

// Accesories Category
    clothes.add(
      ClothesModel(
        photo: 'assets/categories_photos/product2.png',
        title: 'Starlight Elegance Gown',
        category: 'DRESS',
        rate: 5,
        currency: 3,
        price: 45,
        oldPrice: 55,
      ),
    );

// Clothes Category
    clothes.add(
      ClothesModel(
        photo: 'assets/categories_photos/product3.png',
        title: 'Whimsical Flutter Skirt',
        category: 'SHOE',
        rate: 2,
        currency: 2,
        price: 45,
        oldPrice: 95,
      ),
    );

// Extra category
    clothes.add(
      ClothesModel(
        photo: 'assets/categories_photos/product.png',
        title: 'Radiant Rainbow Tutu',
        category: 'ACCESSORIES',
        rate: 1,
        currency: 1,
        price: 45,
        oldPrice: 75,
      ),
    );

    return clothes;
  }
}
