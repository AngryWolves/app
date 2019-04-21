import 'package:redux/src/store.dart';
import 'package:smart_park/components/monitor/data/build_response.dart';
import 'package:smart_park/components/monitor/data/room_response.dart';
import 'package:smart_park/http/api.dart';
import 'package:smart_park/redux/app_state.dart';

import 'base_dao.dart';

class RoomDao extends BaseDao {
  RoomDao(Store<AppState> store) : super(store);

  Future<BuildResponse> getBuild() async {
    var response = await client
        .post(Api.SMART_GET_BUILD, headers: {Api.SMART_TOKEN: getToken()});
    var data = response?.data;
    if (data == null) {
      return null;
    }
    return BuildResponse.fromJson(data);
  }

  Future<RoomResponse> getFloor({String buildName}) async {
    var response = await client.post(Api.SMART_GET_FLOOR,
        headers: {Api.SMART_TOKEN: getToken()},
        data: {Api.SMART_BUILD_NAME: buildName});

    var data = response?.data;
    if (data == null) {
      return null;
    }
    return RoomResponse.fromJson(data);
  }

  Future<RoomResponse> getRoom({String floorId}) async {
    var response = await client.post(Api.SMART_GET_ROOM,
        headers: {Api.SMART_TOKEN: getToken()},
        data: {Api.SMART_FLOOR_ID: floorId});
    var data = response?.data;
    if (data == null) {
      return null;
    }
    return RoomResponse.fromJson(data);
  }
}
