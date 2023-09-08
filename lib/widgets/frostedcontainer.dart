import 'package:flutter/material.dart';

class FrostedContainer extends StatelessWidget {
  const FrostedContainer({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: 180,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
            )
          ],
          border: Border.all(color: Colors.white.withOpacity(0.2), width: 1.0),
          gradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(0.7),
              Colors.white.withOpacity(0.4)
            ],
            stops: const [0.0, 1.0],
          ),
          borderRadius: BorderRadius.circular(5)),
      child: Center(child: child),
    );
  }
}
