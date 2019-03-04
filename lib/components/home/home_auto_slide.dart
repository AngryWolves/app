import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeAutoSlideView extends StatefulWidget {
  @override
  _HomeAutoSlideViewState createState() => _HomeAutoSlideViewState();
}

class _HomeAutoSlideViewState extends State<HomeAutoSlideView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(196),
      child: Swiper.children(
        pagination: SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            activeColor: Colors.white,
            color: Colors.grey
          )
        ),
        autoplay: true,
        children: <Widget>[
          CachedNetworkImage(
              imageUrl:
                  'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1016969455,1616988602&fm=26&gp=0.jpg'),
          CachedNetworkImage(
              imageUrl:
                  'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3874051073,3326316711&fm=26&gp=0.jpg'),
          CachedNetworkImage(
              imageUrl:
                  'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=212302549,1755357194&fm=26&gp=0.jpg'),
        ],
        viewportFraction: 0.8,
        scale: 0.9,
      ),
    );
  }
}
