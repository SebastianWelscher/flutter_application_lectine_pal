import 'package:flutter/material.dart';
import 'package:flutter_application_lectine_pal/constants.dart';
import 'package:flutter_application_lectine_pal/provider/provider.dart';
import 'package:flutter_application_lectine_pal/routes.dart';
import 'package:flutter_application_lectine_pal/widgets/branding.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageContent extends ConsumerWidget {
  const PageContent(
      {super.key,
      required this.imageName,
      required this.title,
      required this.text,
      required this.isLastPage});

  final String imageName;
  final String title;
  final String text;
  final bool isLastPage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int pageIndex = ref.watch(isPageIndexProvider);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Branding(),
          const SizedBox(
            height: 10,
          ),
          Image.asset(
            imageName,
            scale: 3,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            title,
            maxLines: 10,
            style: Constants.pageContentTitleTextStyleDark,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              text,
              maxLines: 10,
              style: Constants.pageContentTextStyle,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          if (isLastPage)
            AnimatedOpacity(
              opacity: (pageIndex == 2) ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 1000),
              child: SizedBox.fromSize(
                size: Constants.buttonSize,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        RouteGenerator.init,
                        (_) => false,
                      );
                    },
                    child: Text(
                      'Weiter',
                      style: Constants.buttonTextStyle,
                    )),
              ),
            )
        ],
      ),
    );
  }
}
