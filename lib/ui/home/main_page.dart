import 'package:badges/badges.dart';
import 'package:bai_tap/controller/cart_controller.dart';
import 'package:bai_tap/models/carts.dart';
import 'package:bai_tap/ui/cart/cart_page.dart';
import 'package:bai_tap/ui/widgets/tab_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../account/account_page.dart';
import '../favourite/favourite_page.dart';
import 'home_page.dart';
import '../notification/notification_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.1,
          backgroundColor: Color(0xFF202020),
          title: Text("Eternity"),
          actions: [
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
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
        body: TabBarView(
          children: [
            HomePage(),
            FavouritePage(),
            NotificationPage(),
            AccountPage(),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(),
          child: TabBar(
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            indicatorWeight: 2,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Colors.white,
            tabs: [
              TabItemWidget(
                icon: Icons.home,
                name: "Home",
              ),
              TabItemWidget(
                icon: Icons.favorite,
                name: "Favourite",
              ),
              TabItemWidget(
                icon: Icons.notifications,
                name: "Notification",
              ),
              TabItemWidget(
                icon: Icons.account_circle,
                name: "Account",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
