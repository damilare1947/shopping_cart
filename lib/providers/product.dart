import 'package:flutter/foundation.dart';

//creating object for Products
class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;
  bool isShopping;
  //constructor for the class product @required indicates that information must be supplied
  Product(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.price,
      @required this.imageUrl,
      this.isFavorite = false,
      this.isShopping = false});

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  void toggleShoppingCart() {
    isShopping = !isShopping;
    notifyListeners();
  }
  
}
