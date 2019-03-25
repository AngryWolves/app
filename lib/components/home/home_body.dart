import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:smart_park/components/home/data/home_new_response.dart';
import 'package:smart_park/components/home/home_body_list_head.dart';
import 'package:smart_park/components/home/home_list_notice_item.dart';
import 'package:smart_park/dio/home_dao.dart';
import 'package:smart_park/redux/app_state.dart';
import 'package:smart_park/widget/base/refresh_list_view.dart';

class HomeBodyView extends StatefulWidget {
  @override
  _HomeBodyViewState createState() => _HomeBodyViewState();
}

class _HomeBodyViewState extends RefreshListView<HomeBodyView, HomeNewData> {
  HomeDao _homeDao;

  @override
  Widget buildItem(HomeNewData data) {
    return HomeNoticeItem(
      data: data,
    );
  }

  @override
  Future<List<HomeNewData>> requestData(int page) async {
    _homeDao ??= HomeDao(StoreProvider.of<AppState>(context));

    var model = await _homeDao.getHomeNews(page: page);

    return model?.data;
  }

  @override
  Widget buildHead() {
    return HomeBodyListHead();
  }
}
