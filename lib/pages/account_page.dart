part of 'pages.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _postCodeController = TextEditingController();

  var _isPayService = false;
  var _isPaySending = false;

  File _image;

  Future getImage() async {
    var image = await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
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
                "AKUN SAYA",
                style: blackTextFont.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "UPDATE AKUN",
                style: blackTextFont.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
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
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: _image == null
                                ? AssetImage(
                                    "assets/images/user_pic.png",
                                  )
                                : FileImage(_image),
                            fit: BoxFit.cover),
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
                            color: Colors.grey,
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
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: "Nama",
                      ),
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                    ),
                    TextField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        labelText: "No. HP",
                      ),
                      maxLines: 1,
                      keyboardType: TextInputType.phone,
                    ),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                      ),
                      maxLines: 1,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // SizedBox(
        //   height: MediaQuery.of(context).size.height * 0.02,
        // ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: TextField(
            controller: _addressController,
            decoration: InputDecoration(
              labelText: "Alamat",
            ),
            maxLines: 3,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: TextField(
            controller: _postCodeController,
            decoration: InputDecoration(
              labelText: "Kode Pos",
            ),
            maxLines: 1,
            maxLength: 5,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        ListTile(
          title: Text(
            "Biaya Layanan",
            style: blackTextFont.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: Switch(
            activeColor: mainColor,
            value: _isPayService,
            onChanged: (value) {
              setState(() {
                _isPayService = value;
              });
            },
          ),
        ),
        ListTile(
          title: Text(
            "Biaya Ongkos Kirim",
            style: blackTextFont.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: Switch(
            activeColor: mainColor,
            value: _isPaySending,
            onChanged: (value) {
              setState(() {
                _isPaySending = value;
              });
            },
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
      ],
    );
  }
}
