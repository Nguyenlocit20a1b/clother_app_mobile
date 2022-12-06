import 'package:flutter/material.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import '../details//components/body.dart';
import 'package:clothing_shop/config/app.styles.dart';

import '../profile/Profile.dart';
class DetailsScreen extends StatefulWidget {
  static String routeName = "/details";
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _MyDetailScreen();
}

class _MyDetailScreen extends State<DetailsScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: const Body(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          height: 60,
          child: CustomNavigationBar(
            isFloating: false,
            borderRadius: const Radius.circular(40),
            unSelectedColor: kWhite,
            selectedColor: kGrey,
            backgroundColor: kBrown,
            strokeColor: Colors.transparent,
            scaleFactor: 0.1,
            iconSize: 60,
            items: [
              CustomNavigationBarItem(
                icon:  IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Profile()),
                    );
                  },
                  icon: Image.asset('assets/shopping-cart.png')
                ),

              ),
            ],
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}

// class DetailsScreen extends StatelessWidget {
//   static String routeName = "/details";
//
//   @override
//   Widget build(BuildContext context) {
//     final ProductDetailsArguments agrs =
//     ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
//     return Scaffold(
//       backgroundColor: Color(0xFFF5F6F9),
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(AppBar().preferredSize.height),
//         child: CustomNavigationBar(
//           isFloating: false,
//           borderRadius: const Radius.circular(40),
//           unSelectedColor: kWhite,
//           selectedColor: kGrey,
//           backgroundColor: kBrown,
//           strokeColor: Colors.transparent,
//           scaleFactor: 0.1,
//           iconSize: 30,
//           items: [
//             CustomNavigationBarItem(
//               icon: Image.asset('assets/shopping-cart.png'),
//             ),
//           ],
//         ),
//       ),
//       body: Body(),
//     );
//   }
// }
//
// class ProductDetailsArguments {
//   final Product product;
//
//   ProductDetailsArguments({required this.product});
// }
