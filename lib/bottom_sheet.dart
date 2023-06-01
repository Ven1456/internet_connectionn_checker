import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connectionn_checker/bio_metric.dart';
import 'package:internet_connectionn_checker/demo.dart';
import 'package:internet_connectionn_checker/otp_with_firebase.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class PerBottom extends StatefulWidget {
  const PerBottom({Key? key}) : super(key: key);

  @override
  State<PerBottom> createState() => _PerBottomState();
}

class _PerBottomState extends State<PerBottom> {
  final PersistentTabController _controller = PersistentTabController();

  PersistentTabController _popo = PersistentTabController(initialIndex: 0);
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.settings),
        title: ("Settings"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.settings),
        title: ("Settings"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  List<Widget> _buildScreens() {
    return [
     BioMetric(),
      Demo(),
      BioMetric(),
      Demo(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     /* floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.account_circle_outlined),
      ),*/
   /*   floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,*/
      body: PersistentTabView(
        context,
        floatingActionButton:FloatingActionButton(
          onPressed: (){},
          child: Icon(Icons.account_circle_outlined),
        ) ,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style1, // Choose the nav bar style with this property.
      ),
    );
  }
}
