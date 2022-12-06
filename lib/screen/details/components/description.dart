import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description({Key? key}) : super(key: key);

  final String dummyText ='Áo khoác Cardigan có cúc dọc đóng mở tiện lợi';



  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      child: (
          Column(
            children: [
              Text("${dummyText}", textAlign: TextAlign.justify, style: TextStyle(color: Colors.grey),)
            ],
          )
      ),
    );
  }
}
