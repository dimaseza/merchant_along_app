part of 'pages.dart';

class OrderPerCustomerPage extends StatelessWidget {
  static const routeName = '/order-per-customer';

  @override
  Widget build(BuildContext context) {
    final customerData = Provider.of<CustomerProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Order per Customer",
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
                  "List Order per Customer",
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
            children: customerData.itemsCustomer
                .map(
                  (cust) => Padding(
                    padding: EdgeInsets.fromLTRB(
                      defaultMargin,
                      0,
                      defaultMargin,
                      20,
                    ),
                    child: ListPerCustomer(
                      cust,
                      () {
                        Navigator.of(context).pushNamed(
                          DetailOrderPerCustomerPage.routeName,
                          arguments: cust.id,
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
