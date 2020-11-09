part of 'widgets.dart';

class DetailCustomer extends StatelessWidget {
  final Customer customer;

  DetailCustomer(this.customer);

  @override
  Widget build(BuildContext context) {
    return Card(
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
            ],
          ),
        ),
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
