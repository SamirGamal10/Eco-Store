import 'package:flutter/material.dart';

class ShopUserModels {
  late String userName;
  late String emailAddress;
  late String phone;
  late String uid;
  late String image;
  late String cover;
  late String location;
  late bool isEmailVerified;
  ShopUserModels({
    required this.userName,
    required this.emailAddress,
    required this.phone,
    required this.uid,
    required this.image,
    required this.cover,
    required this.location,
    required this.isEmailVerified,
  });
  ShopUserModels.fromJson(Map<String, dynamic> json) {
    userName = json['userName'] as String;
    uid = json['uid'] as String;
    emailAddress = json['emailAddress'] as String;
    phone = json['phone'] ?? "example phone";
    image = json['image'] as String;
    cover = json['cover'] as String;
    location = json['location'] as String;
    isEmailVerified = json['isEmailVerified'] as bool;
  }
  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'uid': uid,
      'emailAddress': emailAddress,
      'phone': phone,
      'image': image,
      'cover': cover,
      'location': location,
      'isEmailVerified': isEmailVerified,
    };
  }
}

class Product {
  late String productName;
  late String productPrice;
  late String productLocation;
  late String productDescription;
  late String productCategory;
  late String productId;
  // int ? productQuantity;
  Product({
    // required this.productQuantity,
    required this.productId,
    required this.productName,
    required this.productCategory,
    required this.productDescription,
    required this.productLocation,
    required this.productPrice,
  });

  Product.fromJson(Map<String, dynamic> json) {
    productCategory = json['productCategory'] ?? "";
    productDescription = json['productDescription'] as String;
    productLocation = json['productLocation'] as String;
    productPrice = json['productPrice'] as String;
    // productId=json['productId'];
  }
  Map<String, dynamic> toMap() {
    return {
      'productName': productName,
      'productCategory': productCategory,
      'productDescription': productDescription,
      'productLocation': productLocation,
      'productPrice': productPrice,
      // 'productId':productId,
    };
  }
}

//override function PopupMenuItem to wide used
class MyPopupMenuItem<T> extends PopupMenuItem<T> {

  final Widget child;
  final Function onClick;
  MyPopupMenuItem({required this.child, required this.onClick})
      : super(child: child);
  @override
  PopupMenuItemState<T, PopupMenuItem<T>> createState() {
    return MyPopupMenuItemState();
  }
}

class MyPopupMenuItemState<T, PopMenuItem>
    extends PopupMenuItemState<T, MyPopupMenuItem<T>> {
  @override
  void handleTap() {
    widget.onClick();
  }
}
