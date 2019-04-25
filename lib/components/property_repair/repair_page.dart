import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_park/components/property_repair/reserve_succeed_dialog.dart';
import 'package:smart_park/components/property_repair/select_repair_reserve_date.dart';
import 'package:smart_park/components/property_repair/select_repair_type_dialog.dart';
import 'package:smart_park/dio/repair_dao.dart';
import 'package:smart_park/redux/app_state.dart';
import 'package:smart_park/router/navigator_util.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/widget/base/base_state.dart';
import 'package:smart_park/widget/common_app_bar.dart';
import 'package:smart_park/widget/common_gradient_button.dart';
import 'package:smart_park/widget/common_transparent_bottom_dialog.dart';
import 'package:smart_park/widget/modal_bottom_sheet_upload.dart';

const REPAIR_ACTION_TYPE = 1;
const REPAIR_ACTION_RESERVE_DATE = 2;
const REPAIR_ACTION_DETAIL_DATE = 3;

class PropertyRepairPage extends StatefulWidget {
  @override
  _PropertyRepairPageState createState() => _PropertyRepairPageState();
}

class _PropertyRepairPageState extends BaseState<PropertyRepairPage> {
  final TextEditingController _controller = TextEditingController();

  final List<File> _imageFile = [];

  RepairDao _repairDao;

