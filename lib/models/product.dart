part of 'models.dart';

class Product {
  final String id;
  final String title;
  final String subTitle;
  final int price;
  final AssetImage image;

  Product({
    @required this.id,
    @required this.title,
    @required this.subTitle,
    @required this.price,
    @required this.image,
  });
}
