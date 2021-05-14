import 'package:bai_tap/models/categories.dart';
import 'package:bai_tap/models/products.dart';
import 'package:bai_tap/ui/products/products_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesWidget extends StatefulWidget {
  @override
  _CategoriesWidgetState createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  final categories = Categories.init();
  final products = Products.init();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => buildCategory(index),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
          Get.to(ProductsPage(
            title: categories[index].title,
            categoryId: categories[index].id,
            products: products,
          ));
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Image(
          image: AssetImage(categories[index].image),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
