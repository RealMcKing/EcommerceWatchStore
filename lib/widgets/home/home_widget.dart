import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:ecommerce_watch_store/theme/colors.dart';
import 'package:ecommerce_watch_store/images.dart';

class Watch {
  final String name;
  final String surname;
  final String price;
  final ImageProvider image;
  final Color color;

  Watch({
    required this.name,
    required this.surname,
    required this.price,
    required this.image,
    required this.color,
  });
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {
  final _watches = [
    Watch(
      name: 'Apple Watch',
      surname: 'Series 7',
      price: '799',
      image: AppImages.series7,
      color: const Color.fromRGBO(255, 200, 183, 1),
    ),
    Watch(
      name: 'Galaxy Watch',
      surname: 'Series 4',
      price: '599',
      image: AppImages.series4,
      color: const Color.fromRGBO(255, 239, 225, 1),
    ),
    Watch(
      name: 'Mi Watch',
      surname: 'All Series',
      price: '299',
      image: AppImages.allSeries,
      color: const Color.fromRGBO(240, 222, 197, 1),
    ),
    Watch(
      name: 'Amazfit Bip U',
      surname: 'Pro Series',
      price: '199',
      image: AppImages.bipUProSeries,
      color: const Color.fromRGBO(252, 241, 240, 1),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 4, vsync: this);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          splashRadius: 24,
          onPressed: () {},
          icon: SvgPicture.asset(
            AppImages.menu,
            width: 22,
            height: 22,
            color: AppColors.kSecondaryColor,
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(
            left: 40.0,
          ),
          child: TextFormField(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20.0, top: 20, bottom: 32),
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
            GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _watches.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                mainAxisExtent: 218,
              ),
              itemBuilder: (BuildContext context, int index) {
                final watch = _watches[index];
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(23, 20, 57, 0.04),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(14)),
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
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class LinearTabIndicator extends Decoration {
  final Color color;

  const LinearTabIndicator({required this.color});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _LinearPainted(color: color);
  }
}

class _LinearPainted extends BoxPainter {
  final Color color;

  _LinearPainted({required this.color});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final paint = Paint()
      ..strokeWidth = 2
      ..color = AppColors.kPrimaryColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final Offset startOffset = Offset(0, configuration.size!.height);

    final Offset finishOffset =
        Offset(configuration.size!.width / 3, configuration.size!.height);

    canvas.drawLine(startOffset + offset, finishOffset + offset, paint);
  }
}
