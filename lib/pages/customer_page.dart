part of 'pages.dart';

class CustomerPage extends StatefulWidget {
  @override
  _CustomerPageState createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  @override
  Widget build(BuildContext context) {
    final customerData = Provider.of<CustomerProvider>(context);

    return ListView(
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
                "List Customer",
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
                  child: ListCustomer(
                    cust,
                    () {},
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
