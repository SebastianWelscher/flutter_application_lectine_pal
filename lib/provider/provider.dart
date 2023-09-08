import 'package:flutter_application_lectine_pal/models/fooditem_model.dart';
import 'package:flutter_application_lectine_pal/provider/notifier/fooditem_changenotifier.dart';
import 'package:flutter_application_lectine_pal/provider/notifier/fooditem_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isPageIndexProvider = StateProvider<int>((ref) => 0);
final statusProvider = StateProvider<String>((ref) => '');
final isInitEndProvider = StateProvider<bool>((ref) => false);
final scrollPositionProvider = StateProvider<double>((ref) => 0.0);

final foodItemProvider =
    StateNotifierProvider<FoodItemListNotifier, List<FoodItem>>(
        (ref) => FoodItemListNotifier());
final foodItemChangeProvider =
    ChangeNotifierProvider((ref) => FoodItemChangeNotifier());
