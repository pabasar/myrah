import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:myrah/constants.dart';
import 'package:myrah/models/Product.dart';
import 'package:myrah/screens/details/details_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'categorries.dart';
import 'item_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  Query _productListQuery;
  List<Product> _productsList;
  StreamSubscription<Event> _onProductAddedSubscription;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: Text(
            "Palmyra foods & beverages",
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Categories(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: GridView.builder(
                itemCount: _productsList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: kDefaultPaddin,
                  crossAxisSpacing: kDefaultPaddin,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => ItemCard(
                  product: _productsList[index],
                  press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          product: _productsList[index],
                        ),
                      )),
                )),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _productListQuery = _database.reference().child('products');

    initProductList();
    _onProductAddedSubscription =
        _productListQuery.onChildAdded.listen(onProductAdded);
  }

  onProductAdded(Event event) {
    setState(() {
      if (event.snapshot.value != null)
        _productsList.add(Product.fromJson(event.snapshot.value, _productsList.length));
    });
  }

  initProductList() {
    _productsList = new List();
    // _productListQuery.once().then((snapshot) {
    //   setState(() {
    //     for (var i = 0; i < snapshot.value.length; i++) {
    //       if (snapshot.value[i] != null)
    //         _productsList.add(Product.fromJson(snapshot.value[i], i));
    //     }
    //   });
    // });
  }
}

class FirebaseStorageImageService extends ChangeNotifier {
  FirebaseStorageImageService();

  static Future<dynamic> loadImage(BuildContext context, String image) async {
    return await FirebaseStorage.instance.ref().child(image).getDownloadURL();
  }

  static Future<Widget> getImage(BuildContext context, String image) async {
    return await FirebaseStorageImageService.loadImage(context, image)
        .then((value) {
      return Image.network(value.toString(), fit: BoxFit.scaleDown);
    });
  }

  static FutureBuilder getImageFutureBuilder(
      BuildContext context, String image) {
    return FutureBuilder(
      future: FirebaseStorageImageService.getImage(context, image),
      builder: (context, snapshot) {

        if (snapshot.connectionState == ConnectionState.done) {
          return Container(

            child: snapshot.data,
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
              
              child: CircularProgressIndicator());
        }

        return Container();
      },
    );
  }
}