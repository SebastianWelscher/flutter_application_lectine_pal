import 'package:flutter/foundation.dart';
import 'package:flutter_application_lectine_pal/models/fooditem_model.dart';

class FoodItemChangeNotifier extends ChangeNotifier {
  final List<FoodItem> _items = [];

  get foodItems => _items;

  void addItem(FoodItem item) {
    _items.add(item);
    notifyListeners();
  }

  void deleteItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void deleteAll() {
    _items.clear();
  }
}