  int length = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _repairDao ??= RepairDao(StoreProvider.of<AppState>(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: buildCommonAppbar(home_action_report_repair, onLeadTop: onBack),
      body: Container(
        color: ColorRes.APP_BACKGROUND,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
//                  _buildRepairAction(),
                  _buildIssueDesc(), _buildAppendPhoto()
                ],
              ),
            ),
            Container(
              margin:
                  const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 40),
              child: GradientButton(repair_action_submit, _handleSubmitTap),
            )
          ],
        ),
      ),
    );
  }

  ///
  /// 提交
  ///
  void _handleSubmitTap() async {
    var content = _controller.text;
    if (content.isEmpty) {
      return;
    }

    showLoading();
    List<String> list;
    if (_imageFile.length > 0) {
      // 上传照片
      var model = await _repairDao.uploadImage(files: _imageFile);
      list = model?.data;
    }
    // 创建报修
    var model = await _repairDao.createRepair(content: content, imageUrl: list);
    hideLoading();
    if (model?.result != 0 && model?.msg != null) {
      Fluttertoast.showToast(msg: model?.msg);
      return;
    } else if (model?.result == 0) {
      showDialog(
          context: context,
          builder: (ctx) => ReserveSucceedDialog(
                goToMyRepair: () {
                  Navigator.pop(context);
                  NavigatorUtil.goRepairs(context, '');
                },
              ));
    }
  }

  ///
  /// 附加照片
  ///
  Widget _buildAppendPhoto() => Container(
        margin: const EdgeInsets.only(top: 10.0),
        padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 10.0),
        height: ScreenUtil().setHeight(107),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildSelectPhotoList(),
            Expanded(
                child: Container(
              alignment: Alignment.centerRight,
              child: Text('$repair_action_photo_hint (${_imageFile.length}/5)',
                  style: TextStyle(
                      color: ColorRes.REPAIR_ISSUE_DETAIL_LIMIT,
                      fontSize: ScreenUtil().setSp(12))),
            ))
          ],
        ),
      );

  ///
  /// 照片选择点击框
  ///
  Widget _buildImageSelector() {
    return GestureDetector(
      onTap: _showImageSelectSheet,
      child: Image.asset(
        'images/ic_repair_append_photo.png',
        width: ScreenUtil().setWidth(60),
        height: ScreenUtil().setWidth(60),
      ),
    );
  }

  ///
  /// 选择图片框
  ///
  Widget _buildSelectPhotoList() {
    return FutureBuilder(
        future: _getImageListData(),
        builder: (_, snapshot) {
          var list = snapshot.data;

          if (snapshot.connectionState == ConnectionState.done &&
              list != null) {
            return Container(
              height: ScreenUtil().setWidth(60),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _getSelectImgItem(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    if (list.length < 5 && index == list.length) {
                      return _buildImageSelector();
                    }
                    return Container(
                      margin: const EdgeInsets.only(right: 8.0),
                      child: Image.file(
                        list[index],
                        fit: BoxFit.fill,
                        width: ScreenUtil().setWidth(60),
                        height: ScreenUtil().setWidth(60),
                      ),
                    );
                  }),
            );
          } else {
            return _buildImageSelector();
          }
        });
  }

  ///
  /// 选择照片列表数量
  ///
  int _getSelectImgItem() {
    if (_imageFile.length == 5) {
      return _imageFile.length;
    } else {
      return _imageFile.length + 1;
    }
  }

  ///
  /// 报修内容描述
  ///
  Widget _buildIssueDesc() => Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.only(top: 10.0),
        height: ScreenUtil().setHeight(150),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: CupertinoTextField(
                onChanged: (text) {
                  setState(() {});
                },
                controller: _controller,
                placeholder: repair_action_issue_desc,
                maxLength: 200,
                maxLines: 5,
                decoration: BoxDecoration(border: Border()),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: Text(
                '(${_controller.text.length}/200)',
                style: TextStyle(
                    color: ColorRes.REPAIR_ISSUE_DETAIL_LIMIT,
                    fontSize: ScreenUtil().setSp(12)),
              ),
            )
          ],
        ),
      );

  ///
  /// 报修类型, 预约日期, 详细时间
  ///
  Widget _buildRepairAction() => Container(
        margin: const EdgeInsets.only(top: 10.0),
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: <Widget>[
            _buildActionItem(repair_action_type, REPAIR_ACTION_TYPE),
            Container(height: 1.0, color: ColorRes.APP_BACKGROUND),
            _buildActionItem(
                repair_action_reserve_date, REPAIR_ACTION_RESERVE_DATE),
            Container(height: 1.0, color: ColorRes.APP_BACKGROUND),
            _buildActionItem(
                repair_action_detail_date, REPAIR_ACTION_DETAIL_DATE),
          ],
        ),
      );

  /// 报修事件 item
  Widget _buildActionItem(String title, int action) => GestureDetector(
        onTap: () {
          _handleActionTap(action);
        },
        child: Container(
          color: Colors.transparent,
          height: ScreenUtil().setHeight(45),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(15),
                    color: ColorRes.GERY_TEXT),
              ),
              Row(
                children: <Widget>[
                  Text(
                    repair_action_select_please,
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(15),
                        color: ColorRes.GERY_TEXT),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                  ),
                  Image.asset(
                    'images/ic_next_arrow.png',
                    width: ScreenUtil().setWidth(8),
                    height: ScreenUtil().setWidth(15),
                    fit: BoxFit.fill,
                  )
                ],
              ),
            ],
          ),
        ),
      );

  ///
  /// 选择照片弹窗
  ///
  void _showImageSelectSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return ModalBottomSheetUpload(
            onPhotoUpload: () {
              _onImageButtonPressed(ImageSource.gallery);
              print('update==== 相册');
            },
            onCameraUpload: () {
              _onImageButtonPressed(ImageSource.camera);
              print('update==== 相机');
            },
          );
        });
  }

  Future<List<File>> _getImageListData() async {
    return _imageFile;
  }

  void _onImageButtonPressed(ImageSource source) async {
    var value = await ImagePicker.pickImage(source: source);
    if (value == null) {
      return;
    }
    _imageFile.add(value);
    setState(() {
      Navigator.pop(context);
    });
  }

  void _handleActionTap(int action) {
    var child;
    switch (action) {
      case REPAIR_ACTION_TYPE:
        // 保修类型
        child = SelectRepairType();
        break;
      case REPAIR_ACTION_RESERVE_DATE:
        // 预约时间
        child = SelectRepairReserveDate();
        break;
      case REPAIR_ACTION_DETAIL_DATE:
        // 详细时间
        break;
    }
    showDialog(
        context: context,
        builder: (_) => CommonTransparentBottomDialog(
              bottomBody: child,
            ));
  }
}
