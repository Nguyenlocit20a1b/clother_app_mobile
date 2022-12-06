import 'package:flutter/material.dart';


class Infor extends StatefulWidget {
  const Infor({Key? key}) : super(key: key);

  @override
  State<Infor> createState() => _MyInfor();
}

class _MyInfor extends State<Infor> {
  int _count = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 175,
          child: Text("Modern light clothes",style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold))),
        const SizedBox(width: 28,),
        Row(
          children: [
            Container(
              padding: EdgeInsets.only(right: 15),
              child: IconButton(
                onPressed: ()=>{
                  setState(() {
                    _count <= 1 ? 1 : _count--;
                  })
                },
                icon: const Icon(Icons.remove),
              ),
            ),
            Text("${_count}",style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Container(
              padding: EdgeInsets.only(left: 15),
              child: IconButton(
                onPressed: ()=>{
                  setState(() {
                    _count++;
                  })
                },
                icon: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      ],
    );
  }
}