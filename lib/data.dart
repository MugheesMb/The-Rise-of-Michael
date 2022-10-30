class Item {
  final String image;

  Item({
    required this.image,
  });
}

class DataModel {
  static List items = [
    Item(image: "assets/images/p1.jpg"),
    Item(image: "assets/images/p2.jpg"),
    Item(image: "assets/images/p3.jpg"),
    Item(image: "assets/images/p4.jpg"),
    Item(image: "assets/images/p5.jpg"),
    Item(image: "assets/images/p6.jpg"),
  ];
}
