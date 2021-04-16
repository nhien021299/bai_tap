class Categories {
  int id;
  String title;
  String image;

  Categories({this.id, this.title, this.image});

  static List<Categories> init() {
    List<Categories> data = [
      Categories(id: 1, title: "Cold Drink", image: "assets/icons/ic_cold_drink.png"),
      Categories(id: 2, title: "Hot Drink", image: "assets/icons/ic_hot_drinks.png"),
      Categories(id: 3, title: "Hot Pot", image: "assets/icons/ic_hot_pot.png"),
      Categories(id: 4, title: "Fast Food", image: "assets/icons/ic_fast_food.png"),
    ];
    return data;
  }
}
