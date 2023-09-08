import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_lectine_pal/constants.dart';
import 'package:flutter_application_lectine_pal/helper/shared_helper.dart';
import 'package:flutter_application_lectine_pal/routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: must_be_immutable
class Settings extends ConsumerWidget {
  Settings({super.key});
  bool isFirst = SharedHelper.getBoolPreference(preference: 'isFirst');

  _showInfoDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Achtung'),
      content: const Text(
          'Die App wird zurückgesetzt. Alle gespeicherten Daten gehen dabei verloren'),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Abbrechen',
              style: Constants.textButtonTextStyle,
            )),
        const SizedBox(
          width: 10,
        ),
        ElevatedButton(
            onPressed: () => Navigator.of(context)
                .pushReplacementNamed(RouteGenerator.landing),
            child: Text(
              'Ok',
              style: Constants.buttonTextStyle,
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            systemNavigationBarColor: Colors.white,
            systemNavigationBarIconBrightness: Brightness.dark),
        centerTitle: true,
        title: Text(
          'Einstellungen',
          style: Constants.pageContentTitleTextStyleDark,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: StatefulBuilder(
        builder: (context, setBuildState) {
          debugPrint('$isFirst');
          return Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: ListView(
              children: [
                SwitchListTile.adaptive(
                    secondary: const Icon(Icons.warning),
                    title: const Text('App zurücksetzen'),
                    value: isFirst,
                    onChanged: (value) {
                      setBuildState(
                        () {
                          if (value) {
                            isFirst = value;

                            showDialog(
                                context: context,
                                builder: (_) => _showInfoDialog(context));
                          }
                        },
                      );
                    }),
                const Divider(
                  height: 2,
                ),
                ListTile(
                  leading: const Icon(Icons.info_outline),
                  title: const Text('Über'),
                  onTap: () => showDialog(
                    context: context,
                    builder: (_) => const AboutDialog(
                      applicationName: 'MyLectinePal',
                      applicationVersion: '1.0',
                    ),
                  ),
                ),
                const Divider(
                  height: 2,
                ),
                ListTile(
                    leading: const Icon(Icons.info_outline),
                    title: const Text('Ver. 1.0'),
                    onTap: () {
                      SharedHelper.setBoolPreference(
                          preference: 'isFirst', value: true);
                    }),
              ],
            ),
          );
        },
      ),
    );
  }
}
