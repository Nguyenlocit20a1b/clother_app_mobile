import 'package:flutter/material.dart';

class Product {
  int id;
  String title, description;
  String images;
  List<Color> colors;
  double rating, price;
  bool isFavourite, isPopular;
  String category;

  Product(
    this.id,
    this.images,
    this.colors,
    this.title,
    this.price,
    this.description,
    this.rating,
    this.isPopular,
    this.isFavourite,
    this.category,
  );
}

// Our demo Products
List<Product> demoProducts = [
  Product(
    0,
    "image-01",
    [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    "beautiful dress personality™",
    64.99,
    description,
    4.9,
    true,
    true,
    'Dress',
  ),
  Product(
    1,
    "image-02",
    [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    "Nike Sport White - Man Pant",
    50.5,
    description,
    4.8,
    true,
    true,
    'Dress',
  ),
  Product(
    2,
    "image-03",
    [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    "Personalized set",
    36.55,
    description,
    4.1,
    true,
    true,
    'Hat',
  ),
  Product(
    3,
    "image-04",
    [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    "Leather jacket",
    36.55,
    description,
    4.1,
    true,
    true,
    'Hat',
  ),
  Product(
    4,
    "image-02",
    [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    "Sexy yellow dress",
    56.55,
    description,
    4.5,
    true,
    true,
    'Watch',
  ),
  Product(
    5,
    "image-05",
    [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    "Miss Dress ",
    50.67,
    description,
    4.8,
    true,
    true,
    'Watch',
  ),
  Product(
    6,
    "image-06",
    [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    "Miss Dress White",
    99.55,
    description,
    4.6,
    true,
    true,
    'Dress',
  ),
  Product(
    7,
    "image-04",
    [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    "beautiful dress personality",
    36.55,
    description,
    4.1,
    true,
    true,
    'Watch',
  ),
];
const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
