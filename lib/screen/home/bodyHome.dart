import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../model/Product.dart';
import '../../config/app.styles.dart';
import '../../config/size_config.dart';
import '../../model/data.dart';
import '../details/detail_screen.dart';
import '../productList/productList.dart';
import '../profile/Profile.dart';
class bodyHome extends StatefulWidget {
  const bodyHome({Key? key}) : super(key: key);

  @override
  State<bodyHome> createState() => _bodyHomeState();
}

class _bodyHomeState extends State<bodyHome> {
  int current = 0;
  int _clickFavorite = 0;
  bool showAppBarBtn = true;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: ListView(
        // controller: _scrollController,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPaddinHorizontal),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Hello, Welcome TaoBao shop 👋 ",
                      style: kEncodeSansRagular.copyWith(
                        color: kDarkBrowm,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                      ),
                    ),
                    Text(
                      "TaoBao",
                      style: kEncodeSansBold.copyWith(
                        color: kDarkBrowm,
                        fontSize: SizeConfig.blockSizeHorizontal! * 4,
                      ),
                    ),
                  ],
                ),

                InkWell(
                    child :  const  CircleAvatar(
                      radius: 20,
                      backgroundColor: kGrey,
                      backgroundImage:  AssetImage('assets/images/avata.jpg'),
                    ) ,
                    onTap: () {
                      Navigator.push(
                        context, MaterialPageRoute(
                          builder: (context) => const Profile()
                      ),
                      );
                    }
                )
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          // Search
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPaddinHorizontal),
            child: Row(
              children: [
                Expanded(
                  child: TextField(

                    style: kEncodeSansRagular.copyWith(
                      color: kDarkBrowm,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                    ),
                    // controller: TextEditingController(),
                    decoration: InputDecoration(

                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                        const EdgeInsets.symmetric(horizontal: 13),
                        prefixIcon: const IconTheme(
                            data: IconThemeData(
                              color: kDarkGrey,
                            ),
                            child:  Icon(Icons.search)),
                        hintText: 'Search clothers ...',
                        border: kInputBorder,
                        errorBorder: kInputBorder,
                        disabledBorder: kInputBorder,
                        focusedBorder: kInputBorder,
                        focusedErrorBorder: kInputBorder,
                        enabledBorder: kInputBorder,
                        hintStyle: kEncodeSansRagular.copyWith(
                          color: kDarkGrey,
                          fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                        )),

                    // Search Product
                    onChanged: (value) => searchProduct(value) ,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Container(
                  height: 50,
                  width: 50,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                    color: kBlack,
                  ),
                  child: Image.asset('assets/Filter.png'),
                )
              ],
            ),
          ),

          const SizedBox(
            height: 24,
          ),

          SizedBox(
            width: double.infinity,
            height: 36,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: demoProducts.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context, MaterialPageRoute(builder: (context ) => const ListProduct()),
                      );
                      setState(() {
                        current = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        left: index == 0 ? kPaddinHorizontal : 15,
                        right: index == categories.length - 1
                            ? kPaddinHorizontal
                            : 0,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      height: 36,
                      decoration: BoxDecoration(
                        color: current == index ? kBrown : kWhite,
                        borderRadius: BorderRadius.circular(8),
                        border: current == index
                            ? null
                            : Border.all(
                          color: kLightGrey,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Image.asset(current == index
                              ? 'assets/${icons[index]}.png'
                              : 'assets/${icons[index]}.png',),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            categories[index],
                            style: kEncodeSansMedium.copyWith(
                              color: current == index ? kWhite : kDarkBrowm,
                              fontSize: SizeConfig.blockSizeHorizontal! * 3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          const SizedBox(
            height: 32,
          ),
          MasonryGridView.count(
            reverse: false,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            itemCount: demoProducts.length,
            padding: const EdgeInsets.symmetric(
              horizontal: kPaddinHorizontal,
            ),
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Positioned(
                          child: InkWell (
                            child:  ClipRRect(
                              borderRadius: BorderRadius.circular(kBorderRadius),
                              child: Image.asset(
                                'assets/images/${demoProducts[index].images}.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const DetailsScreen()),
                              );
                            },
                          )),
                      Positioned(
                        right: 10,
                        top: 10,
                        width: 30,
                        height: 30,
                        child: ClipOval(
                          child: Material(
                            clipBehavior :  Clip.none,
                            color: kDarkBrowm,
                            child: InkWell(
                              splashColor: Colors.green,
                              onTap: () {
                                setState(() {
                                  _clickFavorite = index;
                                });
                              },
                              child:  Icon(
                                _clickFavorite == index ? Icons.favorite_rounded : Icons.favorite_border_outlined ,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Positioned(
                      child: Text(demoProducts[index].title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: kEncodeSansBold.copyWith(
                            color: kDarkBrowm,
                            fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                          ))),
                  Text('Dress modern',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: kEncodeSansRagular.copyWith(
                        color: kGrey,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3,
                      )),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //dàn đều giữa về 2 phía
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text( '${demoProducts[index].price} \$',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: kEncodeSansBold.copyWith(
                            color: kDarkBrowm,
                            fontSize: SizeConfig.blockSizeHorizontal! * 3,
                          )),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: kYellow,
                            size: 16,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text( '${demoProducts[index].rating}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: kEncodeSansMedium.copyWith(
                                color: kDarkBrowm,
                                fontSize: SizeConfig.blockSizeHorizontal! * 3,
                              )),
                        ],
                      )
                    ],
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }

  void searchProduct(String value) {
    setState(() {
      // products = products.where(element) => element ;
      demoProducts = demoProducts.where((element) => element.title.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }

}
