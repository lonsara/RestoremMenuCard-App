import 'package:flutter/material.dart';

class Categories{
  String id;
  String tittle;
  Color color;
  Categories({
    required this.id,
    required this.tittle,
    this.color=Colors.blue,
  });

}