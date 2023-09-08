import 'package:flutter_application_lectine_pal/models/fooditem_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FoodItemListNotifier extends StateNotifier<List<FoodItem>> {
  FoodItemListNotifier() : super([]);

  void addItem(FoodItem model) {
    state = [...state, model];
  }

  void removeItem(int id) {
    state = [
      for (final model in state)
        if (model.id != id) model,
    ];
  }

  void updateItemList(List<FoodItem> modelsList) {
    state.addAll(modelsList);
  }

  void clearItemList() {
    state.clear();
  }

  // void toggleItemColor(
  //     {required String itemNumber,
  //     required String itemName,
  //     required int selected}) {
  //   state = [
  //     for (final model in state)
  //       if (model.itemNumber == itemNumber)
  //         model.copyWith(isSelected: selected)
  //       else
  //         model,
  //   ];
  // }
}



// class ItemListNotifier extends ChangeNotifier {
//   ItemListNotifier() : super();

//   List<ItemModel> items = [];

//   void updateList(List<ItemModel> list) {
//     debugPrint('Updating itemsList');
//     // clearList();
//     items = list;
//     notifyListeners();
//   }

//   void addItem(ItemModel data) {
//     items.add(data);
//     notifyListeners();
//   }

//   void removeAt(int index) {
//     items.removeAt(index);
//     notifyListeners();
//   }

//   void clearList() {
//     debugPrint('Clearing itemsList');
//     items.clear();
//   }
// }
