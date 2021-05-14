import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

import 'components/categories_widget.dart';
import 'components/popular_products_widget.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget imageCarousel = new Container(
      height: 180,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('assets/images/c1.jpg'),
          AssetImage('assets/images/m1.jpeg'),
          AssetImage('assets/images/m2.jpg'),
          AssetImage('assets/images/w1.jpeg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 500),
        dotSize: 3,
        dotBgColor: Colors.transparent,
        indicatorBgPadding: 10.0,
        showIndicator: true,
      ),
    );
    return ListView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      children: [
        imageCarousel,
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Categories',
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        CategoriesWidget(),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Popular Products',
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        PopularProductsWidget(),
      ],
    );
  }
}
