import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:smart_park/components/reserve/data/yard_response.dart';
import 'package:smart_park/dio/reserve_dao.dart';
import 'package:smart_park/redux/app_state.dart';
import 'package:smart_park/widget/base/refresh_list_view.dart';


abstract class BaseYardList<S extends StatefulWidget>
    extends RefreshListView<S, YardData> {

  ReserveDao _reserveDao;

  @override
  Future<List<YardData>> requestData(int page) async {
    _reserveDao ??= ReserveDao(StoreProvider.of<AppState>(context));

    var model = await _reserveDao.getYardList(type: getType());
    return model?.data;
  }

  @protected
  int getType();

}
