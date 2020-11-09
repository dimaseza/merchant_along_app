import 'package:flutter/material.dart';
import 'package:merchant_along_app/models/models.dart';
import 'package:merchant_along_app/theme/theme_value.dart';

class CustomerProvider with ChangeNotifier {
  List<Customer> _itemsCustomer = [
    Customer(
        id: "c1",
        name: "Ade Wayhudi",
        phone: "081123432412",
        address:
            "Jalan Mangga Gang Harum Manis No. 2 Kemanggisan, Jakarta Barat",
        icon: Icon(
          Icons.check,
          color: mainColor,
        )),
    Customer(
      id: "c2",
      name: "Dadang Sutarjo",
      phone: "081329228192",
      address: "Jalan Soekarno Hatta RT 08/02 No. 4 Bandung, Jawa Barat",
      icon: null,
    ),
  ];

  List<Customer> get itemsCustomer {
    return [..._itemsCustomer];
  }

  Customer findById(String id) {
    return _itemsCustomer.firstWhere((cust) => cust.id == id);
  }
}
