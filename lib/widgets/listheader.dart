import 'package:flutter/material.dart';
import 'package:flutter_application_lectine_pal/constants.dart';

class ListHeader extends StatelessWidget {
  const ListHeader({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        top: 10.0,
      ),
      child: Text(
        title,
        style: Constants.listTitleTextStyle,
      ),
    );
  }
}
