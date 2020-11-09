part of 'pages.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: defaultMargin,
              vertical: MediaQuery.of(context).size.height * 0.02,
            ),
            child: Text(
              "List Produk",
              style: blackTextFont.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: "Cari Produk..",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
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
      floatingActionButton: Container(
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.1,
        ),
        child: FloatingActionButton(
          elevation: 0,
          child: Icon(Icons.add),
          backgroundColor: mainColor,
          tooltip: "Tambah Produk",
          onPressed: () {
            Navigator.of(context).pushNamed(EditProductPage.routeName);
          },
        ),
      ),
    );
  }
}
