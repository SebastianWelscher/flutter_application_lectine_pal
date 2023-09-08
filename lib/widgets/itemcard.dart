import 'package:flutter/material.dart';
import 'package:flutter_application_lectine_pal/constants.dart';
import 'package:flutter_application_lectine_pal/models/listpage_model.dart';
import 'package:flutter_application_lectine_pal/routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemCard extends ConsumerWidget {
  const ItemCard(
      {super.key,
      required this.title,
      required this.color,
      required this.imageAsset,
      required this.type,
      required this.category,
      required this.description});

  final String title;
  final Color color;
  final String imageAsset;
  final String type;
  final String category;

  final String description;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(RouteGenerator.list,
          arguments: ListPageModel(
              type: type,
              category: category,
              subtitle: title,
              title: description,
              image: imageAsset)),
      child: Padding(
        padding: const EdgeInsets.only(top: 4.0, bottom: 6.0),
        child: SizedBox.fromSize(
          size: Constants.cardSize,
          child: Card(
            clipBehavior: Clip.hardEdge,
            elevation: 5,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    width: 30,
                    height: Constants.cardSize.height,
                    color: color,
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Center(
                          child: Text(
                        title,
                        style: Constants.itemCardTextStyle,
                      )),
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Image.asset(
                    imageAsset,
                    scale: 0.4,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
