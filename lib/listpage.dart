import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_lectine_pal/constants.dart';
import 'package:flutter_application_lectine_pal/db/database_helper.dart';
import 'package:flutter_application_lectine_pal/models/fooditem_model.dart';
import 'package:flutter_application_lectine_pal/provider/provider.dart';
import 'package:flutter_application_lectine_pal/widgets/frostedcontainer.dart';
import 'package:flutter_application_lectine_pal/widgets/frostedroundedcontainer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListPage extends ConsumerStatefulWidget {
  const ListPage(
      {super.key,
      required this.type,
      required this.category,
      required this.title,
      required this.subtitle,
      required this.image});

  final String type;
  final String category;
  final String title;
  final String subtitle;
  final String image;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ListPageState();
}

class _ListPageState extends ConsumerState<ListPage> {
  late ScrollController _scrollController;

  double _scrollPosition = 0.0;
  _scrollListener() {
    ref.read(scrollPositionProvider.notifier).state = _scrollController.offset;
  }

  _getData() async {
    await DatabaseHelper.instance
        .getType(ref: ref, type: widget.type, category: widget.category);
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    _getData();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<FoodItem> items = ref.watch(foodItemChangeProvider).foodItems;
    debugPrint(items.toString());
    _scrollPosition = ref.watch(scrollPositionProvider);
    //debugPrint('scrollposition: $_scrollPosition');
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
          color: Colors.white,
          child: GestureDetector(
            onHorizontalDragUpdate: (details) {
              int sensitivity = 8;
              if (details.delta.dx > sensitivity) {
                Navigator.of(context).pop();
              }
            },
            child: StatefulBuilder(
              builder: (context, setBuildState) {
                return CustomScrollView(
                  controller: _scrollController,
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverAppBar(
                      expandedHeight: 300,
                      leading: FrostedRoundedContainer(
                        child: IconButton(
                            onPressed: () => Navigator.of(context).pop(),
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Color.fromARGB(255, 247, 238, 238),
                              size: 30,
                            )),
                      ),
                      backgroundColor: Colors.white,
                      elevation: 0,
                      systemOverlayStyle: const SystemUiOverlayStyle(
                        statusBarColor: Colors.white,
                        systemNavigationBarColor: Colors.white,
                        systemNavigationBarIconBrightness: Brightness.dark,
                      ),
                      flexibleSpace: FlexibleSpaceBar(
                        background: Image.asset(
                          widget.image,
                          fit: BoxFit.fill,
                        ),
                        titlePadding: const EdgeInsetsDirectional.only(
                            start: 60, bottom: 35),
                        title: (_scrollPosition > 210)
                            ? Text(
                                widget.title,
                                style: Constants.pageContentTitleTextStyleDark,
                              )
                            : FrostedContainer(
                                child: Column(
                                  children: [
                                    Text(
                                      widget.title,
                                      style: Constants
                                          .pageContentTitleTextStyleLight,
                                    ),
                                    Text(
                                      widget.subtitle,
                                      style: Constants
                                          .pageContentSubTitleTextStyleLight,
                                    )
                                  ],
                                ),
                              ),
                      ),
                    ),
                    SliverList.separated(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            items[index].name,
                            style: Constants.listTileTextStyle,
                          ),
                          trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.keyboard_arrow_right_sharp,
                                size: 30,
                              )),
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(
                        thickness: 3,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ));
  }
}
