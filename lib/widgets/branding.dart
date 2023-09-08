import 'package:flutter/material.dart';

class Branding extends StatelessWidget {
  const Branding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: const TextSpan(children: [
      TextSpan(
        text: 'my',
        style:
            TextStyle(color: Colors.red, fontSize: 20, fontFamily: 'Quicksand'),
      ),
      TextSpan(
        text: 'Lectine',
        style: TextStyle(
            color: Colors.black87, fontSize: 26, fontFamily: 'Quicksand'),
      ),
      TextSpan(
          text: 'pal',
          style: TextStyle(
              color: Colors.blue, fontSize: 22, fontFamily: 'Quicksand'))
    ]));
  }
}
