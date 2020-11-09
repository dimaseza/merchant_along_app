part of 'pages.dart';

class DetailOrderPerProductPage extends StatelessWidget {
  static const routeName = '/detail-order-per-product';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final product = Provider.of<ProductProvider>(context).findById(productId);

    final customer = Provider.of<CustomerProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Order per Produk",
          style: whiteTextFont,
        ),
        backgroundColor: mainColor,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.02,
              horizontal: defaultMargin,
            ),
            child: Text(
              "Detail Produk",
              style: blackTextFont.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              defaultMargin,
              0,
              defaultMargin,
              20,
            ),
            child: Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  height: 80,
                  child: ListTile(
                    leading: Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: product.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(
                      "Nama : ${product.title}",
                      style: blackTextFont.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Harga & Satuan : ",
                            style: blackTextFont.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: "${product.price} / ",
                            style: blackTextFont.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: "${product.subTitle}",
                            style: blackTextFont.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: defaultMargin,
              bottom: 20,
            ),
            child: Text(
              "List ${customer.itemsCustomer.length} Customer",
              style: blackTextFont.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Column(
            children: customer.itemsCustomer
                .map(
                  (cust) => Padding(
                    padding: EdgeInsets.fromLTRB(
                      defaultMargin,
                      0,
                      defaultMargin,
                      20,
                    ),
                    child: DetailCustomer(cust),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
