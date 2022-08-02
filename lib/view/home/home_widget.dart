import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:ecommerce_watch_store/model/watch.dart';
import 'package:ecommerce_watch_store/theme/colors.dart';
import 'package:ecommerce_watch_store/images.dart';
import 'package:ecommerce_watch_store/view/components/linear_tab_indicator_widget.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {
  late TabController tabController;
  final _watches = [
    Watch(
      id: 1,
      name: 'Apple Watch',
      surname: 'Series 7',
      price: '799',
      image: AppImages.series7,
      color: const Color.fromRGBO(255, 200, 183, 1),
    ),
    Watch(
      id: 2,
      name: 'Galaxy Watch',
      surname: 'Series 4',
      price: '599',
      image: AppImages.series4,
      color: const Color.fromRGBO(255, 239, 225, 1),
    ),
    Watch(
      id: 3,
      name: 'Mi Watch',
      surname: 'All Series',
      price: '299',
      image: AppImages.allSeries,
      color: const Color.fromRGBO(240, 222, 197, 1),
    ),
    Watch(
      id: 4,
      name: 'Amazfit Bip U',
      surname: 'Pro Series',
      price: '199',
      image: AppImages.bipUProSeries,
      color: const Color.fromRGBO(252, 241, 240, 1),
    ),
    Watch(
      id: 3,
      name: 'Mi Watch',
      surname: 'All Series',
      price: '299',
      image: AppImages.allSeries,
      color: const Color.fromRGBO(240, 222, 197, 1),
    ),
    Watch(
      id: 4,
      name: 'Amazfit Bip U',
      surname: 'Pro Series',
      price: '199',
      image: AppImages.bipUProSeries,
      color: const Color.fromRGBO(252, 241, 240, 1),
    ),
  ];

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void _onWatchTap(int index) {
    final id = _watches[index].id;
    Navigator.of(context).pushNamed('/home/detail_product', arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          splashRadius: 24,
          onPressed: () {},
          iconSize: 22,
          icon: SvgPicture.asset(
            AppImages.menu,
            color: AppColors.kSecondaryColor,
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(
            left: 40.0,
          ),
          child: TextFormField(
            cursorColor: AppColors.kSecondaryColor,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 14.0),
              prefixIcon: SvgPicture.asset(AppImages.search,
                  width: 20,
                  height: 20,
                  color: AppColors.kSecondaryColor,
                  fit: BoxFit.scaleDown),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: const BorderSide(
                  color: AppColors.kAccentSecondColor,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: const BorderSide(
                  color: AppColors.kAccentSecondColor,
                ),
              ),
              hintStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.kSecondaryColor.withOpacity(0.55)),
              hintText: "Search Product",
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20.0, top: 20.0, bottom: 32.0),
              child: Text(
                'Find your suitable watch now.',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.kSecondaryColor,
                  fontSize: 36,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                controller: tabController,
                labelColor: AppColors.kPrimaryColor,
                labelStyle: const TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.w600),
                unselectedLabelColor: AppColors.kAccentSecondColor,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicator:
                    const LinearTabIndicator(color: AppColors.kPrimaryColor),
                tabs: const [
                  Tab(text: 'Smart watch'),
                  Tab(text: 'Casio'),
                  Tab(text: 'Tissot'),
                  Tab(text: 'Seiko'),
                ],
              ),
            ),
            SizedBox( // TODO
              height: 500,
              width: double.maxFinite,
              child: TabBarView(
                controller: tabController,
                children: [
                  GridView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _watches.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      mainAxisExtent: 218,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      final watch = _watches[index];
                      return Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14)),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(23, 20, 57, 0.04),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 101,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: watch.color,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(14)),
                                  ),
                                  child: Image(
                                    image: watch.image,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  watch.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: AppColors.kSecondaryColor),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  watch.surname,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: AppColors.kSecondaryColor),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  '\$ ${watch.price}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: AppColors.kPrimaryColor),
                                ),
                              ],
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(14),
                              onTap: () => _onWatchTap(index),
                              child: Ink(
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  const Text('TextBar 2'),
                  const Text('TextBar 3'),
                  const Text('TextBar 4'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
