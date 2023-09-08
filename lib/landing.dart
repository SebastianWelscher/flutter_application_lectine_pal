import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_lectine_pal/provider/provider.dart';
import 'package:flutter_application_lectine_pal/widgets/dotindicator.dart';
import 'package:flutter_application_lectine_pal/widgets/page_content.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Landing extends ConsumerStatefulWidget {
  const Landing({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LandingState();
}

class _LandingState extends ConsumerState<Landing> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    //     overlays: SystemUiOverlay.values);
    super.dispose();
  }

  List<PageContent> content = [
    const PageContent(
      imageName: 'assets/images/undraw_Welcoming_re_x0qo.png',
      title: 'Willkommen',
      text:
          'Diese App dient als Hilfe beim Einkaufen\nlektinfreier bzw. armer Lebensmittel ',
      isLastPage: false,
    ),
    const PageContent(
      imageName: 'assets/images/undraw_Profile_data_re_v81r.png',
      title: 'Datenschutz',
      text:
          'Diese App benötigt keine Internetverbindung\nund auch kein Benutzerkonto.'
          '\n\nAlle Daten werden offline lokal,\nin einer Datenbank gespeichert',
      isLastPage: false,
    ),
    const PageContent(
      imageName: 'assets/images/undraw_Completing_re_i7ap.png',
      title: 'Los gehts',
      text: 'Die App wird nun für die Nutzung vorbereitet.\n'
          'Es wird eine lokale Datenbank angelegt und \n'
          'mit Startdaten gefüllt.'
          '\n\nBitte auf weiter tippen',
      isLastPage: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    _pageIndex = ref.watch(isPageIndexProvider);
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        height: height,
        color: const Color.fromRGBO(255, 255, 255, 1),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    ref.read(isPageIndexProvider.notifier).state = index;
                  },
                  itemCount: content.length,
                  itemBuilder: (context, index) {
                    return content[index];
                  }),
            ),
            //const Spacer(),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(
                      content.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: DotIndicator(
                          isActive: index == _pageIndex,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
