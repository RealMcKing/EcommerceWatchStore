import 'package:ecommerce_watch_store/images.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_watch_store/theme/colors.dart';
import 'package:flutter_svg/svg.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {
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
                    fontSize: 16.0, fontWeight: FontWeight.w500),
                unselectedLabelColor: AppColors.kAccentSecondColor,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: const LinearTabIndicator(
                    color: AppColors.kPrimaryColor),
                tabs: const [
                  Tab(text: 'Smart watch'),
                  Tab(text: 'Casio'),
                  Tab(text: 'Tissot'),
                  Tab(text: 'Seiko'),
                ],
              ),
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

    final Offset startOffset =
        Offset(0, configuration.size!.height);

    final Offset finishOffset = Offset(
        configuration.size!.width / 3, configuration.size!.height);

    canvas.drawLine(startOffset + offset, finishOffset + offset, paint);
  }
}
