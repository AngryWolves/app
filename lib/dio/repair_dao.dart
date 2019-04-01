import 'dart:io';

import 'package:dio/dio.dart';
import 'package:redux/src/store.dart';
import 'package:smart_park/data/common_response.dart';
import 'package:smart_park/data/upload_file_response.dart';
import 'package:smart_park/dio/base_dao.dart';
import 'package:smart_park/http/api.dart';
import 'package:smart_park/redux/app_state.dart';

class RepairDao extends BaseDao {
  RepairDao(Store<AppState> store) : super(store);

  ///
  /// 更新头像
  ///
  Future<CommonResponse> updateHead({String headImage}) async {
    var response = await client.post(Api.SMART_UPDATE_HEAD,
        headers: {Api.SMART_TOKEN: getToken()},
        data: {Api.SMART_HEAD_IMAGE: headImage});

    var data = response?.data;
    if (data == null) {
      return null;
    }
    return CommonResponse.fromJson(data);
  }

  ///
  /// 上传
  ///
  Future<UploadFileResponse> uploadImage({List<File> files}) async {
    var response = await client.post(Api.SMART_UPLOAD_IMAGE,
        data: FormData.from({
          Api.SMART_FILES: files.map((file) {
            var lastIndexOf = file.path.lastIndexOf(RegExp('/'));
            var name = file.path.substring(lastIndexOf + 1);
            return UploadFileInfo(file, name);
          }).toList()
        }));

    var data = response?.data;
    if (data == null) {
      return null;
    }
    return UploadFileResponse.fromJson(data);
  }

  ///
  /// 创建报修
  ///
  Future<CommonResponse> createRepair(
      {String content, List<String> imageUrl}) async {
    var response = await client.post(Api.SMART_CREATE_REPAIR,
        headers: {Api.SMART_TOKEN: getToken()},
        data: {Api.SMART_CONTENT: content, Api.SMART_IMAGE_URL: imageUrl});

    var model = response?.data;
    if (model == null) {
      return null;
    }
    return CommonResponse.fromJson(model);
  }
}
