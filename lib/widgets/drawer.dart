import 'package:flutter/material.dart';
import 'package:flutter_application_lectine_pal/constants.dart';
import 'package:flutter_application_lectine_pal/routes.dart';
import 'package:flutter_application_lectine_pal/widgets/branding.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomDrawer extends ConsumerWidget {
  const CustomDrawer({super.key, required this.stateKey});

  final GlobalKey<ScaffoldState> stateKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      backgroundColor: Constants.drawerBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DrawerHeader(child: Center(child: Branding())),
          ListTile(
              leading: const Icon(Icons.home),
              title: Text(
                'Home',
                style: Constants.drawerContentTextStyle,
              ),
              onTap: () {
                stateKey.currentState!.closeDrawer();
              }),
          const Divider(
            height: 2,
          ),
          ListTile(
              leading: const Icon(Icons.settings),
              title: Text(
                'Einstellungen',
                style: Constants.drawerContentTextStyle,
              ),
              onTap: () {
                Navigator.of(context).pushNamed(RouteGenerator.settings);
              }),
          const Divider(
            height: 2,
          ),
        ],
      ),
    );
  }
}
