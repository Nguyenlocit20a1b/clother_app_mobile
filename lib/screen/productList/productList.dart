import 'package:clothing_shop/model/Product.dart';
import 'package:clothing_shop/screen/profile/Update_profile.dart';
import 'package:clothing_shop/screen/home/homePage.dart';
import 'package:clothing_shop/config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:clothing_shop/config/app.styles.dart';
import 'package:clothing_shop/model/data.dart';

import '../profile/Profile.dart';

class ListProduct extends StatefulWidget {
  const ListProduct({Key? key}) : super(key: key);
  @override
  State<ListProduct> createState() => _ListProductState();
}
class _ListProductState extends State<ListProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kLightGrey,
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: kDarkBrowm),
            onPressed: () {
              Navigator.pop(
                context, MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search, color: kDarkBrowm , size: 30,) ,
              onPressed: ( ){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Profile()),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8 , right: 15),
              child: Stack(
                children: [
                  const Icon(
                    Icons.notifications,
                    color: Colors.black,
                    size: 30,
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.topRight,
                    margin: const EdgeInsets.only(top: 5),
                    child: Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xffc32c37),
                          border: Border.all(color: Colors.white, width: 1)),
                      child: const Padding(
                        padding:  EdgeInsets.all(0.0),
                        child: Center(
                          child: Text(
                            // _counter.toString(),
                            '8',
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: ListView(
          children: [
            Text("Gợi Ý Cho Bạn" ,
                style: kEncodeSansRagular.copyWith(
                  fontWeight: FontWeight.bold,
                  color: kDarkBrowm,
                  fontSize: SizeConfig.blockSizeHorizontal! * 6,
                )),
            Builder(
              builder: (context ) {
                return MasonryGridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
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
                                child:  ClipRRect(
                              borderRadius: BorderRadius.circular(kBorderRadius),
                              child: Image.asset(
                                'assets/images/${demoProducts[index].images}.png',
                                fit: BoxFit.cover,
                              )
                            )
                            ),
                            Positioned(
                                left: 12,
                                bottom: 12,
                                child: GestureDetector(
                                  // child: Image.asset('assets/heart.png'),
                                  child: const Icon(Icons.favorite_border,
                                      color: Colors.pink),
                                )
                            ),
                            Positioned(
                              width: 35,
                                height: 35,
                                top: 10,
                                right: 10,
                              child: ClipOval(
                                child: Material(
                                  clipBehavior :  Clip.none,
                                  color: kDarkBrowm ,
                                  child: InkWell(
                                    splashColor: Colors.deepOrange,
                                    onTap: () {},
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.shopping_bag_outlined , size: 15, color: kWhite,),// <-- Icon
                                        Text( index % 2 == 0 ? "30%" : "50%" , style: kEncodeSansRagular.copyWith(
                                          color: kWhite,
                                          fontSize: 10
                                        )), // <-- Text
                                      ],
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
                            child: Text(demoProducts[index].title.toUpperCase(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: kEncodeSansBold.copyWith(
                                  color: kDarkBrowm,
                                  fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                                ))),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //dàn đều giữa về 2 phía
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children :[
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
                              Text('sold 5.7k',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: kEncodeSansRagular.copyWith(
                                    color: kGrey,
                                    fontSize: SizeConfig.blockSizeHorizontal! * 3,
                                  )),
                              const SizedBox(
                                height: 8,
                              ),
                          ]
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //dàn đều giữa về 2 phía
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('${demoProducts[index].price} \$',
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
                                Text('${demoProducts[index].rating}',
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
                );
              }
            )
          ],
        ));
  }
}
