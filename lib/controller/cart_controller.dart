import 'package:bai_tap/models/carts.dart';
import 'package:get/get.dart';

class CartController extends GetxController{
  final _counter = Rx<int>(0);
  int get counter => _counter.value;

  void updateCartLength(){
    _counter.value = Cart.cart.length;
  }
}