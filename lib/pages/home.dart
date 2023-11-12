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
      body: ListView(
        children: [
          _grayLine(),
          SizedBox(
            height: 15,
          ),
          categoriesSection(),
          SizedBox(
            height: 15,
          ),
          clothesSection(),
          SizedBox(
            height: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Clothes Categories",
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
                height: 190,
                child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.only(left: 20, right: 20),
                    itemCount: categories.length,
                    separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 80,
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

  Column clothesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            'Clothes Products',
            style: TextStyle(
                color: Colors.black,
                fontFamily: "Lato",
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
            width: 400,
            height: 400,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    height: 300,
                    width: 200,
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      color: Color(0xFFF2F8FF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            InkWell(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => AppointScreen(),
                                //   ),
                                // );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                child: Image.asset(
                                  clothes[index].photo,
                                  height: 200,
                                  width: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                margin: EdgeInsets.all(8),
                                width: 45,
                                height: 25,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 239, 66, 66),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: Text(
                                    "-20%",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 150.0),
                                child: Container(
                                  margin: EdgeInsets.all(8),
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.favorite_outline,
                                      color: Color.fromARGB(255, 180, 180, 180),
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: List.generate(
                                  clothes[index].rate,
                                  (starIndex) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                ),
                              ),
                              Text(
                                clothes[index].title,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: const Color.fromARGB(
                                        255, 157, 156, 156)),
                              ),
                              Text(
                                clothes[index].category,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                              SizedBox(height: 8),
                              Text(
                                clothes[index].oldPrice.toString(),
                                style: TextStyle(
                                    color: Color.fromARGB(255, 84, 77, 77),
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 20),
                              ),
                              Text(
                                clothes[index].price.toString(),
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                      height: 1,
                    ),
                itemCount: clothes.length))
      ],
    );
  }

  Column categoriesSection() {
    return Column(
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
