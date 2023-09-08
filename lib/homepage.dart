import 'package:flutter/material.dart';
import 'package:flutter_application_lectine_pal/cards.dart';
import 'package:flutter_application_lectine_pal/db/database_helper.dart';
import 'package:flutter_application_lectine_pal/models/fooditem_model.dart';
import 'package:flutter_application_lectine_pal/widgets/branding.dart';
import 'package:flutter_application_lectine_pal/widgets/drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Homepage extends ConsumerStatefulWidget {
  const Homepage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomepageState();
}

class _HomepageState extends ConsumerState<Homepage> {
  late List<FoodItem> foodItemsList;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  _loadData() async {
    foodItemsList = await DatabaseHelper.instance.getAll();
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Möchten sie die App wirklich beenden?'),
              actionsAlignment: MainAxisAlignment.end,
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: const Text('Ja'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text('Nein'),
                ),
              ],
            );
          },
        );
        return shouldPop!;
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                  color: Colors.black54,
                )),
            backgroundColor: Colors.white,
            elevation: 0,
            title: const Branding()),
        drawer: CustomDrawer(
          stateKey: _scaffoldKey,
        ),
        body: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: itemCardsList,
              ),
            ),
          ),
        ),
      ),
    );
  }
}


// class Homepage extends ConsumerWidget {
//   Homepage({super.key});

//   final List<Widget> itemCardsList = [
//     const ListHeader(title: 'Gemüse'),
//     ItemCard(
//       title: 'Lektinhaltig',
//       imageAsset: 'assets/images/anna-pelzer-IGfIGP5ONV0-unsplash.jpg',
//       type: Category.lectine.name,
//       categoryIndex: 'vegetables',
//       subCategoryIndex: Subcategory.vegetables.index,
//       description: 'Gemüse',
//     ),
//     ItemCard(
//       title: 'Lektinarm',
//       imageAsset: 'assets/images/anna-pelzer-IGfIGP5ONV0-unsplash.jpg',
//       type: Category.lectine.name,
//       categoryIndex: 'vegetables',
//       subCategoryIndex: Subcategory.vegetables.index,
//       description: 'Gemüse',
//     ),
//     ItemCard(
//       title: 'Oxalathaltig',
//       imageAsset: 'assets/images/louis-hansel-aKkfva3IdTw-unsplash.jpg',
//       type: Category.lectine.name,
//       categoryIndex: 'vegetables',
//       subCategoryIndex: Subcategory.vegetables.index,
//       description: 'Gemüse',
//     ),
//     const ListHeader(title: 'Getreide'),
//     ItemCard(
//       title: 'Lektinhaltig',
//       imageAsset: 'assets/images/mockup-graphics-XCSlkD0KNkk-unsplash.jpg',
//       type: 'lectine',
//       categoryIndex: 'grains',
//       subCategoryIndex: Subcategory.grains.index,
//       description: 'Getreide',
//     ),
//     const ListHeader(title: 'Obst'),
//     ItemCard(
//       title: 'Lektinhaltig',
//       imageAsset: 'assets/images/naveed-pervaiz-IlnF2g_3tpY-unsplash.jpg',
//       type: 'lectine',
//       categoryIndex: 'fruits',
//       subCategoryIndex: Subcategory.fruits.index,
//       description: 'Obst',
//     ),
//     const ListHeader(title: 'Nüsse & Samen'),
//     ItemCard(
//       title: 'Lektinhaltig',
//       imageAsset: 'assets/images/maddi-bazzocco-UhrHTmVBzzE-unsplash.jpg',
//       type: 'lectine',
//       categoryIndex: 'nuts',
//       subCategoryIndex: Subcategory.nuts.index,
//       description: 'Nüsse & Samen',
//     ),
//     const ListHeader(title: 'Öle'),
//     ItemCard(
//       title: 'Lektinhaltig',
//       imageAsset: 'assets/images/roberta-sorge-uOBApnN_K7w-unsplash.jpg',
//       type: 'lectine',
//       categoryIndex: 'oils',
//       subCategoryIndex: Subcategory.oils.index,
//       description: 'Öle',
//     ),
//   ];

//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  
 

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return WillPopScope(
//       onWillPop: () async {
//         final shouldPop = await showDialog<bool>(
//           context: context,
//           builder: (context) {
//             return AlertDialog(
//               title: const Text('Möchten sie die App wirklich beenden?'),
//               actionsAlignment: MainAxisAlignment.end,
//               actions: [
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.pop(context, true);
//                   },
//                   child: const Text('Ja'),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pop(context, false);
//                   },
//                   child: const Text('Nein'),
//                 ),
//               ],
//             );
//           },
//         );
//         return shouldPop!;
//       },
//       child: Scaffold(
//         key: _scaffoldKey,
//         appBar: AppBar(
//             centerTitle: true,
//             leading: IconButton(
//                 onPressed: () {
//                   _scaffoldKey.currentState?.openDrawer();
//                 },
//                 icon: const Icon(
//                   Icons.menu,
//                   color: Colors.black54,
//                 )),
//             backgroundColor: Colors.white,
//             elevation: 0,
//             title: const Branding()),
//         drawer: CustomDrawer(
//           stateKey: _scaffoldKey,
//         ),
//         body: Container(
//           color: Colors.white,
//           padding: const EdgeInsets.all(20),
//           child: SizedBox(
//             height: MediaQuery.of(context).size.height,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ListView(
//                 children: itemCardsList,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
