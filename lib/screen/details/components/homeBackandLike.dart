import 'package:clothing_shop/screen/home/homePage.dart';
import 'package:flutter/material.dart';


class HomeBackandLike extends StatefulWidget {
  const HomeBackandLike({Key? key}) : super(key: key);

  @override
  State<HomeBackandLike> createState() => _HomeBackandLikeState();
}

class _HomeBackandLikeState extends State<HomeBackandLike> {
  bool _isLiked = false;

  void check() {
    setState(() {
      _isLiked = !_isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: Container(
                color: Color(0xffFAFAFA),
                width: 40.0,
                height: 40.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),);
                    },
                  child: const Icon(Icons.arrow_back_ios),),),),
            ClipOval(
              child: Container(
                color: Color(0xffFAFAFA),
                width: 40.0,
                height: 40.0,
                child: GestureDetector(
                  onTap: check,
                  child: Icon(
                      Icons.favorite_rounded,
                      color: _isLiked?Colors.black:Colors.pink),
                ),
              ),
            )
          ],
        ));
  }
}

