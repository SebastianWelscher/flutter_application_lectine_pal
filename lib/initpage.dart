import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_lectine_pal/constants.dart';
import 'package:flutter_application_lectine_pal/data/data.dart';
import 'package:flutter_application_lectine_pal/db/database_helper.dart';
import 'package:flutter_application_lectine_pal/helper/shared_helper.dart';
import 'package:flutter_application_lectine_pal/models/fooditem_model.dart';
import 'package:flutter_application_lectine_pal/provider/provider.dart';
import 'package:flutter_application_lectine_pal/routes.dart';
import 'package:flutter_application_lectine_pal/widgets/branding.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_indicator/loading_indicator.dart';

class InitPage extends ConsumerStatefulWidget {
  const InitPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InitPageState();
}

class _InitPageState extends ConsumerState<InitPage> {
  _initData() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      ref.read(statusProvider.notifier).state = 'Initialisiere Datenbank';
      DatabaseHelper.instance.initDataBase();
      Future.delayed(const Duration(milliseconds: 2000), () {
        ref.read(statusProvider.notifier).state = 'Erstelle Datentabelle';
        DatabaseHelper.instance.truncateData();
        Future.delayed(const Duration(milliseconds: 2000), () {
          ref.read(statusProvider.notifier).state = 'Füge Startdaten ein';
          _fillDataTable();
          Future.delayed(const Duration(milliseconds: 2000), () {
            ref.read(statusProvider.notifier).state = 'Fertig.';
            Future.delayed(const Duration(milliseconds: 1000), () {
              ref.read(isInitEndProvider.notifier).state = true;
              SharedHelper.setBoolPreference(
                  preference: 'isFirst', value: false);
            });
          });
        });
      });
    });
  }

  _fillDataTable() {
    for (int i = 0; i <= 1; i++) {
      String type = dataLectine["data"]![i].keys.first;
      // debugPrint('type: $type');
      for (int j = 0; j < dataLectine["data"]![i][type]!.length; j++) {
        String category = dataLectine["data"]![i][type]![j].keys.first;
        //debugPrint('categories: $category');
        for (int k = 0;
            k < dataLectine["data"]![i][type]![j][category]!.length;
            k++) {
          String? name =
              dataLectine["data"]![i][type]![j][category]![k]["name"];
          //debugPrint('name: $name ');
          FoodItem item = FoodItem(type: type, category: category, name: name!);
          DatabaseHelper.instance.insert(item: item);
          //debugPrint('inserted');
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    String status = ref.watch(statusProvider);
    bool isInit = ref.watch(isInitEndProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Branding(),
            const SizedBox(
              height: 30,
            ),
            Text(
              status,
              style: Constants.statusTextStyle,
            ),
            const SizedBox(
              height: 160,
            ),
            SizedBox.fromSize(
                size: const Size(70, 300),
                child: AnimatedOpacity(
                  opacity: (isInit) ? 0.0 : 1.0,
                  duration: const Duration(milliseconds: 1000),
                  child: const LoadingIndicator(
                      colors: Constants.rainbowColors,
                      indicatorType: Indicator.ballGridPulse),
                )),
            const SizedBox(
              height: 20,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 100.0),
              child: AnimatedOpacity(
                opacity: (isInit) ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 800),
                child: SizedBox.fromSize(
                  size: Constants.buttonSize,
                  child: ElevatedButton(
                      style: Constants.greenButtonStyle,
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(RouteGenerator.homepage);
                      },
                      child: Text(
                        'Start',
                        style: Constants.buttonTextStyle,
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
