part of 'pages.dart';

class OrderPerProductPage extends StatelessWidget {
  static const routeName = '/order-per-product';

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Order per Product",
          style: whiteTextFont,
        ),
        backgroundColor: mainColor,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin,
              vertical: MediaQuery.of(context).size.height * 0.02,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  "List Order per Produk",
                  style: blackTextFont.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Filter",
                  style: blackTextFont.copyWith(
                    color: Colors.blue,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: product.productItems
                .map(
                  (prod) => Padding(
                    padding: EdgeInsets.fromLTRB(
                      defaultMargin,
                      0,
                      defaultMargin,
                      20,
                    ),
                    child: ListPerProduct(
                      prod,
                      () {
                        Navigator.of(context).pushNamed(
                          DetailOrderPerProductPage.routeName,
                          arguments: prod.id,
                        );
                      },
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
