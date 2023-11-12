import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiki/models/CategoryModel.dart';
import 'package:jiki/models/ClothesModel.dart';

class ProductShowPage extends StatefulWidget {
  ProductShowPage({super.key});

  @override
  State<ProductShowPage> createState() => _HomePageState();
}

class _HomePageState extends State<ProductShowPage> {
  List<CategoryModel> categories = [];
  List<ClothesModel> clothes = [];

  void _getInitialInfo() {
    categories = CategoryModel.getCategories();
    clothes = ClothesModel.getClothes();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
      // appBar: appBar(),
      backgroundColor: Colors.white,
    );
  }
}
