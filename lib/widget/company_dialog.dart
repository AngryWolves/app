import 'package:flutter/material.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:common_utils/common_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:smart_park/values/colors.dart';
import 'package:smart_park/values/strings.dart';
import 'package:smart_park/utils/input_manage_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:common_utils/common_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_park/widget/common_app_bar.dart';
import 'package:smart_park/widget/gender_dialog.dart';
import 'package:flutter/services.dart';
import 'package:smart_park/dio/user_dao.dart';
import 'package:smart_park/redux/app_state.dart';
import 'package:smart_park/widget/company_list_dialog.dart';
import 'package:smart_park/widget/base/base_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:smart_park/data/response_successful_data.dart';
import 'package:smart_park/config/routes.dart';
import 'package:smart_park/widget/company_dialog.dart';
import 'package:smart_park/data/common_response.dart';
//新建公司Dialog/

class CompanyDialog extends StatefulWidget {
  CompanyDialog({Key key, this.groupValue = 1, this.onSureState})
      : super(key: key);
  final int groupValue;
  final Function onSureState;

  @override
  State<StatefulWidget> createState() {
    return _CompanyDialogState();
  }
}

class _CompanyDialogState extends BaseState<CompanyDialog> {
  TextEditingController _companyController = TextEditingController();
  UserDao _dao;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context); //关闭对话框
      },
      child: Material(
        ////创建透明层
        type: MaterialType.transparency, //透明类型
        child: GestureDetector(
          onTap: () {},
          child: Center(
            child: Container(
              width: ScreenUtil().setWidth(270),
              height: ScreenUtil().setHeight(137),
              padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(15),
                  right: ScreenUtil().setWidth(15),
                  top: ScreenUtil().setHeight(20)),
              decoration: ShapeDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    registered_third_company_dialog_title,
                    style: TextStyle(
                        color: Color.fromRGBO(46, 49, 56, 1),
                        fontSize: ScreenUtil().setSp(15)),
                  ),
                  _buildChangeNameWidget(),
                  _buildButtonWidget()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChangeNameWidget() {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(15)),
      padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(11), right: ScreenUtil().setWidth(11)),
      decoration: new BoxDecoration(
        border: Border.all(width: 1.0, color: Color.fromRGBO(177, 177, 179, 1)),
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(3.0)),
      ),
      height: ScreenUtil().setHeight(35),
      alignment: Alignment.centerLeft,
      child: TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(bottom: ScreenUtil().setHeight(0)),
            hintText: '请输入公司名称',
            hintStyle: TextStyle(
                color: ColorRes.COLOR_LOGIN_HINT,
                fontSize: ScreenUtil().setSp(12))),
        onChanged: (text) {
          _companyController.text = text;
          //内容改变的回调
//                    print('change');
        },
        onSubmitted: (text) {
          //内容提交(按回车)的回调
//                    print('submit');
        },
        controller: TextEditingController(text: _companyController.text),
        keyboardType: TextInputType.text,
        //显示的文字内容为 下一步
        style: TextStyle(
            color: Color.fromRGBO(46, 49, 56, 1),
            fontSize: ScreenUtil().setSp(12)),
//          maxLength: 11,
        //最大长度，设置此项会让TextField右下角有一个输入数量的统计字符串
        //这种情况一般是不符合我们设计的要求的，但是有需要限制其输入的位数
        inputFormatters: [LengthLimitingTextInputFormatter(8)],
        maxLines: 1,

        //最大行数
        autocorrect: false,
        //是否自动更正
        autofocus: false,
        //是否自动对焦
        obscureText: false,
        //是否是密码
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget _buildButtonWidget() {
    return Expanded(
        child: Container(
//          color: Colors.red,
          alignment: Alignment.centerRight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pop(context); //关闭对话框
                },
                child: Text(
                  permissions_company_dialog_cancel_text,
                  style: TextStyle(
                      color: Color.fromRGBO(37, 184, 247, 1),
                      fontSize: ScreenUtil().setSp(13)),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(right: ScreenUtil().setWidth(30))),
              GestureDetector(
                onTap: () {
                  String company = _companyController.text;
                  if (ObjectUtil.isEmptyString(company)) {
                    Fluttertoast.showToast(msg: '请输入公司名称');
                    return;
                  }
                  _createCompany(company);

                },
                child: Text(
                  permissions_company_dialog_determine_text,
                  style: TextStyle(
                      color: Color.fromRGBO(37, 184, 247, 1),
                      fontSize: ScreenUtil().setSp(13)),
                ),
              )
            ],
          ),
        ),
        flex: 1);
  }
  void _createCompany(String company) async{
    _dao ??= UserDao(StoreProvider.of<AppState>(context));
    CommonResponse response= await _dao.createCompany(company);
    if(response?.result==0){
      Navigator.pop(context); //关闭对话框
      if (widget.onSureState != null) {
        widget.onSureState();
      }
    }else{
      Fluttertoast.showToast(msg: response?.msg);
    }
  }
}
