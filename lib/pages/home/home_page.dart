import 'package:flutter/material.dart';
import 'package:fooddelivery/pages/home/main_food_page.dart';

import '../../utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//  late PersistentTabController _controller;
//  List<Widget> _buildScreens(){
//   return [
//     MainFoodPage(),
//     Container(
//       child: Center(child: Text("NextPage")),
//     ),
//     Container(
//       child: Center(child: Text("Next next Page")),
//     ),
//     Container(
//       child: Center(child: Text("Next next next Page")),
//     ),
//   ];
//  }

// List<PersistentBottomNavBarItem> _navBarsItems(){
//  return [
//   PersistentBottomNavBarItem(icon: Icon(CupertinoIcons.home),
//   title: ("Home"),
//   activeColorPrimary: CupertinoColors.activeBlue,
//   inactiveColorPrimary: CupertinoColors.systemGrey),
//   PersistentBottomNavBarItem(icon: Icon(CupertinoIcons.archivebox_fill),
//   title: ("Archive"),
//   activeColorPrimary: CupertinoColors.activeBlue,
//   inactiveColorPrimary: CupertinoColors.systemGrey),
//    PersistentBottomNavBarItem(icon: Icon(CupertinoIcons.cart_fill),
//   title: ("Cart"),
//   activeColorPrimary: CupertinoColors.activeBlue,
//   inactiveColorPrimary: CupertinoColors.systemGrey),
//    PersistentBottomNavBarItem(icon: Icon(CupertinoIcons.person),
//   title: ("Me"),
//   activeColorPrimary: CupertinoColors.activeBlue,
//   inactiveColorPrimary: CupertinoColors.systemGrey),
//  ];
// }

  int _selectedIndex = 0;
  List pages = [
    MainFoodPage(),
    Container(
      child: Center(child: Text("NextPage")),
    ),
    Container(
      child: Center(child: Text("Next next Page")),
    ),
    Container(
      child: Center(child: Text("Next next next Page")),
    ),
  ];

  void onTapNav(int index){
    setState(() {
          _selectedIndex=index;

    });
  }
  // @override
  // void initState() {
  //   super.initState();
  //   _controller=PersistentTabController( initialIndex :0);
  // }


// @override
//   Widget build(BuildContext context) {
//     return PersistentTabView(context,
//     controller: _controller,
//      screens:_buildScreens() ,
//      items: _navBarsItems(),
//      confineInSafeArea: true,
//      backgroundColor: Colors.white,
//      handleAndroidBackButtonPress: true,
//      resizeToAvoidBottomInset: true,
//      stateManagement: true,
//      hideNavigationBarWhenKeyboardShows: true,
//      decoration: NavBarDecoration(
//       borderRadius: BorderRadius.circular(10.0),
//       colorBehindNavBar: Colors.white
//      ),
//      popAllScreensOnTapOfSelectedTab: true,
//      popActionScreens: PopActionScreensType.all,
//      itemAnimationProperties: ItemAnimationProperties(
//       duration: Duration(milliseconds: 200),
//       curve: Curves.ease
//      ),
//      screenTransitionAnimation: ScreenTransitionAnimation(
//       animateTabTransition: true,
//       curve: Curves.ease,
//       duration: Duration(milliseconds: 200),
      
//      ),
//      navBarStyle: NavBarStyle.style1,);
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: Colors.amber,
        onTap: onTapNav,
        showSelectedLabels: false,
        selectedFontSize: 0.0,
        unselectedFontSize: 0.0,
        currentIndex: _selectedIndex,
        showUnselectedLabels: false,
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.archive), label: "History"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Me"),
      ]),
    );
  }
}
