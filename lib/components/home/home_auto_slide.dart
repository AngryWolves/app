import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:smart_park/components/home/data/home_ads_image_response.dart';
import 'package:smart_park/dio/home_dao.dart';
import 'package:smart_park/redux/app_state.dart';
import 'package:smart_park/router/navigator_util.dart';

class HomeAutoSlideView extends StatefulWidget {
  @override
  _HomeAutoSlideViewState createState() => _HomeAutoSlideViewState();
}

class _HomeAutoSlideViewState extends State<HomeAutoSlideView> {
  HomeDao _homeDao;

  List<AdsImagesData> _list;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _getPictures();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(196),
      child: Swiper.children(
        pagination: SwiperPagination(
            builder: DotSwiperPaginationBuilder(
                activeColor: Colors.white, color: Colors.grey)),
        autoplay: true,
        children: _buildChild(),
        viewportFraction: 0.8,
        scale: 0.9,
      ),
    );
  }

  List<Widget> _buildChild() {
    if (_list == null || _list.isEmpty) {
      return [Container()];
    }
    return _list.map((value) {
      return GestureDetector(
        onTap: () {
          debugPrint('tap link == ${value.link}');
          NavigatorUtil.goWebPage(context, value.link);
        },
        child: CachedNetworkImage(
          imageUrl: value.path ?? '',
          width: ScreenUtil().setWidth(340),
          height: ScreenUtil().setHeight(160),
          fit: BoxFit.fill,
        ),
      );
    }).toList();
  }

  void _getPictures() async {
    if (_homeDao == null) {
      _homeDao ??= HomeDao(StoreProvider.of<AppState>(context));
      _list = (await _homeDao.getHomePictures())?.data;
      if (_list != null && mounted) {
        setState(() {});
      }
    }
  }
}
