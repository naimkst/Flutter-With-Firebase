import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:firebasewithflutter/const/AppColors.dart';
import 'package:firebasewithflutter/ui/login_screen.dart';
import 'package:firebasewithflutter/ui/scan_screen.dart';
import 'package:firebasewithflutter/ui/screen/cart_screen.dart';
import 'package:firebasewithflutter/ui/screen/favorite_screen.dart';
import 'package:firebasewithflutter/ui/screen/home_screen.dart';
import 'package:firebasewithflutter/ui/screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _bottomNavIndex = 0;
  List<Widget> pages = const [
    HomePage(),
    FavoritePage(),
    Cartpage(),
    ProfilePage(),
  ];

  //List of the page icon
  List<IconData> iconList = const [
    Icons.home,
    Icons.favorite,
    Icons.shopping_basket_rounded,
    Icons.person
  ];

  //List of pages title
  List<String> pageTitleList = const [
    'Home',
    'Favorite',
    'Cart',
    'Profile'
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(pageTitleList[_bottomNavIndex], style: TextStyle(
              color: Constants.blackColor,
              fontWeight: FontWeight.w500,
              fontSize: 24,
            ),
            ),
            Icon(Icons.notifications, color: Constants.blackColor,
            size: 30.0,
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: IndexedStack(
        index: _bottomNavIndex,
        children: pages,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, PageTransition(child: const ScanPage(), type: PageTransitionType.bottomToTop));
        },
        child: Image.asset('assets/images/code-scan-two.png', height: 30.0,),
        backgroundColor: Constants.primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        splashColor: Constants.primaryColor,
        activeColor: Constants.primaryColor,
        inactiveColor: Colors.black.withOpacity(.5),
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index){
          setState(() {
            _bottomNavIndex = index;
          });
        },
      ),
    );
  }
}
