import 'package:flutter/material.dart';


// class ColorDots extends StatelessWidget {
//   const ColorDots({
//     Key? key,
//     required this.product,
//   }) : super(key: key);
//
//   final Product product;
//
//   @override
//   Widget build(BuildContext context) {
//     // Now this is fixed and only for demo
//     int selectedColor = 3;
//     return Padding(
//       padding:
//       EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
//       child: Row(
//         children: [
//           ...List.generate(
//             product.colors.length,
//                 (index) => ColorDot(
//               color: product.colors[index],
//               isSelected: index == selectedColor,
//             ),
//           ),
//           Spacer(),
//           RoundedIconBtn(
//             icon: Icons.remove,
//             press: () {},
//           ),
//           SizedBox(width: getProportionateScreenWidth(20)),
//           RoundedIconBtn(
//             icon: Icons.add,
//             showShadow: true,
//             press: () {},
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class ColorDot extends StatelessWidget {
//   const ColorDot({
//     Key? key,
//     required this.color,
//     this.isSelected = false,
//   }) : super(key: key);
//
//   final Color color;
//   final bool isSelected;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(right: 2),
//       padding: EdgeInsets.all(getProportionateScreenWidth(8)),
//       height: getProportionateScreenWidth(40),
//       width: getProportionateScreenWidth(40),
//       decoration: BoxDecoration(
//         color: Colors.transparent,
//         border:
//         Border.all(color: isSelected ? kPrimaryColor : Colors.transparent),
//         shape: BoxShape.circle,
//       ),
//       child: DecoratedBox(
//         decoration: BoxDecoration(
//           color: color,
//           shape: BoxShape.circle,
//         ),
//       ),
//     );
//   }
// }

class ChooseSize extends StatefulWidget {
  @override
  State<ChooseSize> createState() => _ChooseSizeState();
}

class _ChooseSizeState extends State<ChooseSize> {
  List<String> sizes = ['S', 'M', 'L', 'XL'];
  List<Color> colors = [Color(0xFFEDEDED), Color(0xFF1B2028), Color(0xFF292526)
  ];

  bool selectedBox = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text("Size",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          Row(
            children: <Widget>[for (var item in sizes) SizeDot(size: item, isSelected: false)],
          ),
        ]),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Color",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            Row(

              children: <Widget>[for (var color in colors)ColorDot(color: color,isSelected: false)],
            ),
          ],
        )
      ],
    );
  }
}

class ColorDot extends StatefulWidget {
  final Color? color;
  final bool isSelected;
  const ColorDot({
    Key? key,
    this.color, // by default isSelected is false
    this.isSelected = false,
  }) : super(key: key);

  @override
  State<ColorDot> createState() => _ColorDotState();
}

class _ColorDotState extends State<ColorDot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 5,
        right: 10,
      ),
      padding: EdgeInsets.all(2.5),
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: widget.isSelected ? Colors.black : Colors.transparent,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: widget.color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class SizeDot extends StatelessWidget {
  final String? size;
  final Color? color;
  bool isSelected = false ;
  SizeDot({
    Key? key,
    this.size,
    this.color, // by default isSelected is false
    this.isSelected = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 5,
        right: 10 ,
      ),
      padding: EdgeInsets.all(2.5),
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: isSelected? Color(0xff1B2028):Color(0xffFFFFFF),
        shape: BoxShape.circle,
        border: Border.all(
          color: Color(0xffEDEDED)
        ),
      ),
      child: Center(
        child:
        GestureDetector(
          onTap: (){
            isSelected = true;
          },
          child: Text("${size}"),
      ))
    );
  }
}
