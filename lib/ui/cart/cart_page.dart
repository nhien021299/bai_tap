import 'package:bai_tap/controller/cart_controller.dart';
import 'package:bai_tap/models/carts.dart';
import 'package:bai_tap/models/products.dart';
import 'package:bai_tap/ui/home/main_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  CartController cartController = Get.put(CartController());

  final List<Products> carts = Cart().getCart();
  double sum = 0.0;

  @override
  void initState() {
    super.initState();
    carts.forEach((product) {
      sum += product.price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Details"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Column(
          children: [
            Expanded(
              child: carts.length != 0
                  ? ListView.builder(
                      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                      itemCount: carts.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [buildCartItem(carts[index], index), Divider()],
                        );
                      })
                  : Center(
                      child: Text("Cart is empty !"),
                    ),
            ),
            Row(
              children: [
                Expanded(
                  child: FlatButton(
                    height: 50,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24), side: BorderSide(color: Colors.green)),
                    onPressed: () {
                      carts.clear();
                      cartController.updateCartLength();
                      Get.to(MainPage());
                      Fluttertoast.showToast(msg: "Check out success !");
                    },
                    color: Colors.green,
                    textColor: Colors.white,
                    child: Text("Check out".toUpperCase(), style: TextStyle(fontSize: 14)),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    "Total Price : $sum \$",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCartItem(Products product, int index) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0.5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  product.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text('${product.title} :'),
              ),
            ),
            Expanded(
              child: Text(
                "${product.price} \$",
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  carts.removeAt(index);
                  sum = 0.0;
                  carts.forEach((product) {
                    sum += product.price;
                  });
                });
                cartController.updateCartLength();
              },
              child: Icon(Icons.delete_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
