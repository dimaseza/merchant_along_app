part of 'models.dart';

class Customer {
  final String id;
  final String name;
  final String phone;
  final String address;
  final Widget icon;

  Customer({
    @required this.id,
    @required this.name,
    @required this.phone,
    @required this.address,
    @required this.icon,
  });
}
