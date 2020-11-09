part of 'pages.dart';

class EditProductPage extends StatefulWidget {
  static const routeName = '/edit-product';

  @override
  _EditProductPageState createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _satuanController = TextEditingController();
  TextEditingController _minimumController = TextEditingController();

  var _editedProduct = Product(
    id: null,
    title: '',
    subTitle: '',
    price: 0,
    image: AssetImage(''),
  );
  var _initValues = {
    'title': '',
    'subTitle': '',
    'price': '',
    'image': '',
  };
  var _isInit = true;
  var _isLoading = false;

  File _image;

  Future getImage() async {
    var image = await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(image.path);
    });
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final productId = ModalRoute.of(context).settings.arguments as String;
      if (productId != null) {
        final _editedProduct = Provider.of<ProductProvider>(
          context,
          listen: false,
        ).findById(productId);
        _initValues = {
          'title': _editedProduct.title,
          'subTitle': _editedProduct.subTitle,
          'price': _editedProduct.price.toString(),
        };
        _editedProduct.image == null
            ? Container(
                color: Colors.grey[300],
                child: Icon(
                  Icons.shopping_cart,
                  size: 60,
                  color: Colors.grey[400],
                ),
              )
            : Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: _editedProduct.image,
                    fit: BoxFit.cover,
                  ),
                ),
              );
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tambah Produk",
          style: whiteTextFont,
        ),
        backgroundColor: mainColor,
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultMargin,
                    vertical: MediaQuery.of(context).size.height * 0.02,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 104,
                        width: 90,
                        child: Stack(
                          children: <Widget>[
                            Container(
                              height: 90,
                              width: 90,
                              child: _image == null
                                  ? Container(
                                      color: Colors.grey[300],
                                      child: Icon(
                                        Icons.shopping_cart,
                                        size: 60,
                                        color: Colors.grey[400],
                                      ),
                                    )
                                  : Image.file(
                                      _image,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: GestureDetector(
                                onTap: getImage,
                                child: Container(
                                  height: 28,
                                  width: 28,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.05,
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              initialValue: _initValues['title'],
                              decoration: InputDecoration(
                                labelText: "Nama Produk",
                              ),
                              maxLines: 1,
                              keyboardType: TextInputType.text,
                            ),
                            TextFormField(
                              initialValue: _initValues['price'],
                              decoration: InputDecoration(
                                labelText: "Harga",
                              ),
                              maxLines: 1,
                              keyboardType: TextInputType.number,
                            ),
                            TextFormField(
                              initialValue: _initValues['subTitle'],
                              decoration: InputDecoration(
                                labelText: "Satuan",
                              ),
                              maxLines: 1,
                              keyboardType: TextInputType.text,
                            ),
                            TextFormField(
                              controller: _minimumController,
                              decoration: InputDecoration(
                                labelText: "Minimum Order",
                              ),
                              maxLines: 1,
                              keyboardType: TextInputType.number,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 45,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(
                    horizontal: defaultMargin,
                    vertical: MediaQuery.of(context).size.height * 0.02,
                  ),
                  child: RaisedButton(
                    child: Text(
                      "SIMPAN",
                      style: whiteTextFont.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    color: mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Container(
                  height: 45,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(
                    horizontal: defaultMargin,
                  ),
                  child: FlatButton(
                    child: Text(
                      "HAPUS PRODUK",
                      style: whiteTextFont.copyWith(
                        fontSize: 16,
                        color: mainColor,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                      side: BorderSide(
                        width: 1,
                        color: mainColor,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
