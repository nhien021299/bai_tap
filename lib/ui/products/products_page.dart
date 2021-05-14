import 'package:bai_tap/models/products.dart';
import 'package:bai_tap/ui/products/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsPage extends StatelessWidget {
  final String title;
  final int categoryId;
  final List<Products> products;

  ProductsPage({Key key, this.title, this.products, this.categoryId}) : super(key: key);

  final List<Products> filteredProducts = [];

  @override
  Widget build(BuildContext context) {
    if(filteredProducts.isBlank){
      products.forEach((e) {
        if (e.categoryId == categoryId) {
          filteredProducts.add(e);
        }
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Container(
          child: GridView.builder(
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            scrollDirection: Axis.vertical,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.8, crossAxisSpacing: 10, mainAxisSpacing: 10),
            itemCount: filteredProducts.length,
            itemBuilder: (BuildContext context, int index) {
              return buildProducts(index);
            },
          ),
        ),
      ),
    );
  }

  Widget buildProducts(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
      child: Container(
        width: 160,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(70)),
        child: GestureDetector(
          onTap: () => Get.to(
            () => ProductDetailPage(
              products: filteredProducts[index],
            ),
          ),
          child: GridTile(
            footer: Container(
              height: 65,
              decoration: BoxDecoration(color: Colors.black26, borderRadius: BorderRadius.circular(20)),
              child: ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    filteredProducts[index].title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                title: Text(
                  "\$${filteredProducts[index].price}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            child: Hero(
              tag: filteredProducts[index].id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image(
                  image: AssetImage(filteredProducts[index].image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
