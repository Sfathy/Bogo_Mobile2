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
  Brand({@required this.id,@required this.brandImage,@required this.brandName,
  @required this.brandDescription});
}
class Branch {
  final int id;
   final String branchAddress;
  final String branchName;
  final String branchLocation;
  final String branchTelephone;
  final List<String> availableFeatures;
  Branch({@required this.id,@required this.branchName,@required this.branchAddress, 
  @required this.branchLocation,@required this.availableFeatures,@required this.branchTelephone});

}
class Coupon {
  final int id;
  final String validTillEN;
  final String validTillAR;
  final String image;
  final String descriptionEN;
  final String descriptionAR;
  Coupon({@required this.id,@required this.validTillEN,@required this.validTillAR, 
  @required this.image,@required this.descriptionEN,@required this.descriptionAR});


}
class BrandDetails {
  final String brandName;
  final String brandImage;
  final String brandIcon;
  final List<Branch> branches;
  final List<Coupon> coupons;
  final int id;
  final String brandDescription;
  BrandDetails({@required this.id,@required this.brandImage,@required this.brandIcon,
  @required this.brandDescription,@required this.brandName, @required this.branches,@required this.coupons});
  
}