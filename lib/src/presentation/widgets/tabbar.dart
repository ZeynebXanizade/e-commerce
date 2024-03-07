import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_design/src/presentation/provider/basket_provider.dart';
import 'package:ui_design/src/presentation/views/basket.dart';
import 'package:ui_design/src/presentation/views/favorite.dart';
import 'package:ui_design/src/presentation/views/homepage.dart';
import 'package:ui_design/src/presentation/views/profile.dart';
import 'package:badges/badges.dart' as badges;

class TabBarPage extends StatefulWidget {
  const TabBarPage({super.key});

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  int _pageIndex = 0;
  final List<Widget> _tabList = const [
    HomePage(),
    FavoritedPage(),
    BasketPage(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Stack(
        children: [
          _tabList.elementAt(_pageIndex),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
              alignment: const Alignment(0.0, 1.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: BottomNavigationBar(
                    showSelectedLabels: true,
                    showUnselectedLabels: false,
                    selectedItemColor: const Color(0xfffe9ba1),
                    unselectedItemColor: const Color(0xff9e9e9e),
                    backgroundColor: const Color(0xff101221),
                    currentIndex: _pageIndex,
                    onTap: (int index) {
                      setState(() {
                        _pageIndex = index;
                      });
                    },
                    items: [
                      const BottomNavigationBarItem(
                          label: "Home", icon: Icon(Icons.home_filled)),
                      const BottomNavigationBarItem(
                          label: "Fvorite", icon: Icon(Icons.favorite_sharp)),
                      BottomNavigationBarItem(
                        label: "Basket",
                        icon: badges.Badge(
                          position:
                              badges.BadgePosition.topEnd(top: -10, end: -12),
                          showBadge: true,
                          ignorePointer: false,
                          onTap: () {},
                          badgeContent: Consumer<BasketNotifier>(
                              builder: (context, value, child) {
                            int totalQuantity = value.items.fold(
                                0, (sum, item) => sum + (item?.quantity ?? 0));
                            return Text(
                              totalQuantity.toString(),
                              style: const TextStyle(color: Colors.white),
                            );
                          }),
                          badgeAnimation: const badges.BadgeAnimation.rotation(
                            animationDuration: Duration(seconds: 1),
                            colorChangeAnimationDuration: Duration(seconds: 1),
                            loopAnimation: false,
                            curve: Curves.fastOutSlowIn,
                            colorChangeAnimationCurve: Curves.easeInCubic,
                          ),
                          badgeStyle: badges.BadgeStyle(
                            shape: badges.BadgeShape.square,
                            badgeColor: const Color(0xfffe9ba1),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Icon(Icons.shopping_bag_rounded),
                        ),
                      ),
                      const BottomNavigationBarItem(
                          label: "Parametrs",
                          icon: Icon(Icons.person_2_rounded))
                    ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
