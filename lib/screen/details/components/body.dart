import 'package:flutter/material.dart';
import 'rating.dart';
import 'title.dart';
import 'image.dart';
import 'description.dart';
import 'color_and_size.dart';

class Body extends StatelessWidget {
  const Body({Key ?key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 24, right: 24, top: 40),
          child: Column(
              children: [
                Images(),
                SizedBox(height: 15),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Infor(),
                    Rating(),
                    SizedBox(height: 10),
                    Description(),
                    SizedBox(height: 10),
                    Row(
                      children: const [
                        Expanded(
                          child: Divider(
                            indent: 10.0,
                            endIndent: 20.0,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    ChooseSize()
                  ],
                )
              ]),
        ));
  }
}


