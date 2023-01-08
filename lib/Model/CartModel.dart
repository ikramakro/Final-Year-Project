// ignore_for_file: file_names

class Cart {
  final String name;
  final String image;
  final int price;
  int id;

  Cart(
      {required this.name,
      required this.image,
      required this.price,
      this.id = 0});

  Cart.fromMap(Map<dynamic, dynamic> res)
      : name = res['name'],
        image = res['image'],
        price = res['price'],
        id = res['id'];

  Map<String, Object> toMap() {
    return {'name': name, 'image': image, 'price': price, 'id': id};
  }
}
