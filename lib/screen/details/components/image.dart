import 'package:flutter/material.dart';
import 'homeBackandLike.dart';

class Images extends StatelessWidget {
  const Images({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          //IMAGE
          Container(
            width: 375,
            height: 395,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30), // Image border
              child: SizedBox.fromSize(
                size: Size.fromRadius(48),
                // Image radius
                child: Image.asset("assets/images/image-01.png",fit: BoxFit.cover),
              ),
            ),
          ),
          //ICON
          HomeBackandLike(),
        ]);
  }
}
