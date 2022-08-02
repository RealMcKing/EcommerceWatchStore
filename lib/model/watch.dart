import 'package:flutter/material.dart';

class Watch {
  final int id;
  final String name;
  final String surname;
  final String price;
  final ImageProvider image;
  final Color color;

  Watch({
    required this.id,
    required this.name,
    required this.surname,
    required this.price,
    required this.image,
    required this.color,
  });
}
