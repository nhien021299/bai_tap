
import 'package:bai_tap/models/products.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  final String title;
  final List<Products> products;

  const ProductsPage({Key key, this.title, this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              return buildProducts(index);
            },
          ),
        ),
      ),
    );
  }
  Widget buildProducts(int index){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        width: 160,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(70)),
        child: GestureDetector(
          onTap: () {},
          child: GridTile(
            footer: Container(
              height: 65,
              decoration: BoxDecoration(color: Colors.black26, borderRadius: BorderRadius.circular(20)),
              child: ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    products[index].title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                title: Text(
                  "\$${products[index].price}",
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
              tag: products[index].id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(
                  image: AssetImage(products[index].image),
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
