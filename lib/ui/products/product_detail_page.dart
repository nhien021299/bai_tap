import 'package:badges/badges.dart';
import 'package:bai_tap/controller/cart_controller.dart';
import 'package:bai_tap/models/carts.dart';
import 'package:bai_tap/models/products.dart';
import 'package:bai_tap/ui/cart/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ProductDetailPage extends StatefulWidget {
  final Products products;

  const ProductDetailPage({Key key, this.products}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        title: Text("Details"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
        actions: [
          Obx(
            () => Badge(
              toAnimate: false,
              position: BadgePosition.topEnd(top: 3, end: 5),
              shape: BadgeShape.circle,
              badgeColor: Colors.red,
              borderRadius: BorderRadius.circular(8),
              badgeContent: Text(cartController.counter.toString(), style: TextStyle(color: Colors.white)),
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () => Get.to(CartPage()),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: size.height * 0.4,
              // width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image(
                  image: AssetImage(widget.products.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              widget.products.title,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
            ),
            Center(
              child: Text(widget.products.description),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                onPressed: () {
                  Cart().addProductToCart(widget.products);
                  cartController.updateCartLength();
                  Fluttertoast.showToast(msg: "Add to cart success");
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                color: Colors.green,
                child: Text(
                  "Add to cart",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
