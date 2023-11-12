import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiki/models/CategoryModel.dart';
import 'package:jiki/models/ClothesModel.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

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
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _grayLine(),
          SizedBox(
            height: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Categories",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Lato",
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 90,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: 20, right: 20),
                    itemCount: categories.length,
                    separatorBuilder: (context, index) => SizedBox(
                          width: 20,
                        ),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 50,
                        width: 120,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: categories[index].borderColor,
                              width: 1.0,
                            ),
                            image: DecorationImage(
                              image: AssetImage(categories[index]
                                  .photo), // Replace with your image asset
                              fit: BoxFit.cover, // Adjust the BoxFit as needed
                            ),
                            borderRadius: BorderRadius.circular(10)),
                      );
                    }),
              )
            ],
          ),
        ],
      ),
    );
  }

  Container _grayLine() {
    return Container(
      height: 10,
      margin:
          EdgeInsets.only(left: 50, right: 50), // Adjust the padding as needed
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xfffDDDADA), // You can change the color of the border
            width: 2.0,
            // You can adjust the width of the border
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.white,
      title: Container(
        height: 50,
        margin: EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 10),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.8),
              blurRadius: 10,
              spreadRadius: 0.0),
        ], borderRadius: BorderRadius.circular(10)),
        child: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.all(15),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset(
                'assets/icons/search.svg',
              ),
            ),
            suffixIcon: Container(
              width: 70,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    VerticalDivider(
                      indent: 10,
                      endIndent: 10,
                      color: Colors.white,
                      thickness: 0.1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset(
                        'assets/icons/settings.svg',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
            hintText: 'Search ..',
            hintStyle: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 166, 163, 163),
            ),
          ),
        ),
      ),
      leading: Container(
        margin: EdgeInsets.all(8),
        child: SvgPicture.asset(
          'assets/icons/profile.svg',
          width: 30,
        ),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
      ),
      actions: [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(8),
          child: SvgPicture.asset(
            'assets/icons/shopping-cart-3.svg',
            width: 35,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ],
    );
  }
}
