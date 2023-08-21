class ProductModel {
  final String image;
  final String name;
  final double price;
  final int unit;
  //optional constructor
  ProductModel({
    required this.image,
    required this.name,
    required this.price,
    required this.unit,
  });
  Map toJson() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'unit': unit,
    };
  }

  void add(ProductModel product) {}
}

List<ProductModel> product = [
  ProductModel(
    image: 'assets/image/s.png',
    name: 'Jordan Nike',
    price: 399.99,
    unit: 1,
  ),
  ProductModel(
    image: 'assets/image/s1.png',
    name: 'Jordan high',
    price: 240.89,
    unit: 1,
  ),
  ProductModel(
    image: 'assets/image/s2.png',
    name: 'Nike Low',
    price: 550.99,
    unit: 1,
  ),
  ProductModel(
    image: 'assets/image/s3.png',
    name: 'Nike x Traviscott',
    price: 999.99,
    unit: 1,
  ),
  ProductModel(
    image: 'assets/image/s4.png',
    name: 'Jordan Nike',
    price: 399.99,
    unit: 1,
  ),
  ProductModel(
    image: 'assets/image/s5.png',
    name: 'Jordan high',
    price: 240.89,
    unit: 1,
  ),
  ProductModel(
    image: 'assets/image/s6.png',
    name: 'Nike Low',
    price: 550.99,
    unit: 1,
  ),
  ProductModel(
    image: 'assets/image/s8.png',
    name: 'Nike x Traviscott',
    price: 999.99,
    unit: 1,
  ),
  ProductModel(
    image: 'assets/image/s9.png',
    name: 'Nike Low',
    price: 550.99,
    unit: 1,
  ),
  ProductModel(
    image: 'assets/image/s10.png',
    name: 'Nike x Traviscott',
    price: 999.99,
    unit: 1,
  ),
];
