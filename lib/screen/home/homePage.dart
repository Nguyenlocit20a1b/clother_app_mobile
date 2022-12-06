import 'package:clothing_shop/config/app.styles.dart';
import 'package:clothing_shop/screen/details/detail_screen.dart';
import 'package:clothing_shop/screen/home/bodyHome.dart';
import 'package:clothing_shop/screen/productList/productList.dart';
import 'package:clothing_shop/screen/profile/Profile.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: const bodyHome(),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            height: 65 ,
            child: CustomNavigationBar(
              isFloating: false,
              borderRadius: const Radius.circular(40),
              unSelectedColor: kWhite,
              selectedColor: kGrey,
              backgroundColor: kBrown,
              strokeColor: Colors.transparent,
              scaleFactor: 0.5,
              iconSize: 50,
              // scaleCurve: Curves.easeInOut,
              items: [
                CustomNavigationBarItem(
                  icon:  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
                        );
                      },
                      icon: currentIndex == 0
                          ? Image.asset('assets/home-2.png')
                          : Image.asset('assets/home-2.png') ,
                     )
                ),
                CustomNavigationBarItem(
                    icon:  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DetailsScreen()),
                        );
                      },
                      icon: currentIndex == 1
                          ? Image.asset('assets/cart.png')
                          : Image.asset('assets/shopping-cart.png'),
                    )

                ),
                CustomNavigationBarItem(
                    icon:  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ListProduct()),
                        );
                      },
                      icon: currentIndex == 2
                          ? Image.asset('assets/heart-1.png')
                          : Image.asset('assets/heart-1.png'),
                    )
                ),
                CustomNavigationBarItem(
                    icon:  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Profile()),
                        );
                      },
                      icon: currentIndex == 3
                          ? Image.asset('assets/profile.png')
                          : Image.asset('assets/profile.png'),
                    ),
                    )
              ],
              currentIndex: currentIndex,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },

            ),
          ),
        )
    );
  }
}