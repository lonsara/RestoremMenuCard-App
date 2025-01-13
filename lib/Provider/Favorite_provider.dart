

import 'package:flutter/cupertino.dart';
import 'package:updatedrestorentapp/Model/Items.dart';

class FavoriteProvider with ChangeNotifier {
  List<Items> _favoriteMeals = [];

  List<Items> get favoriteMeals => _favoriteMeals;

  void addFavorite(Items meal) {
    _favoriteMeals.add(meal);
    notifyListeners();  // This will trigger a rebuild in the UI
  }

  void removeFavorite(Items meal) {
    _favoriteMeals.remove(meal);
    notifyListeners();
  }
}

