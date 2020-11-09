part of 'pages.dart';

class DetailOrderPerCustomerPage extends StatelessWidget {
  static const routeName = '/detail-order-per-customer';

  @override
  Widget build(BuildContext context) {
    final customerId = ModalRoute.of(context).settings.arguments as String;
    final customer = Provider.of<CustomerProvider>(
      context,
      listen: false,
    ).findById(customerId);

    final product = Provider.of<ProductProvider>(
      context,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Order per Customer",
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
              "Detail",
              style: blackTextFont.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      createListDetail(
                        "Nama",
                        customer.name,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      createListDetail(
                        "No. HP",
                        customer.phone,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      createListDetail(
                        "Alamat",
                        customer.address,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Text(
                        "TOTAL: ${product.productItems.length} Produk",
                        style: blackTextFont.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          ProductGrid(),
        ],
      ),
    );
  }

  Widget createListDetail(String title, String subTitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Text(
            title,
            style: blackTextFont.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            subTitle,
            style: blackTextFont.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.end,
          ),
        )
      ],
    );
  }
}
