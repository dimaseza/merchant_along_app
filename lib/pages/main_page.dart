part of 'pages.dart';

class MainPage extends StatefulWidget {
  static const routeName = '/dashboard';

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var isOnline = false;
  var indexPage = 0;
  PageController pageController;

  @override
  void initState() {
    super.initState();

    pageController = PageController(initialPage: indexPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        leading: Switch(
          value: isOnline,
          onChanged: (value) {
            setState(() {
              isOnline = value;
            });
          },
          activeColor: Colors.white,
        ),
        title: isOnline ? Text("Online") : Text("Offline"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              right: 8,
            ),
            child: BadgeCustom(
              child: Icon(
                Icons.notifications,
                color: Colors.white,
              ),
              value: "5",
              color: Colors.red,
              posisitonedTop: 8,
            ),
          ),
          // IconButton(
          //   icon: Icon(Icons.notifications),
          //   onPressed: () {},
          // ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          PageView(
            controller: pageController,
            children: <Widget>[
              DashboardPage(),
              ProductPage(),
              CustomerPage(),
              AccountPage(),
            ],
            onPageChanged: (index) {
              setState(() {
                indexPage = index;
              });
            },
          ),
          createBottomNavBar(),
        ],
      ),
    );
  }

  Widget createBottomNavBar() => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 70,
          color: Colors.white,
          child: BottomNavigationBar(
            currentIndex: indexPage,
            selectedItemColor: mainColor,
            unselectedItemColor: Color(0xFFE5E5E5),
            type: BottomNavigationBarType.fixed,
            elevation: 6,
            onTap: (index) {
              indexPage = index;
              pageController.jumpToPage(index);
            },
            items: [
              BottomNavigationBarItem(
                title: Text("Dashboard"),
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                title: Text("Produk"),
                icon: Icon(Icons.shopping_basket),
              ),
              BottomNavigationBarItem(
                  title: Text("Customer"),
                  icon: Badge(
                    badgeContent: Text(
                      '3',
                      style: whiteTextFont,
                    ),
                    badgeColor: Colors.red,
                    child: Icon(Icons.people),
                  )
                  // Badge(
                  //   child: Icon(Icons.people),
                  //   value: "5",
                  //   posisitonedTop: -0.3,
                  //   color: Colors.red
                  // ),
                  ),
              BottomNavigationBarItem(
                title: Text("Akun"),
                icon: Icon(Icons.person),
              ),
            ],
          ),
        ),
      );
}
