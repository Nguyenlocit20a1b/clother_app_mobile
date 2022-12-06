import 'package:flutter/material.dart';

class Rating extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: const [
        Star(),SizedBox(width: 5),
        Star(),SizedBox(width: 5),
        Star(),SizedBox(width: 5),
        Star(),SizedBox(width: 5),
        Star(),SizedBox(width: 5),
        Text("50", style: TextStyle(fontSize: 14, color: Colors.grey),),
        Text("  (7.932 reviews)", style: TextStyle(fontSize: 14, color: Colors.blue),)
      ],
    );
  }
}

class Star extends StatelessWidget {
  const Star({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.star,
      color: Colors.amber,
      size: 20,
    );
  }
}

