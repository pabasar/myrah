import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Product {
  final String image, title, description, type;
  final int price, id;
  final Color color;
  Product({
    this.id,
    this.image,
    this.title,
    this.price,
    this.description,
    this.type,
    this.color,
  });

  Product.fromJson(snapshotJson, int index)
      : id = index,
        image = snapshotJson["image"],
        title = snapshotJson["title"],
        price = snapshotJson["price"],
        description = snapshotJson["description"],
        type = snapshotJson["type"],
        color = Colors.white;

  toJson() {
    return {
      "image": image,
      "title": title,
      "price": price,
      "description": description,
      "type": type,
      "color": color
    };
  }
}

// List<Product> products = [
//   Product(
//       id: '1',
//       title: "Palmyra Cake",
//       price: 80,
//       type: "Cup Cake",
//       description: txtCake,
//       image: "assets/images/cake.png",
//       color: Colors.white),
//   Product(
//       id: '2',
//       title: "Palmyra Smoothie",
//       price: 100,
//       type: "Creamy Filled",
//       description: txtSmoothie,
//       image: "assets/images/smoothie.PNG",
//       color: Colors.white),
//   Product(
//       id: '3',
//       title: "Palmyra Pudding",
//       price: 120,
//       type: "Milk & Caramel",
//       description: txtPudding,
//       image: "assets/images/pudding.png",
//       color: Colors.white),
//   Product(
//       id: '4',
//       title: "Palmyra Ice Cream",
//       price: 180,
//       type: "Fruity Topped",
//       description: txtIce,
//       image: "assets/images/ice.png",
//       color: Colors.white),
//   Product(
//       id: '5',
//       title: "Palmyra Jaggery",
//       price: 50,
//       type: "Wrapped",
//       description: txtJaggery,
//       image: "assets/images/jaggery.png",
//       color: Colors.white),
//   Product(
//     id: '6',
//     title: "Palmyra Trickle",
//     price: 200,
//     type: "Leaf Wrapped Bottle",
//     description: txtTrickle,
//     image: "assets/images/trickle.png",
//     color: Colors.white,
//   ),
// ];

// String txtCake =
//     "Cup cake topped with icing, baked with 100% natural palmyra nectar from northern Ceylon";

// String txtSmoothie =
//     "Tropical creamy smoothie will refresh you with 100% natural palmyra soothing";

// String txtPudding =
//     "Caramel poured palmyra pudding, made with 100% natural palmyra nectar from northern ceylon is best for your dessert";

// String txtIce =
//     "Be cool. Taste of Palmyra Ice Cream perfectly matches for summer hotness";

// String txtJaggery =
//     "Jaggery, made up of 100% natural palmyra syrup from northern Ceylon";

// String txtTrickle =
//     "A different kind of trickle honey, flows from palmyra trees from northern Ceylon";