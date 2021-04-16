
import 'package:bai_tap/widget/tab_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'account_page.dart';
import 'favourite_page.dart';
import 'home_page.dart';
import 'notification_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>{
  @override
  Widget build(BuildContext context) {
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
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
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
          decoration: const BoxDecoration(
          ),
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
