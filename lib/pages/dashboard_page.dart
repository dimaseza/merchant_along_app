part of 'pages.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: defaultMargin,
        vertical: 30,
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              createIconMenu(
                "Order per Consumer",
                () {
                  Navigator.of(context)
                      .pushNamed(OrderPerCustomerPage.routeName);
                },
              ),
              createIconMenu(
                "Order per Produk",
                () {
                  Navigator.of(context)
                      .pushNamed(OrderPerProductPage.routeName);
                },
              ),
              createIconMenu("Order per Produk", () {}),
              createIconMenu("Order per Produk", () {}),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              createIconMenu("History\nOrder", () {}),
              createIconMenu("Order per Produk", () {}),
              createIconMenu("Order per Produk", () {}),
              createIconMenu("Order per Produk", () {}),
            ],
          ),
        ],
      ),
    );
  }

  Widget createIconMenu(
    String text,
    Function onTap,
  ) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (onTap != null) {
            onTap();
          }
        },
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 35,
                width: 35,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: mainColor),
                child: Icon(
                  Icons.people,
                  color: Colors.white,
                ),
              ),
              Text(
                text,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: blackTextFont.copyWith(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
