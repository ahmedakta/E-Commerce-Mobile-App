import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
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
