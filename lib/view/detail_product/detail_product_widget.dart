import 'package:ecommerce_watch_store/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:ecommerce_watch_store/images.dart';
import 'package:ecommerce_watch_store/model/watch_color.dart';

class DetailProductWidget extends StatefulWidget {
  final int watchId;

  const DetailProductWidget({Key? key, required this.watchId})
      : super(key: key);

  @override
  State<DetailProductWidget> createState() => _DetailProductWidgetState();
}

class _DetailProductWidgetState extends State<DetailProductWidget> {
  final _watchColors = [
    WatchColor(
        id: 1,
        color: const Color.fromRGBO(240, 222, 197, 1),
        name: 'Chalk Pink'),
    WatchColor(
        id: 2,
        color: const Color.fromRGBO(255, 200, 183, 1),
        name: 'Nectarine'),
    WatchColor(
        id: 3,
        color: const Color.fromRGBO(95, 132, 119, 1),
        name: 'Eucalyptus'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const _WatchDetailsSliverAppBarWidget(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(23, 20, 57, 0.04),
                          offset: Offset(0, -4),
                          blurRadius: 35,
                        ),
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Apple Watch Series 7',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                '(With solo loop)',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromRGBO(144, 149, 166, 1),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            '\$799',
                            style: TextStyle(
                                fontSize: 24,
                                color: AppColors.kPrimaryColor,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Colors',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 40,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return const SizedBox();
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(width: 20);
                            },
                            itemCount: _watchColors.length),
                      ),
                      const SizedBox(height: 20),
                      const SizedBox(height: 500),
                      Container(
                        width: double.infinity,
                        height: 71,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color.fromRGBO(135, 67, 255, 1),
                              Color.fromRGBO(65, 54, 241, 1),
                            ],
                          ),
                        ),
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          onPressed: () {},
                          child: const Text(
                            'Add to cart',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _WatchDetailsSliverAppBarWidget extends StatelessWidget {
  const _WatchDetailsSliverAppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _backToWatch() {
      Navigator.of(context).pop();
    }

    return SliverAppBar(
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: SvgPicture.asset(AppImages.arrowLeft),
        tooltip: 'Back',
        onPressed: _backToWatch,
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset(AppImages.heart),
          tooltip: 'Like',
          onPressed: () {},
        ),
      ],
      expandedHeight: 345,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          "assets/images/series7.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
