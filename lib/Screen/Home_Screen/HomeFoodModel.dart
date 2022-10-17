// ignore: file_names
class FoodModel {
  static final items = [
    Item(
        name: "Hamburger",
        image:
            "https://beptruong.edu.vn/wp-content/uploads/2013/04/hamburger-han-quoc-thanh-pham-ngon-600x400.jpg",
        detail1: "Món ăn tiêu biểu của người Mỹ",
        detail2: "Món ăn nhanh tiện dụng",
        price: "39.000 đ"),
  ];
}

class Item {
  final String name;
  final String image;
  final String detail1;
  final String detail2;
  final String price;

  Item(
      {required this.name,
      required this.image,
      required this.detail1,
      required this.detail2,
      required this.price});
}
