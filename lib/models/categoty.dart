import 'package:flutter/material.dart';


class Category{
  
  
  final String categoryName;
  
  final int id;
  final String icon;
  final List<Brand> brands;


  Category({@required this.categoryName,@required this.id,@required this.icon,@required this.brands});

}

class Brand {
  final String brandName;
  final String brandImage;
  final int id;
  final String brandDescription;
  Brand({@required this.id,@required this.brandImage,@required this.brandName,@required this.brandDescription});
}